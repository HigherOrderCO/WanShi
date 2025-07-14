def Algebra/is_cancellative<A>(f:A->A->A) -> Set:
  Proof/and(Algebra/left_cancellative<A>(f), Algebra/right_cancellative<A>(f))
