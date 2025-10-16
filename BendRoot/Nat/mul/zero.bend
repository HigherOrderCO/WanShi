def zero() -> Algebra/zero(Nat, Nat/mul, 0n):
  # zero_left = Algebra/zero_left(Nat, Nat/mul, 0n)
  # zero_right = Algebra/zero_right(Nat, Nat/mul, 0n)
  # Proof/and/intro<zero_left,zero_right>(Nat/mul/zero_left, Nat/mul/zero_right)
  Proof/And/Intro<Algebra/zero_left(Nat, Nat/mul, 0n),Algebra/zero_right(Nat, Nat/mul, 0n)>(Nat/mul/zero_left, Nat/mul/zero_right)
