def Proof/algebra/loop<A>(f:A->A->A, u:A) -> Set:
  is_uni = Proof/algebra/unit<A>(f,u)
  is_div = Proof/algebra/divisible<A>(f)
  Proof/and(is_div, is_uni)
