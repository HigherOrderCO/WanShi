def Proof/algebra/unit_left<A>(f: A->A->A, u:A) -> Set:
  ∀a:A . A{f(u,a) == a }
