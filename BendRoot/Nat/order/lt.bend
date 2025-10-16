def lt(a:Nat, b:Nat) -> Set:
  Proof/And(Nat/order/leq(a,b),Proof/Not(Nat{a == b}))
