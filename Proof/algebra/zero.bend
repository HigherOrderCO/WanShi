def Proof/algebra/zero<A>(f: A->A->A, z: A) -> Set:
  z_is_left_zero  = Proof/algebra/zero_left<A>(f, z)
  z_is_right_zero = Proof/algebra/zero_right<A>(f, z)
  Proof/and(z_is_left_zero,z_is_right_zero)
