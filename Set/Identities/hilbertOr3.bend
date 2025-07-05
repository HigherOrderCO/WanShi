def Set/Identities/hilbertOr3<A,B,C>() -> (A -> C) -> ((B -> C) -> (Set/Or(A,B) -> C)):
  λac.λbc.λorAB.Set/Deduction/orElim<A,B,C>(orAB, ac, bc)
