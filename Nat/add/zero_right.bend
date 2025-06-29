def Nat/add/zero_right(a: Nat) -> Nat{a == Nat/add(a,0n)}:
  match a:
    case 0n:
      finally
    case 1n + ap:
      1n + Nat/add/zero_right(ap)
