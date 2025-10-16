def right_divisible<A>(f:A->A->A) -> Set:
  ∀a:A . ∀b:A. Proof/Exists_unique(A, λx. A{f(a, x) == b})
