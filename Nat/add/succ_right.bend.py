def Nat/add/succ_right(a: Nat, b: Nat) -> Nat{Nat/add(a,1n+b) == (1n+Nat/add(a,b))}:
  match a:
    case 0n:
      finally
    case 1n + ap:
      1n + Nat/add/succ_right(ap,b)
