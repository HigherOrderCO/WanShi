def neutral() -> Algebra/unit(Nat, Nat/mul, 1n):
  # unit_left = Algebra/unit_left(Nat, Nat/mul, 1n)
  # unit_right = Algebra/unit_right(Nat, Nat/mul, 1n)
  # Proof/and/intro<unit_left,unit_right>(Nat/mul/neutral_left, Nat/mul/neutral_right)
  Proof/And/Intro<Algebra/unit_left(Nat, Nat/mul, 1n),Algebra/unit_right(Nat, Nat/mul, 1n)>(Nat/mul/neutral_left, Nat/mul/neutral_right)
