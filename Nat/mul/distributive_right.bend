def Nat/mul/distributive_right() -> Algebra/distributive_right<Nat>(Nat/mul, Nat/add): 
  λa.λb.λc.
    rewrite Nat/mul/commutative(Nat/add(a,b),c)
    rewrite Nat/mul/commutative(a,c)
    rewrite Nat/mul/commutative(b,c)
    Nat/mul/distributive_left(a,b,c)
