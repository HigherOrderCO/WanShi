def Nat/mul/zero() -> Proof/algebra/zero(Nat, Nat/mul, 0n):
  zero_left = Proof/algebra/zero_left(Nat, Nat/mul, 0n)
  zero_right = Proof/algebra/zero_right(Nat, Nat/mul, 0n)
  Proof/and/intro<zero_left,zero_right>(Nat/mul/zero_left, Nat/mul/zero_right)
