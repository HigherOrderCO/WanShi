def Proof/algebra/monoid(A:Set, f:A->A->A, u:A) -> Set:
  is_ass = Proof/algebra/associative<A>
  is_uni = Proof/algebra/unit<A>
  Proof/and(is_ass(f), is_uni(f, u))
