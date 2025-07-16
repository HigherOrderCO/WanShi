def Nat/add/monoid() -> Algebra/monoid(Nat, Nat/add, 0n):
  # is_associative = Algebra/associative(Nat, Nat/add)
  # is_unit = Algebra/unit(Nat, Nat/add, 0n)
  # Proof/and/intro<is_associative, is_unit>(Nat/add/associative, Nat/add/unit)
  Proof/and/intro<Algebra/associative(Nat, Nat/add), Algebra/unit(Nat, Nat/add, 0n)>(Nat/add/associative, Nat/add/unit)
