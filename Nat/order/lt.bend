def Nat/order/lt(a:Nat, b:Nat) -> Set:
  Proof/and(Nat/order/lt(a,b),Proof/not(Nat{a == b}))
