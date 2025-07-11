
def BendRW/Term/equal(d: Nat, a: BendRW/Term, b: BendRW/Term) -> Bool:
  BendRW/Term/eql(2, d, a, b)

def BendRW/Term/eql(lv: U64, d: Nat, a: BendRW/Term, b: BendRW/Term) -> Bool:
  if lv === 0:
    BendRW/Term/cmp(0, d, BendRW/Term/whnf(a), BendRW/Term/whnf(b))
  else:
    BendRW/Term/eql(0, d, a, b) or BendRW/Term/cmp(lv, d, BendRW/Term/whnf(a), BendRW/Term/whnf(b))

def BendRW/Term/cmp(lv: U64, d: Nat, a: BendRW/Term, b: BendRW/Term) -> Bool:
  match a b:
    case @Var{a_k, a_i} @Var{b_k, b_i}:
      e_i = Nat/eq(a_i, b_i)
      e_i
    case @Sub{a_t} @Sub{b_t}:
      e_t = BendRW/Term/eql(lv, d, a_t, b_t)
      e_t
    case @Let{a_k, a_T, a_v, a_f} @Let{b_k, b_T, b_v, b_f}:
      e_v = BendRW/Term/eql(lv, d, a_v, b_v)
      e_f = BendRW/Term/eql(lv, 1n+d, a_f(@Var{a_k, d}), b_f(@Var{b_k, d}))
      e_v and e_f
    case @Fix{a_k, a_f} @Fix{b_k, b_f}:
      e_f = BendRW/Term/eql(lv, 1n+d, a_f(@Var{a_k, d}), b_f(@Var{b_k, d}))
      e_f
    case @Set @Set:
      True
    case @All{a_k, a_a, a_b} @All{b_k, b_a, b_b}:
      e_a = BendRW/Term/eql(lv, d, a_a, b_a)
      e_b = BendRW/Term/eql(lv, 1n+d, a_b(@Var{a_k, d}), b_b(@Var{b_k, d}))
      e_a and e_b
    case @Lam{a_k, a_f} @Lam{b_k, b_f}:
      e_f = BendRW/Term/eql(lv, 1n+d, a_f(@Var{a_k, d}), b_f(@Var{b_k, d}))
      e_f
    case @App{a_f, a_x} @App{b_f, b_x}:
      e_f = BendRW/Term/eql(lv, d, a_f, b_f)
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_f and e_x
    case @Emp @Emp:
      True
    case @EmpM{a_x} @EmpM{b_x}:
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_x
    case @Uni @Uni:
      True
    case @One @One:
      True
    case @UniM{a_x, a_f} @UniM{b_x, b_f}:
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_f = BendRW/Term/eql(lv, d, a_f, b_f)
      e_x and e_f
    case @Bit @Bit:
      True
    case @Bt0 @Bt0:
      True
    case @Bt1 @Bt1:
      True
    case @BitM{a_x, a_f, a_t} @BitM{b_x, b_f, b_t}:
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_f = BendRW/Term/eql(lv, d, a_f, b_f)
      e_t = BendRW/Term/eql(lv, d, a_t, b_t)
      e_x and e_f and e_t
    case @Nat @Nat:
      True
    case @Zer @Zer:
      True
    case @Suc{a_n} @Suc{b_n}:
      e_n = BendRW/Term/eql(lv, d, a_n, b_n)
      e_n
    case @NatM{a_x, a_z, a_s} @NatM{b_x, b_z, b_s}:
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_z = BendRW/Term/eql(lv, d, a_z, b_z)
      e_s = BendRW/Term/eql(lv, d, a_s, b_s)
      e_x and e_z and e_s
    case @Lst{a_t} @Lst{b_t}:
      e_t = BendRW/Term/eql(lv, d, a_t, b_t)
      e_t
    case @Nil @Nil:
      True
    case @Con{a_h, a_t} @Con{b_h, b_t}:
      e_h = BendRW/Term/eql(lv, d, a_h, b_h)
      e_t = BendRW/Term/eql(lv, d, a_t, b_t)
      e_h and e_t
    case @LstM{a_x, a_n, a_c} @LstM{b_x, b_n, b_c}:
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_n = BendRW/Term/eql(lv, d, a_n, b_n)
      e_c = BendRW/Term/eql(lv, d, a_c, b_c)
      e_x and e_n and e_c
    case @Sig{a_k, a_a, a_b} @Sig{b_k, b_a, b_b}:
      e_a = BendRW/Term/eql(lv, d, a_a, b_a)
      e_b = BendRW/Term/eql(lv, 1n+d, a_b(@Var{a_k, d}), b_b(@Var{b_k, d}))
      e_a and e_b
    case @Tup{a_a, a_b} @Tup{b_a, b_b}:
      e_a = BendRW/Term/eql(lv, d, a_a, b_a)
      e_b = BendRW/Term/eql(lv, d, a_b, b_b)
      e_a and e_b
    case @SigM{a_x, a_f} @SigM{b_x, b_f}:
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_f = BendRW/Term/eql(lv, d, a_f, b_f)
      e_x and e_f
    case @Eql{a_t, a_a, a_b} @Eql{b_t, b_a, b_b}:
      e_t = BendRW/Term/eql(lv, d, a_t, b_t)
      e_a = BendRW/Term/eql(lv, d, a_a, b_a)
      e_b = BendRW/Term/eql(lv, d, a_b, b_b)
      e_t and e_a and e_b
    case @Rfl @Rfl:
      True
    case @EqlM{a_x, a_f} @EqlM{b_x, b_f}:
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_f = BendRW/Term/eql(lv, d, a_f, b_f)
      e_x and e_f
    case @Rwt{a_a, a_b, a_x} @Rwt{b_a, b_b, b_x}:
      e_a = BendRW/Term/eql(lv, d, a_a, b_a)
      e_b = BendRW/Term/eql(lv, d, a_b, b_b)
      e_x = BendRW/Term/eql(lv, d, a_x, b_x)
      e_a and e_b and e_x
    case _ _:
      False
