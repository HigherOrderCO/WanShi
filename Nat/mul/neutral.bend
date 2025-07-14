def Nat/mul/neutral() -> Proof/algebra/unit(Nat, Nat/mul, 1n):
  # unit_left = Proof/algebra/unit_left(Nat, Nat/mul, 1n)
  # unit_right = Proof/algebra/unit_right(Nat, Nat/mul, 1n)
  # Proof/and/intro<unit_left,unit_right>(Nat/mul/neutral_left, Nat/mul/neutral_right)
  Proof/and/intro<Proof/algebra/unit_left(Nat, Nat/mul, 1n),Proof/algebra/unit_right(Nat, Nat/mul, 1n)>(Nat/mul/neutral_left, Nat/mul/neutral_right)
