
def BendRW/Term/replace(lv: U64, d: Nat, old: BendRW/Term, neo: BendRW/Term, val: BendRW/Term) -> BendRW/Term:
  if BendRW/Term/equal(d, old, val):
    neo
  else:
    match BendRW/Term/whnf(val):
      case @Var{k, i}:
        @Var{k, i}
      case @Sub{t}:
        t
      case @Let{k, T, v, f}:
        BendRW/Term/replace(lv, d, old, neo, f(v))
      case @Fix{k, f}:
        @Emp
      case @Set:
        @Set
      case @All{k, a, b}:
        r_a = BendRW/Term/replace(lv, d, old, neo, a)
        r_b = (λx. BendRW/Term/replace(lv, 1n+d, old, neo, b(x))) :: BendRW/Term -> BendRW/Term
        @All{k, r_a, r_b}
      case @Lam{k, f}:
        @Lam{k, f}
      case @App{f, x}:
        r_f = BendRW/Term/replace(lv, d, old, neo, f)
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        @App{r_f, r_x}
      case @Emp:
        @Emp
      case @EmpM{x}:
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        @EmpM{r_x}
      case @Uni:
        @Uni
      case @One:
        @One
      case @UniM{x, f}:
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        r_f = BendRW/Term/replace(lv, d, old, neo, f)
        @UniM{r_x, r_f}
      case @Bit:
        @Bit
      case @Bt0:
        @Bt0
      case @Bt1:
        @Bt1
      case @BitM{x, f, t}:
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        r_f = BendRW/Term/replace(lv, d, old, neo, f)
        r_t = BendRW/Term/replace(lv, d, old, neo, t)
        @BitM{r_x, r_f, r_t}
      case @Nat:
        @Nat
      case @Zer:
        @Zer
      case @Suc{n}:
        r_n = BendRW/Term/replace(lv, d, old, neo, n)
        @Suc{r_n}
      case @NatM{x, z, s}:
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        r_z = BendRW/Term/replace(lv, d, old, neo, z)
        r_s = BendRW/Term/replace(lv, d, old, neo, s)
        @NatM{r_x, r_z, r_s}
      case @Lst{t}:
        r_t = BendRW/Term/replace(lv, d, old, neo, t)
        @Lst{r_t}
      case @Nil:
        @Nil
      case @Con{h, t}:
        r_h = BendRW/Term/replace(lv, d, old, neo, h)
        r_t = BendRW/Term/replace(lv, d, old, neo, t)
        @Con{r_h, r_t}
      case @LstM{x, n, c}:
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        r_n = BendRW/Term/replace(lv, d, old, neo, n)
        r_c = BendRW/Term/replace(lv, d, old, neo, c)
        @LstM{r_x, r_n, r_c}
      case @Sig{k, a, b}:
        r_a = BendRW/Term/replace(lv, d, old, neo, a)
        r_b = (λx. BendRW/Term/replace(lv, 1n+d, old, neo, b(x))) :: BendRW/Term -> BendRW/Term
        @Sig{k, r_a, r_b}
      case @Tup{a, b}:
        r_a = BendRW/Term/replace(lv, d, old, neo, a)
        r_b = BendRW/Term/replace(lv, d, old, neo, b)
        @Tup{r_a, r_b}
      case @SigM{x, f}:
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        r_f = BendRW/Term/replace(lv, d, old, neo, f)
        @SigM{r_x, r_f}
      case @Eql{t, a, b}:
        r_t = BendRW/Term/replace(lv, d, old, neo, t)
        r_a = BendRW/Term/replace(lv, d, old, neo, a)
        r_b = BendRW/Term/replace(lv, d, old, neo, b)
        @Eql{r_t, r_a, r_b}
      case @Rfl:
        @Rfl
      case @EqlM{x, f}:
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        r_f = BendRW/Term/replace(lv, d, old, neo, f)
        @EqlM{r_x, r_f}
      case @Rwt{a, b, x}:
        r_a = BendRW/Term/replace(lv, d, old, neo, a)
        r_b = BendRW/Term/replace(lv, d, old, neo, b)
        r_x = BendRW/Term/replace(lv, d, old, neo, x)
        @Rwt{r_a, r_b, r_x}
