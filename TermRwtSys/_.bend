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

def whnf(B: Book, t: Term) -> Term:
  match B:
    with t
    case []:
      t
    case R <> B:
      @Rule{lhs,rhs} = R
      match mat(lhs, t):
        case @None:
          whnf(B, t)
        case @Some{subs}:
          whnf(B, subs(Term, rhs))

def normal(B: Book, t: Term) -> Term:
  match whnf(B, t):
    case @Ctr{nm, xs}:
      @Ctr{nm, normal_many(B, xs)}
    case @Var:
      @Var

def normal_many(B: Book, ts: Term[]) -> Term[]:
  match ts:
    case []:
      []
    case t <> ts:
      normal(B, t) <> normal_many(B, ts)

def main : Term =
  book = [
    @Rule{@Ctr{"add", [@Ctr{"Z",[]    }, @Var]},     λb. b},
    @Rule{@Ctr{"add", [@Ctr{"S",[@Var]}, @Var]}, λa. λb. @Ctr{"S", [@Ctr{"add", [a, b]}]}},
  ] :: Book
  term = @Ctr{"add", [@Ctr{"S",[@Ctr{"S",[@Ctr{"Z",[]}]}]}, @Ctr{"S",[@Ctr{"S",[@Ctr{"Z",[]}]}]}]} :: Term
  term = normal(book, term)
  term
