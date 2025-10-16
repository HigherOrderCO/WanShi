def gt(a:Nat, b:Nat) -> Set:
  Proof/And(Proof/Not(Nat/order/leq(b,a)),Proof/Not(Nat{a == b}))
