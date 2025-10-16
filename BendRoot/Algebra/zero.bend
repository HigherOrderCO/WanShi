def zero<A>(f: A->A->A, z: A) -> Set:
  z_is_left_zero  = Algebra/zero_left<A>(f, z)
  z_is_right_zero = Algebra/zero_right<A>(f, z)
  Proof/And(z_is_left_zero,z_is_right_zero)
