def Nat/add/zero_unit() -> Proof/algebra/unit(Nat, Nat/add, 0n):
  left_unit = Proof/algebra/left_unit(Nat,Nat/add,0n)
  right_unit = Proof/algebra/right_unit(Nat,Nat/add,0n)
  Proof/and/intro<left_unit,right_unit>(Nat/add/zero_unit_left, Nat/add/zero_unit_right)
