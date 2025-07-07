def Proof/algebra/is_cancellative<A>(f:A->A->A) -> Set:
  Proof/and(Proof/algebra/left_cancellative<A>(f), Proof/algebra/right_cancellative<A>(f))
