def Exists_unique<A>(P:A -> Set) -> Set:
  Σa:A.Proof/And(P(a), ∀x:A . (P(x) -> A{x==a}))
