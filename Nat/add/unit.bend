def Nat/add/unit() -> Algebra/unit(Nat, Nat/add, 0n):
  # unit_left  = Algebra/unit_left(Nat, Nat/add,0n)
  # unit_right = Algebra/unit_right(Nat,Nat/add,0n)
  Proof/and/intro<∀a:Nat . Nat{Nat/add(0n,a) == a},∀a:Nat . Nat{Nat/add(a,0n) == a}>(Nat/add/unit_left, Nat/add/unit_right)
