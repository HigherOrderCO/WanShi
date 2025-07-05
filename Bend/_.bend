#./../PROMPT.bend#

# Bend-in-Bend:

# Type
# ----

type Term:
  # Variables
  case @Var: # x
    i: Nat
  case @Sub: # x
    t: Term

  # Definitions
  case @Let: # let x : T = v; f
    x: Term
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
    a: Term
    b: Term -> Term
  case @Lam: # λx.f
    k: String
    f: Term -> Term
  case @App: # f(x)
    f: Term
    x: Term

  # Empty
  case @Emp:  # Empty
  case @EmpM: # ~ x {}
    x: Term

  # Unit
  case @Uni:  # Unit
  case @One:  # ()
  case @UniM: # ~ x { (): f }
    x: Term
    f: Term

  # Bool
  case @Bit:  # Bool
  case @Bt0:  # False
  case @Bt1:  # True
  case @BitM: # ~ x { False: f ; True: t }
    x: Term
    f: Term
    t: Term

  # Nat
  case @Nat: # Nat
  case @Zer: # 0n
  case @Suc: # 1n+n
    n: Term
  case @NatM: # ~ x { 0n: z ; 1n+: s }
    x: Term
    z: Term
    s: Term

  # List
  case @Lst: # T[]
    t: Term
  case @Nil: # []
  case @Con: # h<>t
    h: Term
    t: Term
  case @LstM: # ~ x { []: n ; <>: c }
    x: Term
    n: Term
    c: Term

  # Pair
  case @Sig: # Σx:A.B
    a: Term
    b: Term -> Term
  case @Tup: # (a,b)
    a: Term
    b: Term
  case @SigM: # ~ x { (,): f }
    x: Term
    f: Term

  # Equality
  case @Eql: # T{a == b}
    t: Term
    a: Term
    b: Term
  case @Rfl: # {==}
  case @EqlM: # ~ x { {==}: f } : T
    x: Term
    f: Term
    T: Term

  # Util
  case @Rwt:
    a: Term
    b: Term
    x: Term

  ## MetaVar
  #case @Met: # ?N:T{x0,x1,...}
    #n: U64
    #t: Term
    #x: Term[]

# Evaluator
# ---------

def whnf(term: Term) -> Term:
  match term:
    case @Let{x, T, v, f}:
      whnf_let(x, T, v, f)
    case @Fix{k, f}:
      whnf_fix(k, f)
    case @App{f, x}:
      whnf_app(f, x)
    case @UniM{x,f}:
      whnf_uni(x, f)
    case @BitM{x,f,t}:
      whnf_bit(x, f, t)
    case @NatM{x,z,s}:
      whnf_nat(x, z, s)
    case @LstM{x,n,c}:
      whnf_lst(x, n, c)
    case @SigM{x,f}:
      whnf_sig(x, f)
    case @EqlM{x,f,T}:
      whnf_eql(x, f, T)
    case x:
      x

def whnf_let(x: Term, T: Term, v: Term, f: Term -> Term) -> Term:
  whnf(f(v))

def whnf_fix(k: String, f: Term -> Term) -> Term:
  whnf(f(@Fix{k, f}))

def whnf_app(f: Term, x: Term) -> Term:
  match whnf(f):
    case @Lam{k, f}:
      whnf(f(whnf(x)))
    case f:
      @App{f, x}

def whnf_uni(x: Term, f: Term) -> Term:
  match whnf(x):
    case @One:
      whnf(f)
    case x:
      @UniM{x, f}

def whnf_bit(x: Term, f: Term, t: Term) -> Term:
  match whnf(x):
    case @Bt0:
      whnf(f)
    case @Bt1:
      whnf(t)
    case x:
      @BitM{x, f, t}

def whnf_nat(x: Term, z: Term, s: Term) -> Term:
  match whnf(x):
    case @Zer:
      whnf(z)
    case @Suc{n}:
      whnf(@App{s, whnf(n)})
    case x:
      @NatM{x, z, s}

def whnf_lst(x: Term, n: Term, c: Term) -> Term:
  match whnf(x):
    case @Nil:
      whnf(n)
    case @Con{h, t}:
      whnf(@App{@App{c, whnf(h)}, whnf(t)})
    case x:
      @LstM{x, n, c}

def whnf_sig(x: Term, f: Term) -> Term:
  match whnf(x):
    case @Tup{a, b}:
      whnf(@App{@App{f, whnf(a)}, whnf(b)})
    case x:
      @SigM{x, f}

def whnf_eql(x: Term, f: Term, T: Term) -> Term:
  match whnf(x):
    case @Rfl:
      whnf(f)
    case x:
      @EqlM{x, f, T}

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
    case @Var{a_i} @Var{b_i}:
      e_i = Nat/eq(a_i, b_i)
      e_i
    case @Sub{a_t} @Sub{b_t}:
      e_t = eql(lv, d, a_t, b_t)
      e_t
    case @Let{a_x, a_T, a_v, a_f} @Let{b_x, b_T, b_v, b_f}:
      e_v = eql(lv, d, a_v, b_v)
      e_f = eql(lv, 1n+d, a_f(@Var{d}), b_f(@Var{d}))
      e_v and e_f
    case @Fix{a_k, a_f} @Fix{b_k, b_f}:
      e_f = eql(lv, 1n+d, a_f(@Var{d}), b_f(@Var{d}))
      e_f
    #case @Fix{a_k, a_f} b:
      #e_f = eql(lv, d, a_f(b), b)
      #e_f
    #case a @Fix{b_k, b_f}:
      #e_f = eql(lv, d, a, b_f(@Fix{b_k, b_f}))
      #e_f
    case @Set @Set:
      True
    case @All{a_a, a_b} @All{b_a, b_b}:
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, 1n+d, a_b(@Var{d}), b_b(@Var{d}))
      e_a and e_b
    case @Lam{a_k, a_f} @Lam{b_k, b_f}:
      e_f = eql(lv, 1n+d, a_f(@Var{d}), b_f(@Var{d}))
      e_f
    case @App{a_f, a_x} @App{b_f, b_x}:
      e_f = eql(lv, d, a_f, b_f)
      e_x = eql(lv, d, a_x, b_x)
      e_f and e_x
    case @Emp @Emp:
      True
    case @EmpM{a_x} @EmpM{b_x}:
      e_x = eql(lv, d, a_x, b_x)
      e_x
    case @Uni @Uni:
      True
    case @One @One:
      True
    case @UniM{a_x, a_f} @UniM{b_x, b_f}:
      e_x = eql(lv, d, a_x, b_x)
      e_f = eql(lv, d, a_f, b_f)
      e_x and e_f
    case @Bit @Bit:
      True
    case @Bt0 @Bt0:
      True
    case @Bt1 @Bt1:
      True
    case @BitM{a_x, a_f, a_t} @BitM{b_x, b_f, b_t}:
      e_x = eql(lv, d, a_x, b_x)
      e_f = eql(lv, d, a_f, b_f)
      e_t = eql(lv, d, a_t, b_t)
      e_x and e_f and e_t
    case @Nat @Nat:
      True
    case @Zer @Zer:
      True
    case @Suc{a_n} @Suc{b_n}:
      e_n = eql(lv, d, a_n, b_n)
      e_n
    case @NatM{a_x, a_z, a_s} @NatM{b_x, b_z, b_s}:
      e_x = eql(lv, d, a_x, b_x)
      e_z = eql(lv, d, a_z, b_z)
      e_s = eql(lv, d, a_s, b_s)
      e_x and e_z and e_s
    case @Lst{a_t} @Lst{b_t}:
      e_t = eql(lv, d, a_t, b_t)
      e_t
    case @Nil @Nil:
      True
    case @Con{a_h, a_t} @Con{b_h, b_t}:
      e_h = eql(lv, d, a_h, b_h)
      e_t = eql(lv, d, a_t, b_t)
      e_h and e_t
    case @LstM{a_x, a_n, a_c} @LstM{b_x, b_n, b_c}:
      e_x = eql(lv, d, a_x, b_x)
      e_n = eql(lv, d, a_n, b_n)
      e_c = eql(lv, d, a_c, b_c)
      e_x and e_n and e_c
    case @Sig{a_a, a_b} @Sig{b_a, b_b}:
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, 1n+d, a_b(@Var{d}), b_b(@Var{d}))
      e_a and e_b
    case @Tup{a_a, a_b} @Tup{b_a, b_b}:
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, d, a_b, b_b)
      e_a and e_b
    case @SigM{a_x, a_f} @SigM{b_x, b_f}:
      e_x = eql(lv, d, a_x, b_x)
      e_f = eql(lv, d, a_f, b_f)
      e_x and e_f
    case @Eql{a_t, a_a, a_b} @Eql{b_t, b_a, b_b}:
      e_t = eql(lv, d, a_t, b_t)
      e_a = eql(lv, d, a_a, b_a)
      e_b = eql(lv, d, a_b, b_b)
      e_t and e_a and e_b
    case @Rfl @Rfl:
      True
    case @EqlM{a_x, a_f, a_T} @EqlM{b_x, b_f, b_T}:
      e_x = eql(lv, d, a_x, b_x)
      e_f = eql(lv, d, a_f, b_f)
      e_T = eql(lv, d, a_T, b_T)
      e_x and e_f and e_T
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
      case @Var{i}:
        @Var{i}
      case @Sub{t}:
        t
      case @Let{x, T, v, f}:
        replace(lv, d, old, neo, f(x))
      case @Fix{k, f}:
        @Emp
      case @Set:
        @Set
      case @All{a, b}:
        r_a = replace(lv, d, old, neo, a)
        r_b = (λx. replace(lv, d, old, neo, b(@Var{d}))) :: Term -> Term
        @All{r_a, r_b}
      case @Lam{k, f}:
        @Lam{k, f}
      case @App{f, x}:
        r_f = replace(lv, d, old, neo, f)
        r_x = replace(lv, d, old, neo, x)
        @App{r_f, r_x}
      case @Emp:
        @Emp
      case @EmpM{x}:
        r_x = replace(lv, d, old, neo, x)
        @EmpM{r_x}
      case @Uni:
        @Uni
      case @One:
        @One
      case @UniM{x, f}:
        r_x = replace(lv, d, old, neo, x)
        r_f = replace(lv, d, old, neo, f)
        @UniM{r_x, r_f}
      case @Bit:
        @Bit
      case @Bt0:
        @Bt0
      case @Bt1:
        @Bt1
      case @BitM{x, f, t}:
        r_x = replace(lv, d, old, neo, x)
        r_f = replace(lv, d, old, neo, f)
        r_t = replace(lv, d, old, neo, t)
        @BitM{r_x, r_f, r_t}
      case @Nat:
        @Nat
      case @Zer:
        @Zer
      case @Suc{n}:
        r_n = replace(lv, d, old, neo, n)
        @Suc{r_n}
      case @NatM{x, z, s}:
        r_x = replace(lv, d, old, neo, x)
        r_z = replace(lv, d, old, neo, z)
        r_s = replace(lv, d, old, neo, s)
        @NatM{r_x, r_z, r_s}
      case @Lst{t}:
        r_t = replace(lv, d, old, neo, t)
        @Lst{r_t}
      case @Nil:
        @Nil
      case @Con{h, t}:
        r_h = replace(lv, d, old, neo, h)
        r_t = replace(lv, d, old, neo, t)
        @Con{r_h, r_t}
      case @LstM{x, n, c}:
        r_x = replace(lv, d, old, neo, x)
        r_n = replace(lv, d, old, neo, n)
        r_c = replace(lv, d, old, neo, c)
        @LstM{r_x, r_n, r_c}
      case @Sig{a, b}:
        r_a = replace(lv, d, old, neo, a)
        r_b = (λx. replace(lv, d, old, neo, b(@Var{d}))) :: Term -> Term
        @Sig{r_a, r_b}
      case @Tup{a, b}:
        r_a = replace(lv, d, old, neo, a)
        r_b = replace(lv, d, old, neo, b)
        @Tup{r_a, r_b}
      case @SigM{x, f}:
        r_x = replace(lv, d, old, neo, x)
        r_f = replace(lv, d, old, neo, f)
        @SigM{r_x, r_f}
      case @Eql{t, a, b}:
        r_t = replace(lv, d, old, neo, t)
        r_a = replace(lv, d, old, neo, a)
        r_b = replace(lv, d, old, neo, b)
        @Eql{r_t, r_a, r_b}
      case @Rfl:
        @Rfl
      case @EqlM{x, f, T}:
        r_x = replace(lv, d, old, neo, x)
        r_f = replace(lv, d, old, neo, f)
        r_T = replace(lv, d, old, neo, T)
        @EqlM{r_x, r_f, r_T}
      case @Rwt{a, b, x}:
        r_a = replace(lv, d, old, neo, a)
        r_b = replace(lv, d, old, neo, b)
        r_x = replace(lv, d, old, neo, x)
        @Rwt{r_a, r_b, r_x}
        
# Check
# -----

def infer(d: Nat, ctx: Term[], term: Term) -> Maybe<Term>:
  match term:
    case @Var{i}:
      List/get<Term>(ctx, i)
    case @Sub{t}:
      infer(d, ctx, t)
    case @Let{x, T, v, f}:
      match check(d, ctx, v, T):
        case @None:
          @None
        case @Some{_}:
          infer(d, List/append<Term>(ctx,[T]), f(@Var{d}))
    case @Fix{k, f}:
      @None
    case @Set:
      @Some{@Set}
    case @All{a, b}:
      match check(d, ctx, a, @Set):
        case @None:
          @None
        case @Some{_}:
          match check(1n+d, ctx, b(@Var{d}), @Set):
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
            case @All{a, b}:
              match check(d, ctx, x, a):
                case @None:
                  @None
                case @Some{_}:
                  @Some{b(x)}
            case _:
              @None
    case @Emp:
      @Some{@Set}
    case @EmpM{x}:
      @None
    case @Uni:
      @Some{@Set}
    case @One:
      @Some{@Uni}
    case @UniM{x, f}:
      @None
    case @Bit:
      @Some{@Set}
    case @Bt0:
      @Some{@Bit}
    case @Bt1:
      @Some{@Bit}
    case @BitM{x, f, t}:
      @None
    case @Nat:
      @Some{@Set}
    case @Zer:
      @None
    case @Suc{n}:
      @None
    case @NatM{x, z, s}:
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
    case @LstM{x, n, c}:
      @None
    case @Sig{a, b}:
      match check(d, ctx, a, @Set):
        case @None:
          @None
        case @Some{_}:
          match check(1n+d, ctx, b(@Var{d}), @Set):
            case @None:
              @None
            case @Some{_}:
              @Some{@Set}
    case @Tup{a, b}:
      @None
    case @SigM{x, f}:
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
    case @EqlM{x, f, T}:
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
        case @Let{x, T, v, f}:
          match check(d, ctx, v, T):
            case @None:
              @None
            case @Some{_}:
              check(1n+d, List/append<Term>(ctx, [T]), f(@Var{d}), goal)
        # Lambda
        case @Lam{k, f}:
          match whnf(goal):
            case @All{a, b}:
              check(1n+d, List/append<Term>(ctx, [a]), f(@Var{d}), b(@Var{d}))
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
        case @EmpM{x}:
          match infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match whnf(x_type):
                case @Emp:
                  @Some{()}
                case _:
                  @None
        # Unit Match
        case @UniM{x, f}:
          match infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match whnf(x_type):
                case @Uni:
                  check(d, ctx, f, @Rwt{x, @One, goal})
                case _:
                  @None
        # Bool Match
        case @BitM{x, f, t}:
          match infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match whnf(x_type):
                case @Bit:
                  match check(d, ctx, f, @Rwt{x, @Bt0, goal}):
                    case @None:
                      @None
                    case @Some{_}:
                      check(d, ctx, t, @Rwt{x, @Bt1, goal})
                case _:
                  @None
        # Nat Match
        case @NatM{x, z, s}:
          match infer(d, ctx, x):
            case @None:
              @None
            case @Some{xT}:
              match whnf(xT):
                case @Nat:
                  match check(d, ctx, z, @Rwt{x, @Zer, goal}):
                    case @None:
                      @None
                    case @Some{_}:
                      check(d, ctx, s, @All{@Nat, λp. @Rwt{x, @Suc{@Var{d}}, goal}})
                case _:
                  @None
        # List Match
        case @LstM{x, n, c}:
          match infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match whnf(x_type):
                case @Lst{T}:
                  match check(d, ctx, n, @Rwt{x, @Nil, goal}):
                    case @None:
                      @None
                    case @Some{_}:
                      check(d, ctx, c, @All{T, λh. @All{@Lst{T}, λt. @Rwt{x, @Con{@Var{d}, @Var{1n+d}}, goal}}})
                case _:
                  @None
        # Tuple
        case @Tup{a, b}:
          match whnf(goal):
            case @Sig{A, B}:
              match check(d, ctx, a, A):
                case @None:
                  @None
                case @Some{_}:
                  check(d, ctx, b, B(a))
            case _:
              @None
        # Sigma Match
        case @SigM{x, f}:
          match infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match whnf(x_type):
                case @Sig{A, B}:
                  check(d, ctx, f, @All{A, λa. @All{B(a), λb. @Rwt{x, @Tup{a, b}, goal}}})
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
        case @EqlM{x, f, T}:
          match equal(d, T, goal):
            case False:
              @None
            case True:
              match infer(d, ctx, x):
                case @None:
                  @None
                case @Some{x_type}:
                  match whnf(x_type):
                    case @Eql{t, a, b}:
                      check(d, ctx, f, @Rwt{x, @Rfl, goal})
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
    @All{@Nat, λx. @All{@Bit, λy. @Nat}}
  }

# not_f : ∀x:Bit. Bit =
#   λx. ~ x { False: True ; True: False }
def not_f : Def =
  @Def{
    @Lam{"x", λx. @BitM{x, @Bt1, @Bt0}},
    @All{@Bit, λx. @Bit}
  }

# bft_f : ∀x:Bit. Bit{not(not(x)) == x} =
#   ~ x { False: {==} ; True: {==} }
def bft_f : Def =
  @Def{
    @Lam{"x", λx. @BitM{x, @Rfl, @Rfl}},
    @All{@Bit, λx. @Eql{@Bit, @App{tm(not_f), @App{tm(not_f), x}}, x}}
  }

def main : Term =
  @Def{x,T} = bft_f
  match check(0n, [], x, T):
    case @None:
      @Var{0n}
    case @Some{_}:
      whnf(x)
