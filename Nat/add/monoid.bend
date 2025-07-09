def Nat/add/monoid() -> Proof/algebra/monoid(Nat, Nat/add, 0n):
  is_associative = Proof/algebra/associative(Nat, Nat/add)
  is_unit = Proof/algebra/unit(Nat, Nat/add, 0n)
  Proof/and/intro<is_associative, is_unit>(Nat/add/associative, Nat/add/unit)
