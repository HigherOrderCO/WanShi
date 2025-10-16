def leq(a:Nat, b:Nat) -> Set:
  Proof/Exists(Nat, λm. Nat{a == Nat/add(b,m)})
