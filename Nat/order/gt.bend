def Nat/order/lt(a:Nat, b:Nat) -> Set:
  Proof/and(Nat/order/lt(b,a),Proof/not(Nat{a == b}))
