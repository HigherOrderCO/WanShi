# This file implements a simple term-rewritting system, from LHS's to RHS's, a la HVM1
# For example, a valid program is:
#   (add Z     b) = b
#   (add (S a) b) = (S (add a b))
#   (mul Z     b) = Z
#   (mul (S a) b) = (add b (mul a b))
# It then proceeds to ask: is `(mul 10 20) == (mul 20 10)` by creating a
# complete reduction tree of both sides, and then comparing. Naively, this
# takes a lot of time. If we enable the mul-comm rule:
#   (mul a b) = (mul b a)
# It becomes instantaneous.
# 
# Context:
# - https://discord.com/channels/912426566838013994/1350147396654596116/1396915434741305367
# - https://discord.com/channels/767397347218423858/767397347218423861/1396923806768959619
# "is there any proof lang capable of checking that `mul(1m,1m+1)==mul(1m+1,1m)` by refl quickly?"

type Term:
  case @Ctr:
    nm: String
    xs: Term[]
  case @Var:

def TermF(N: Nat, T: Set) -> Set:
  match N:
    case 0n:
      T
    case 1n + N:
      Term -> TermF(N, T)

def RHS(N: Nat) -> Set:
  TermF(N, Term)

def Subs(N: Nat) -> Set:
  all P: Set.
  all k: TermF(N, P).
  P

type Rule:
  case @Rule:
    lhs: Term
    rhs: RHS(Vars(lhs))

def Book : Set =
  Rule[]

def Vars(t: Term) -> Nat:
  match t:
    case @Ctr{nm,xs}:
      VarsMany(xs)
    case @Var:
      1n

def VarsMany(ts: Term[]) -> Nat:
  match ts:
    case []:
      0n
    case t <> ts:
      Nat/add(Vars(t), VarsMany(ts))

def TermF/add(A: Nat, B: Nat, P: Set) -> Set{TermF(Nat/add(A,B),P) == TermF(A, TermF(B, P))}:
  match A:
    case 0n:
      finally
    case 1n + A:
      rewrite TermF/add(A, B, P)
      finally

def when<A>(b: Bool, x: A) -> A:
  if b:
    x
  else:
    *

def sp0(x: U64) -> U64:
  return ((x * 16293) + 1) % 65536

def sp1(x: U64) -> U64:
  return ((x * 32677) + 3) % 65536

def show(t: Term) -> String:
  match t:
    case @Ctr{nm,ts}:
      String/flat(["@",nm,"{",show_many(ts),"}"])
    case @Var:
      "X"

def show_many(ts: Term[]) -> String:
  match ts:
    case []:
      ""
    case t <> ts:
      String/append(show(t),show_many(ts))
  
def mat(p: Term, t: Term) -> Maybe<Subs(Vars(p))>:
  match p:
    with t
    case @Ctr{p_nm,p_xs}:
      match t:
        case @Ctr{t_nm,t_xs}:
          match String/equal(p_nm,t_nm):
            case True:
              mats(p_xs,t_xs)
            case False:
              @None
        case @Var:
          @None
    case @Var:
      @Some{λP. λk. k(t)}

def mats(ps: Term[], ts: Term[]) -> Maybe<Subs(VarsMany(ps))>:
  match ps:
    with ts
    case []:
      match ts: 
        case []:
          @Some{λP. λk. k}
        case t <> ts:
          @None
    case p <> ps:
      match ts:
        case []:
          @None
        case t <> ts:
          match mat(p,t):
            case @None:
              @None
            case @Some{pt}:
              match mats(ps,ts):
                case @None:
                  @None
                case @Some{psts}:
                  @Some{λP. λk.
                    rewrite TermF/add(Vars(p), VarsMany(ps), P)
                    k0 = pt(TermF(VarsMany(ps),P), k)
                    k1 = psts(P, k0)
                    k1}

def reduce(L: U64, B: Book, t: Term) -> Term[]:
  match B:
    case []:
      []
    case R <> B:
      @Rule{lhs,rhs} = R
      match mat(lhs, t):
        with B
        with t
        case @None:
          reduce(L, B, t)
        case @Some{subs}:
          subs(Term, rhs) <> reduce(L, B, t)

def whnf(L: U64, B: Book, t: Term) -> Term:
  match reduce(L, B, t):
    case []:
      t
    case t <> ts:
      whnf(L, B, join(L, t <> ts))

def join(L: U64, ts: Term[]) -> Term:
  match ts:
    case []:
      *
    case t0 <> ts: 
      match ts:
        with t0
        case []:
          t0
        case t1 <> ts:
          fork L:
            t0
          else:
            join(L+1, t1 <> ts)

def normal(L: U64, B: Book, t: Term) -> Term:
  match whnf(L, B, t):
    case @Ctr{nm, xs}:
      @Ctr{nm, normal_many(L, B, xs)}
    case @Var:
      @Var

def normal_many(L: U64, B: Book, ts: Term[]) -> Term[]:
  match ts:
    case []:
      []
    case t <> ts:
      normal(L, B, t) <> normal_many(L, B, ts)


#T -> [T0,T1,T2]

def rtree(L: U64, B: Book, t: Term) -> Term:
  fork L:
    t
  else:
    nf = join(L, reduce(L, B, t))
    fork L:
      match nf:
        case @Ctr{nm, xs}:
          @Ctr{nm, rtree_many(L, B, xs)}
        case @Var:
          @Var
    else:
      rtree(L, B, nf)

def rtree_many(L: U64, B: Book, ts: Term[]) -> Term[]:
  match ts:
    case []:
      []
    case t <> ts:
      rtree(sp0(L), B, t) <> rtree_many(sp1(L), B, ts)

def equal(x: Term, y: Term) -> Bool:
  match x:
    with y
    case @Ctr{x_nm,x_xs}:
      match y:
        case @Ctr{y_nm,y_xs}:
          if String/equal(x_nm, y_nm):
            equal_many(x_xs, y_xs)
          else:
            False
        case @Var:
          False
    case @Var:
      match y:
        case @Ctr{y_nm,y_xs}:
          False
        case @Var:
          True

def equal_many(xs: Term[], ys: Term[]) -> Bool:
  match xs:
    with ys
    case []:
      match ys:
        case []:
          True
        case y <> ys:
          False
    case x <> xs:
      match ys:
        case []:
          False
        case y <> ys:
          if equal(x, y):
            equal_many(xs, ys)
          else:
            False


def NN(N: Nat) -> Term:
  match N:
    case 0n:
      @Ctr{"Z",[]}
    case 1n + N:
      @Ctr{"S",[NN(N)]}

def main : String =
  # (add Z     b) = b
  # (add (S a) b) = (S (add a b))
  # (mul Z     b) = Z
  # (mul (S a) b) = (add b (mul a b))
  # (mul a b) = (mul b a)
  book = [
    @Rule{@Ctr{"add", [@Ctr{"Z",[]    }, @Var]},     λb. b},
    @Rule{@Ctr{"add", [@Ctr{"S",[@Var]}, @Var]}, λa. λb. @Ctr{"S", [@Ctr{"add", [a, b]}]}},
    @Rule{@Ctr{"mul", [@Ctr{"Z",[]    }, @Var]},     λb. @Ctr{"Z",[]}},
    @Rule{@Ctr{"mul", [@Ctr{"S",[@Var]}, @Var]}, λa. λb. @Ctr{"add", [b, @Ctr{"mul", [a, b]}]}},
    # takes millions of interactions (>1s) without the line below ↓
    @Rule{@Ctr{"mul", [@Var, @Var]}, λa. λb. @Ctr{"mul", [b, a]}},
  ] :: Book
  term = @Ctr{"mul", [NN(2n), NN(3n)]} :: Term
  #term = normal(0, book, term)
  #term
  #show(rtree(1, book, term))

  a = rtree(1, book, @Ctr{"mul", [NN(10n), NN(20n)]})
  b = rtree(2, book, @Ctr{"mul", [NN(20n), NN(10n)]})
  when<String>(equal(a, b), String/flat([show(a)," == ",show(b)]))
