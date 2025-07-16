def Nat/order/leq(a:Nat, b:Nat) -> Set:
  Proof/exists(Nat, λm. Nat{a == Nat/add(b,m)})
