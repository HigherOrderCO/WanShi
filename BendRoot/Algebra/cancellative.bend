def is_cancellative<A>(f:A->A->A) -> Set:
  Proof/And(Algebra/left_cancellative<A>(f), Algebra/right_cancellative<A>(f))
