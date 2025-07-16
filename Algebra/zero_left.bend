def Algebra/zero_left<A>(f: A->A->A, z: A) -> Set:
  ∀a:A . A{f(z,a) == z}
