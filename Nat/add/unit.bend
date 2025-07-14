def Nat/add/unit() -> Proof/algebra/unit(Nat, Nat/add, 0n):
  # unit_left  = Proof/algebra/unit_left(Nat, Nat/add,0n)
  # unit_right = Proof/algebra/unit_right(Nat,Nat/add,0n)
  Proof/and/intro<∀a:Nat . Nat{Nat/add(0n,a) == a},∀a:Nat . Nat{Nat/add(a,0n) == a}>(Nat/add/unit_left, Nat/add/unit_right)
