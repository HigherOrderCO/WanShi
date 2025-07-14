def Algebra/loop<A>(f:A->A->A, u:A) -> Set:
  is_uni = Algebra/unit<A>(f,u)
  is_div = Algebra/divisible<A>(f)
  Proof/and(is_div, is_uni)
