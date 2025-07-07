def Proof/algebra/left_identity<A>(f: A->A->A, u:A) -> Set:
  ∀a:A . A{f(u,a) == a }
