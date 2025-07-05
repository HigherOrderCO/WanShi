def Set/Identities/hilbert_or3<A,B,C>() -> (A -> C) -> ((B -> C) -> (Set/Or(A,B) -> C)):
  λac.λbc.λorAB.Set/Or/Elim<A,B,C>(orAB, ac, bc)
