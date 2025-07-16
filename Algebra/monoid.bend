def Algebra/monoid(A:Set, f:A->A->A, u:A) -> Set:
  is_ass = Algebra/associative<A>
  is_uni = Algebra/unit<A>
  Proof/and(is_ass(f), is_uni(f, u))
