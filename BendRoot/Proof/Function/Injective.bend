def Injective<A,B>(f:A->B) -> Set:
  ∀x:A. (∀y:A. (Proof/Not(A{x == y}) -> Proof/Not(B{f(x) == f(y)})))
