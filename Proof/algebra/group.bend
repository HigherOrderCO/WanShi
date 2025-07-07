def Proof/algebra/group<A>(f:A->A->A, u:A) -> Set:
  is_ass = Proof/algebra/associative<A>(f)
  is_uni = Proof/algebra/unit<A>(f, u)
  is_div = Proof/algebra/divisible<A>(f)
  Proof/and(is_ass, Proof/and(is_uni, is_div))
