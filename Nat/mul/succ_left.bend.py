def Nat/mul/succ_left(a: Nat, b: Nat) -> Nat{Nat/mul(1+a, b) == Nat/add(b, Nat/mul(a,b))}:
  finally
