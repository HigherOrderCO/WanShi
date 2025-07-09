def Proof/function/injective<A,B>(f:A->B) -> Set:
  ∀x:A. (∀y:A. (Proof/not(A{x == y}) -> Proof/not(B{f(x) == f(y)})))
