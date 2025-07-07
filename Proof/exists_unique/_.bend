def Proof/exists_unique<A>(P:A -> Set) -> Set:
  Σa:A.Proof/and(P(a), ∀x:A . (P(x) -> A{x==a}))
