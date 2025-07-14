def Algebra/right_divisible<A>(f:A->A->A) -> Set:
  ∀a:A . ∀b:A. Proof/exists_unique(A, λx. A{f(a, x) == b})
