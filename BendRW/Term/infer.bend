
def BendRW/Term/infer(d: Nat, ctx: BendRW/Term[], term: BendRW/Term) -> Maybe<BendRW/Term>:
  match term:
    case @Var{k, i}:
      List/get<BendRW/Term>(ctx, i)
    case @Sub{t}:
      BendRW/Term/infer(d, ctx, t)
    case @Let{k, T, v, f}:
      match BendRW/Term/check(d, ctx, v, T):
        case @None:
          @None
        case @Some{_}:
          BendRW/Term/infer(d, List/append<BendRW/Term>(ctx,[T]), f(@Var{k, d}))
    case @Fix{k, f}:
      @None
    case @Set:
      @Some{@Set}
    case @All{k, a, b}:
      match BendRW/Term/check(d, ctx, a, @Set):
        case @None:
          @None
        case @Some{_}:
          match BendRW/Term/check(1n+d, List/append<BendRW/Term>(ctx,[a]), b(@Var{k, d}), @Set):
            case @None:
              @None
            case @Some{_}:
              @Some{@Set}
    case @Lam{k, f}:
      @None
    case @App{f, x}:
      match BendRW/Term/infer(d, ctx, f):
        case @None:
          @None
        case @Some{f_type}:
          match BendRW/Term/whnf(f_type):
            case @All{k, a, b}:
              match BendRW/Term/check(d, ctx, x, a):
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
      @Some{@Nat}
    case @Suc{n}:
      match BendRW/Term/check(d, ctx, n, @Nat):
        case @None:
          @None
        case @Some{_}:
          @Some{@Nat}
    case @NatM{x, z, s}:
      @None
    case @Lst{t}:
      match BendRW/Term/check(d, ctx, t, @Set):
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
    case @Sig{k, a, b}:
      match BendRW/Term/check(d, ctx, a, @Set):
        case @None:
          @None
        case @Some{_}:
          match BendRW/Term/check(1n+d, List/append<BendRW/Term>(ctx,[a]), b(@Var{k, d}), @Set):
            case @None:
              @None
            case @Some{_}:
              @Some{@Set}
    case @Tup{a, b}:
      @None
    case @SigM{x, f}:
      @None
    case @Eql{t, a, b}:
      match BendRW/Term/check(d, ctx, t, @Set):
        case @None:
          @None
        case @Some{_}:
          match BendRW/Term/check(d, ctx, a, t):
            case @None:
              @None
            case @Some{_}:
              match BendRW/Term/check(d, ctx, b, t):
                case @None:
                  @None
                case @Some{_}:
                  @Some{@Set}
    case @Rfl:
      @None
    case @EqlM{x, f}:
      @None
    case @Rwt{a, b, x}:
      @None # TODO

def BendRW/Term/check(d: Nat, ctx: BendRW/Term[], term: BendRW/Term, goal: BendRW/Term) -> Maybe<Unit>:
  match goal:
    case @Rwt{a,b,goal}:
      new_ctx  = List/map<BendRW/Term,BendRW/Term>(ctx, λx. BendRW/Term/replace(1, d, a, b, x))
      new_goal = BendRW/Term/replace(1, d, a, b, goal)
      BendRW/Term/check(d, new_ctx, term, new_goal)
    case goal:
      match term:
        # Let
        case @Let{k, T, v, f}:
          match BendRW/Term/check(d, ctx, v, T):
            case @None:
              @None
            case @Some{_}:
              BendRW/Term/check(1n+d, List/append<BendRW/Term>(ctx, [T]), f(@Var{k, d}), goal)
        # Lambda
        case @Lam{k, f}:
          match BendRW/Term/whnf(goal):
            case @All{g_k, a, b}:
              BendRW/Term/check(1n+d, List/append<BendRW/Term>(ctx, [a]), f(@Var{k, d}), b(@Var{g_k, d}))
            case _:
              @None
        # Unit
        case @One:
          match BendRW/Term/whnf(goal):
            case @Uni:
              @Some{()}
            case _:
              @None
        # Bool
        case @Bt0:
          match BendRW/Term/whnf(goal):
            case @Bit:
              @Some{()}
            case _:
              @None
        case @Bt1:
          match BendRW/Term/whnf(goal):
            case @Bit:
              @Some{()}
            case _:
              @None
        # Nat
        case @Zer:
          match BendRW/Term/whnf(goal):
            case @Nat:
              @Some{()}
            case _:
              @None
        case @Suc{n}:
          match BendRW/Term/whnf(goal):
            case @Nat:
              BendRW/Term/check(d, ctx, n, @Nat)
            case _:
              @None
        # List
        case @Nil:
          match BendRW/Term/whnf(goal):
            case @Lst{_}:
              @Some{()}
            case _:
              @None
        case @Con{h, t}:
          match BendRW/Term/whnf(goal):
            case @Lst{T}:
              match BendRW/Term/check(d, ctx, h, T):
                case @None:
                  @None
                case @Some{_}:
                  BendRW/Term/check(d, ctx, t, @Lst{T})
            case _:
              @None
        # Empty Match
        case @EmpM{x}:
          match BendRW/Term/infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match BendRW/Term/whnf(x_type):
                case @Emp:
                  @Some{()}
                case _:
                  @None
        # Unit Match
        case @UniM{x, f}:
          match BendRW/Term/infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match BendRW/Term/whnf(x_type):
                case @Uni:
                  BendRW/Term/check(d, ctx, f, @Rwt{x, @One, goal})
                case _:
                  @None
        # Bool Match
        case @BitM{x, f, t}:
          match BendRW/Term/infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match BendRW/Term/whnf(x_type):
                case @Bit:
                  match BendRW/Term/check(d, ctx, f, @Rwt{x, @Bt0, goal}):
                    case @None:
                      @None
                    case @Some{_}:
                      BendRW/Term/check(d, ctx, t, @Rwt{x, @Bt1, goal})
                case _:
                  @None
        # Nat Match
        case @NatM{x, z, s}:
          match BendRW/Term/infer(d, ctx, x):
            case @None:
              @None
            case @Some{xT}:
              match BendRW/Term/whnf(xT):
                case @Nat:
                  match BendRW/Term/check(d, ctx, z, @Rwt{x, @Zer, goal}):
                    case @None:
                      @None
                    case @Some{_}:
                      BendRW/Term/check(d, ctx, s, @All{"p", @Nat, λp. @Rwt{x, @Suc{p}, goal}})
                case _:
                  @None
        # List Match
        case @LstM{x, n, c}:
          match BendRW/Term/infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match BendRW/Term/whnf(x_type):
                case @Lst{T}:
                  match BendRW/Term/check(d, ctx, n, @Rwt{x, @Nil, goal}):
                    case @None:
                      @None
                    case @Some{_}:
                      BendRW/Term/check(d, ctx, c, @All{"h", T, λh. @All{"t", @Lst{T}, λt. @Rwt{x, @Con{h, t}, goal}}})
                case _:
                  @None
        # Tuple
        case @Tup{a, b}:
          match BendRW/Term/whnf(goal):
            case @Sig{k, A, B}:
              match BendRW/Term/check(d, ctx, a, A):
                case @None:
                  @None
                case @Some{_}:
                  BendRW/Term/check(d, ctx, b, B(a))
            case _:
              @None
        # Sigma Match
        case @SigM{x, f}:
          match BendRW/Term/infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match BendRW/Term/whnf(x_type):
                case @Sig{k, A, B}:
                  BendRW/Term/check(d, ctx, f, @All{"a", A, λa. @All{"b", B(a), λb. @Rwt{x, @Tup{a, b}, goal}}})
                case _:
                  @None
        # Refl
        case @Rfl:
          match BendRW/Term/whnf(goal):
            case @Eql{t, a, b}:
              if BendRW/Term/equal(d, a, b):
                @Some{()}
              else:
                @None
            case _:
              @None
        # Equality Match
        case @EqlM{x, f}:
          match BendRW/Term/infer(d, ctx, x):
            case @None:
              @None
            case @Some{x_type}:
              match BendRW/Term/whnf(x_type):
                case @Eql{t, a, b}:
                  BendRW/Term/check(d, ctx, f, @Rwt{a, b, @Rwt{x, @Rfl, goal}})
                case _:
                  @None
        # Default: verify by inference
        case _:
          BendRW/Term/verify(d, ctx, term, goal)

def BendRW/Term/verify(d: Nat, ctx: BendRW/Term[], term: BendRW/Term, goal: BendRW/Term) -> Maybe<Unit>:
  match BendRW/Term/infer(d, ctx, term):
    case @None:
      @None
    case @Some{t}:
      if BendRW/Term/equal(d, t, goal):
        @Some{()}
      else:
        @None
