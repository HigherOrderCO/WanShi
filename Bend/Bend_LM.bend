# Type
# ----

type Term:
  # Variables
  case @Var: # x
    k: String
    i: Nat
  case @Sub: # x
    t: Term

  # Definitions
  case @Let: # let x : T = v; f
    k: String
    T: Term
    v: Term
    f: Term -> Term

  # Fixed Point
  case @Fix: # μx. f
    k: String
    f: Term -> Term

  # Universe
  case @Set: # Set

  # Function
  case @All: # ∀x:A.B
    k: String
    a: Term
    b: Term -> Term
  case @Lam: # λx.f
    k: String
    f: Term -> Term
  case @App: # (f x)
    f: Term
    x: Term

  # Empty
  case @Emp:  # Empty
  case @EmpM: # λ{}

  # Unit
  case @Uni:  # Unit
  case @One:  # ()
  case @UniM: # λ{ (): f }
    f: Term

  # Bool
  case @Bit:  # Bool
  case @Bt0:  # False
  case @Bt1:  # True
  case @BitM: # λ{ #0: f ; #1: t }
    f: Term
    t: Term

  # Nat
  case @Nat: # Nat
  case @Zer: # 0
  case @Suc: # ↑n
    n: Term
  case @NatM: # λ{ 0: z ; ↑: s }
    z: Term
    s: Term

  # List
  case @Lst: # T[]
    t: Term
  case @Nil: # []
  case @Con: # h<>t
    h: Term
    t: Term
  case @LstM: # λ{ []: n ; <>: c }
    n: Term
    c: Term

  # Pair
  case @Sig: # Σx:A.B
    k: String
    a: Term
    b: Term -> Term
  case @Tup: # (a,b)
    a: Term
    b: Term
  case @SigM: # λ{ (,): f }
    f: Term

  # Equality
  case @Eql: # T{a == b}
    t: Term
    a: Term
    b: Term
  case @Rfl: # {==}
  case @EqlM: # λ{ {==}: f } : T
    f: Term
    T: Term

  # Util
  case @Rwt:
    a: Term
    b: Term
    x: Term

# Stringification
# ---------------

def show(term: Term) -> String:
  match term:
    case @Let{k, T, v, f}:
      return String/flat(["let ",k," : ",show(T)," = ",show(v),"; ",show(f(@Var{k,0n}))])
    case @Var{k, i}:
      return k
    case @Sub{t}:
      return show(t)
    case @Fix{k, f}:
      return String/flat(["μ",k,".",show(f(@Var{k,0n}))])
    case @Set:
      return "Set"
    case @All{k, a, b}:
      return String/flat(["∀",k,":",show(a),".",show(b(@Var{k,0n}))])
    case @Lam{k, f}:
      return String/flat(["λ",k,".",show(f(@Var{k,0n}))])
    case @App{f, x}:
      return String/flat(["(",show(f)," ",show(x),")"])
    case @Emp:
      return "Empty"
    case @EmpM:
      return "λ{}"
    case @Uni:
      return "Unit"
    case @One:
      return "()"
    case @UniM{f}:
      return String/flat(["λ{():",show(f),"}"])
    case @Bit:
      return "Bool"
    case @Bt0:
      return "False"
    case @Bt1:
      return "True"
    case @BitM{f, t}:
      return String/flat(["λ{#0:",show(f),";#1:",show(t),"}"])
    case @Nat:
      return "Nat"
    case @Zer:
      return "0"
    case @Suc{n}:
      return String/flat(["↑",show(n)])
    case @NatM{z, s}:
      return String/flat(["λ{0:",show(z),";↑:",show(s),"}"])
    case @Lst{t}:
      return String/flat([show(t),"[]"])
    case @Nil:
      return "[]"
    case @Con{h, t}:
      return String/flat([show(h),"<>",show(t)])
    case @LstM{n, c}:
      return String/flat(["λ{[]:",show(n),";<>:",show(c),"}"])
    case @Sig{k, a, b}:
      return String/flat(["Σ",k,":",show(a),".",show(b(@Var{k,0n}))])
    case @Tup{a, b}:
      return String/flat(["(",show(a),",",show(b),")"])
    case @SigM{f}:
      return String/flat(["λ{(,):",show(f),"}"])
    case @Eql{t, a, b}:
      return String/flat([show(t),"{",show(a),"==",show(b),"}"])
    case @Rfl:
      return "{==}"
    case @EqlM{f, T}:
      return String/flat(["λ{{==}:",show(f),"} : ",show(T)])
    case @Rwt{a, b, x}:
      return String/flat(["rewrite ",show(a)," by ",show(b)," in ",show(x)])

# Evaluator
# ---------

def whnf(term: Term) -> Term:
  match term:
    case @Let{k, T, v, f}:
      whnf_let(k, T, v, f)
    case @Fix{k, f}:
      whnf_fix(k, f)
    case @App{f, x}:
      whnf_app(f, x)
    case x:
      x

def whnf_let(k: String, T: Term, v: Term, f: Term -> Term) -> Term:
  whnf(f(v))

def whnf_fix(k: String, f: Term -> Term) -> Term:
  whnf(f(@Fix{k, f}))

def whnf_app(f: Term, x: Term) -> Term:
  match whnf(f):
    case @Lam{k, f}:
      whnf(f(whnf(x)))
    case @EmpM:
      match whnf(x):
        case x:
          @App{@EmpM, x}
    case @UniM{f}:
      match whnf(x):
        case @One:
          whnf(f)
        case x:
          @App{@UniM{f}, x}
    case @BitM{f, t}:
      match whnf(x):
        case @Bt0:
          whnf(f)
        case @Bt1:
          whnf(t)
        case x:
          @App{@BitM{f, t}, x}
    case @NatM{z, s}:
      match whnf(x):
        case @Zer:
          whnf(z)
        case @Suc{n}:
          whnf(@App{s, whnf(n)})
        case x:
          @App{@NatM{z, s}, x}
    case @LstM{n, c}:
      match whnf(x):
        case @Nil:
          whnf(n)
        case @Con{h, t}:
          whnf(@App{@App{c, whnf(h)}, whnf(t)})
        case x:
          @App{@LstM{n, c}, x}
    case @SigM{f}:
      match whnf(x):
        case @Tup{a, b}:
          whnf(@App{@App{f, whnf(a)}, whnf(b)})
        case x:
          @App{@SigM{f}, x}
    case @EqlM{f,T}:
      match whnf(x):
        case @Rfl:
          whnf(f)
        case x:
          @App{@EqlM{f,T}, x}
    case f:
      @App{f, x}

# Equal
# -----

def equal(d: Nat, a: Term, b: Term) -> Bool:
  eql(2, d, a, b)

def eql(lv: U64, d: Nat, a: Term, b: Term) -> Bool:
  if lv === 0:
    cmp(0, d, whnf(a), whnf(b))
  else:
    eql(0, d, a, b) or cmp(lv, d, whnf(a), whnf(b))

def cmp(lv: U64, d: Nat, a: Term, b: Term) -> Bool:
  match a b:
    case @Var{a_k, a_i} @Var{b_k, b_i}:
      e_i = Nat/eq(a_i, b_i)
      e_i
    case @Sub{a_t} @Sub{b_t}:
      e_t = eql(lv, d, a_t, b_t)
      e_t
    case @Let{a_k, a_T, a_v, a_f} @Let{b_k, b_T, b_v, b_f}:
      e_v = eql(lv, d, a_v, b_v)
      e_f = eql(lv, 1n+d, a_f(@Var{a_k, d}), b_f(@Var{b_k, d}))
      e_v and e_f
    case @Fix{a_k, a_f} @Fix{b_k, b_f}:
      e_f = eql(lv, 1n+d, a_f(@Var{a_k, d}), b_f(@Var{b_k, d}))
      e_f
    case @Set @Set:
      True
    case @All{a_k, a_a, a_b} @All{b_k, b_a, b_b}:
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, 1n+d, a_b(@Var{a_k, d}), b_b(@Var{b_k, d}))
      e_a and e_b
    case @Lam{a_k, a_f} @Lam{b_k, b_f}:
      e_f = eql(lv, 1n+d, a_f(@Var{a_k, d}), b_f(@Var{b_k, d}))
      e_f
    case @App{a_f, a_x} @App{b_f, b_x}:
      e_f = eql(lv, d, a_f, b_f)
      e_x = eql(lv, d, a_x, b_x)
      e_f and e_x
    case @Emp @Emp:
      True
    case @EmpM @EmpM:
      True
    case @Uni @Uni:
      True
    case @One @One:
      True
    case @UniM{a_f} @UniM{b_f}:
      e_f = eql(lv, d, a_f, b_f)
      e_f
    case @Bit @Bit:
      True
    case @Bt0 @Bt0:
      True
    case @Bt1 @Bt1:
      True
    case @BitM{a_f, a_t} @BitM{b_f, b_t}:
      e_f = eql(lv, d, a_f, b_f)
      e_t = eql(lv, d, a_t, b_t)
      e_f and e_t
    case @Nat @Nat:
      True
    case @Zer @Zer:
      True
    case @Suc{a_n} @Suc{b_n}:
      e_n = eql(lv, d, a_n, b_n)
      e_n
    case @NatM{a_z, a_s} @NatM{b_z, b_s}:
      e_z = eql(lv, d, a_z, b_z)
      e_s = eql(lv, d, a_s, b_s)
      e_z and e_s
    case @Lst{a_t} @Lst{b_t}:
      e_t = eql(lv, d, a_t, b_t)
      e_t
    case @Nil @Nil:
      True
    case @Con{a_h, a_t} @Con{b_h, b_t}:
      e_h = eql(lv, d, a_h, b_h)
      e_t = eql(lv, d, a_t, b_t)
      e_h and e_t
    case @LstM{a_n, a_c} @LstM{b_n, b_c}:
      e_n = eql(lv, d, a_n, b_n)
      e_c = eql(lv, d, a_c, b_c)
      e_n and e_c
    case @Sig{a_k, a_a, a_b} @Sig{b_k, b_a, b_b}:
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, 1n+d, a_b(@Var{a_k, d}), b_b(@Var{b_k, d}))
      e_a and e_b
    case @Tup{a_a, a_b} @Tup{b_a, b_b}:
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, d, a_b, b_b)
      e_a and e_b
    case @SigM{a_f} @SigM{b_f}:
      e_f = eql(lv, d, a_f, b_f)
      e_f
    case @Eql{a_t, a_a, a_b} @Eql{b_t, b_a, b_b}:
      e_t = eql(lv, d, a_t, b_t)
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, d, a_b, b_b)
      e_t and e_a and e_b
    case @Rfl @Rfl:
      True
    case @EqlM{a_f, a_T} @EqlM{b_f, b_T}:
      e_f = eql(lv, d, a_f, b_f)
      e_T = eql(lv, d, a_T, b_T)
      e_f and e_T
    case @Rwt{a_a, a_b, a_x} @Rwt{b_a, b_b, b_x}:
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, d, a_b, b_b)
      e_x = eql(lv, d, a_x, b_x)
      e_a and e_b and e_x
    case _ _:
      False

# Replace
# -------

# Rewrites 'old' by 'neo' in 'val'
def replace(lv: U64, d: Nat, old: Term, neo: Term, val: Term) -> Term:
  if equal(d, old, val):
    neo
  else:
    match whnf(val):
      case @Var{k, i}:
        @Var{k, i}
      case @Sub{t}:
        t
      case @Let{k, T, v, f}:
        replace(lv, d, old, neo, f(v))
      case @Fix{k, f}:
        @Emp
      case @Set:
        @Set
      case @All{k, a, b}:
        r_a = replace(lv, d, old, neo, a)
        r_b = (λx. replace(lv, 1n+d, old, neo, b(x))) :: Term -> Term
        @All{k, r_a, r_b}
      case @Lam{k, f}:
        @Lam{k, f}
      case @App{f, x}:
        r_f = replace(lv, d, old, neo, f)
        r_x = replace(lv, d, old, neo, x)
        @App{r_f, r_x}
      case @Emp:
        @Emp
      case @EmpM:
        @EmpM
      case @Uni:
        @Uni
      case @One:
        @One
      case @UniM{f}:
        r_f = replace(lv, d, old, neo, f)
        @UniM{r_f}
      case @Bit:
        @Bit
      case @Bt0:
        @Bt0
      case @Bt1:
        @Bt1
      case @BitM{f, t}:
        r_f = replace(lv, d, old, neo, f)
        r_t = replace(lv, d, old, neo, t)
        @BitM{r_f, r_t}
      case @Nat:
        @Nat
      case @Zer:
        @Zer
      case @Suc{n}:
        r_n = replace(lv, d, old, neo, n)
        @Suc{r_n}
      case @NatM{z, s}:
        r_z = replace(lv, d, old, neo, z)
        r_s = replace(lv, d, old, neo, s)
        @NatM{r_z, r_s}
      case @Lst{t}:
        r_t = replace(lv, d, old, neo, t)
        @Lst{r_t}
      case @Nil:
        @Nil
      case @Con{h, t}:
        r_h = replace(lv, d, old, neo, h)
        r_t = replace(lv, d, old, neo, t)
        @Con{r_h, r_t}
      case @LstM{n, c}:
        r_n = replace(lv, d, old, neo, n)
        r_c = replace(lv, d, old, neo, c)
        @LstM{r_n, r_c}
      case @Sig{k, a, b}:
        r_a = replace(lv, d, old, neo, a)
        r_b = (λx. replace(lv, 1n+d, old, neo, b(x))) :: Term -> Term
        @Sig{k, r_a, r_b}
      case @Tup{a, b}:
        r_a = replace(lv, d, old, neo, a)
        r_b = replace(lv, d, old, neo, b)
        @Tup{r_a, r_b}
      case @SigM{f}:
        r_f = replace(lv, d, old, neo, f)
        @SigM{r_f}
      case @Eql{t, a, b}:
        r_t = replace(lv, d, old, neo, t)
        r_a = replace(lv, d, old, neo, a)
        r_b = replace(lv, d, old, neo, b)
        @Eql{r_t, r_a, r_b}
      case @Rfl:
        @Rfl
      case @EqlM{f, T}:
        r_f = replace(lv, d, old, neo, f)
        r_T = replace(lv, d, old, neo, T)
        @EqlM{r_f, r_T}
      case @Rwt{a, b, x}:
        r_a = replace(lv, d, old, neo, a)
        r_b = replace(lv, d, old, neo, b)
        r_x = replace(lv, d, old, neo, x)
        @Rwt{r_a, r_b, r_x}
        
# Check
# -----

def infer(d: Nat, ctx: Term[], term: Term) -> Maybe<Term>:
  match term:
    case @Var{k, i}:
      List/get<Term>(ctx, i)
    case @Sub{t}:
      infer(d, ctx, t)
    case @Let{k, T, v, f}:
      match check(d, ctx, v, T):
        case @None:
          @None
        case @Some{_}:
          infer(d, List/append<Term>(ctx,[T]), f(@Var{k, d}))
    case @Fix{k, f}:
      @None
    case @Set:
      @Some{@Set}
    case @All{k, a, b}:
      match check(d, ctx, a, @Set):
        case @None:
          @None
        case @Some{_}:
          match check(1n+d, List/append<Term>(ctx,[a]), b(@Var{k, d}), @Set):
            case @None:
              @None
            case @Some{_}:
              @Some{@Set}
    case @Lam{k, f}:
      @None
    case @App{f, x}:
      match infer(d, ctx, f):
        case @None:
          @None
        case @Some{f_type}:
          match whnf(f_type):
            case @All{k, a, b}:
              match check(d, ctx, x, a):
                case @None:
                  @None
                case @Some{_}:
                  @Some{b(x)}
            case _:
              @None
    case @Emp:
      @Some{@Set}
    case @EmpM:
      @None
    case @Uni:
      @Some{@Set}
    case @One:
      @Some{@Uni}
    case @UniM{f}:
      @None
    case @Bit:
      @Some{@Set}
    case @Bt0:
      @Some{@Bit}
    case @Bt1:
      @Some{@Bit}
    case @BitM{f, t}:
      @None
    case @Nat:
      @Some{@Set}
    case @Zer:
      @Some{@Nat}
    case @Suc{n}:
      match check(d, ctx, n, @Nat):
        case @None:
          @None
        case @Some{_}:
          @Some{@Nat}
    case @NatM{z, s}:
      @None
    case @Lst{t}:
      match check(d, ctx, t, @Set):
        case @None:
          @None
        case @Some{_}:
          @Some{@Set}
    case @Nil:
      @None
    case @Con{h, t}:
      @None
    case @LstM{n, c}:
      @None
    case @Sig{k, a, b}:
      match check(d, ctx, a, @Set):
        case @None:
          @None
        case @Some{_}:
          match check(1n+d, List/append<Term>(ctx,[a]), b(@Var{k, d}), @Set):
            case @None:
              @None
            case @Some{_}:
              @Some{@Set}
    case @Tup{a, b}:
      @None
    case @SigM{f}:
      @None
    case @Eql{t, a, b}:
      match check(d, ctx, t, @Set):
        case @None:
          @None
        case @Some{_}:
          match check(d, ctx, a, t):
            case @None:
              @None
            case @Some{_}:
              match check(d, ctx, b, t):
                case @None:
                  @None
                case @Some{_}:
                  @Some{@Set}
    case @Rfl:
      @None
    case @EqlM{f, T}:
      @None
    case @Rwt{a, b, x}:
      @None # TODO

def check(d: Nat, ctx: Term[], term: Term, goal: Term) -> Maybe<Unit>:
  match goal:
    case @Rwt{a,b,goal}:
      new_ctx  = List/map<Term,Term>(ctx, λx. replace(1, d, a, b, x))
      new_goal = replace(1, d, a, b, goal)
      check(d, new_ctx, term, new_goal)
    case goal:
      match term:
        # Let
        case @Let{k, T, v, f}:
          match check(d, ctx, v, T):
            case @None:
              @None
            case @Some{_}:
              check(1n+d, List/append<Term>(ctx, [T]), f(@Var{k, d}), goal)
        # Lambda
        case @Lam{k, f}:
          match whnf(goal):
            case @All{g_k, a, b}:
              check(1n+d, List/append<Term>(ctx, [a]), f(@Var{k, d}), b(@Var{g_k, d}))
            case _:
              @None
        # Unit
        case @One:
          match whnf(goal):
            case @Uni:
              @Some{()}
            case _:
              @None
        # Bool
        case @Bt0:
          match whnf(goal):
            case @Bit:
              @Some{()}
            case _:
              @None
        case @Bt1:
          match whnf(goal):
            case @Bit:
              @Some{()}
            case _:
              @None
        # Nat
        case @Zer:
          match whnf(goal):
            case @Nat:
              @Some{()}
            case _:
              @None
        case @Suc{n}:
          match whnf(goal):
            case @Nat:
              check(d, ctx, n, @Nat)
            case _:
              @None
        # List
        case @Nil:
          match whnf(goal):
            case @Lst{_}:
              @Some{()}
            case _:
              @None
        case @Con{h, t}:
          match whnf(goal):
            case @Lst{T}:
              match check(d, ctx, h, T):
                case @None:
                  @None
                case @Some{_}:
                  check(d, ctx, t, @Lst{T})
            case _:
              @None
        # Empty Match
        case @EmpM:
          match whnf(goal):
            case @All{k, a, b}:
              match whnf(a):
                case @Emp:
                  @Some{()}
                case _:
                  @None
            case _:
              @None
        # Unit Match
        case @UniM{f}:
          match whnf(goal):
            case @All{k, a, b}:
              match whnf(a):
                case @Uni:
                  check(d, ctx, f, b(@One))
                case _:
                  @None
            case _:
              @None
        # Bool Match
        case @BitM{f, t}:
          match whnf(goal):
            case @All{k, a, b}:
              match whnf(a):
                case @Bit:
                  match check(d, ctx, f, b(@Bt0)):
                    case @None:
                      @None
                    case @Some{_}:
                      check(d, ctx, t, b(@Bt1))
                case _:
                  @None
            case _:
              @None
        # Nat Match
        case @NatM{z, s}:
          match whnf(goal):
            case @All{k, a, b}:
              match whnf(a):
                case @Nat:
                  match check(d, ctx, z, b(@Zer)):
                    case @None:
                      @None
                    case @Some{_}:
                      check(d, ctx, s, @All{"p", @Nat, λp. b(@Suc{p})})
                case _:
                  @None
            case _:
              @None
        # List Match
        case @LstM{n, c}:
          match whnf(goal):
            case @All{k, a, b}:
              match whnf(a):
                case @Lst{T}:
                  match check(d, ctx, n, b(@Nil)):
                    case @None:
                      @None
                    case @Some{_}:
                      check(d, ctx, c, @All{"h", T, λh. @All{"t", @Lst{T}, λt. b(@Con{h, t})}})
                case _:
                  @None
            case _:
              @None
        # Tuple
        case @Tup{a, b}:
          match whnf(goal):
            case @Sig{k, A, B}:
              match check(d, ctx, a, A):
                case @None:
                  @None
                case @Some{_}:
                  check(d, ctx, b, B(a))
            case _:
              @None
        # Sigma Match
        case @SigM{f}:
          match whnf(goal):
            case @All{k, a, b}:
              match whnf(a):
                case @Sig{s_k, A, B}:
                  check(d, ctx, f, @All{"a", A, λx. @All{"b", B(a), λy. b(@Tup{x, y})}})
                case _:
                  @None
            case _:
              @None
        # Refl
        case @Rfl:
          match whnf(goal):
            case @Eql{t, a, b}:
              if equal(d, a, b):
                @Some{()}
              else:
                @None
            case _:
              @None
        # Equality Match
        case @EqlM{f, T}:
          match whnf(goal):
            case @All{k, a, b}:
              match whnf(a):
                case @Eql{t, x, y}:
                  check(d, ctx, f, b(@Rfl))
                  # TODO: use motive to replace x by y
                case _:
                  @None
            case _:
              @None
        # Default: verify by inference
        case _:
          verify(d, ctx, term, goal)

def verify(d: Nat, ctx: Term[], term: Term, goal: Term) -> Maybe<Unit>:
  match infer(d, ctx, term):
    case @None:
      @None
    case @Some{t}:
      if equal(d, t, goal):
        @Some{()}
      else:
        @None

# Main
# ----

type Def:
  case @Def:
    tm: Term
    ty: Term

def tm(df: Def) -> Term:
  @Def{tm,ty} = df 
  tm

def ty(df: Def) -> Term:
  @Def{tm,ty} = df 
  ty

# ex0_f : ∀x:Nat. ∀y:Bit. Nat =
#   λx. λy. x
def ex0_f : Def =
  @Def{
    @Lam{"x", λx. @Lam{"y", λy. x}},
    @All{"x", @Nat, λx. @All{"y", @Bit, λy. @Nat}}
  }

# not_f : ∀x:Bit. Bit =
#   λ{ False: True ; True: False }
def not_f : Def =
  @Def{
    @BitM{@Bt1, @Bt0},
    @All{"x", @Bit, λx. @Bit}
  }

# bft_f : ∀x:Bit. Bit{not(not(x)) == x} =
#   λ{ False: {==} ; True: {==} }
def bft_f : Def =
  @Def{
    @BitM{@Rfl, @Rfl},
    @All{"x", @Bit, λx. @Eql{@Bit, @App{tm(not_f), @App{tm(not_f), x}}, x}}
  }

def main : Term =
  @Def{x,T} = bft_f
  match check(0n, [], x, T):
    case @None:
      @Var{"",0n}
    case @Some{_}:
      whnf(x)
