def Proof/algebra/zero_right<A>(f: A->A->A, z: A) -> Set:
  ∀a:A . A{f(a,z) == z}
