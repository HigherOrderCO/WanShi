def Proof/algebra/left_unit<A>(f: A->A->A, u:A) -> Set:
  ∀a:A . A{f(u,a) == a }
