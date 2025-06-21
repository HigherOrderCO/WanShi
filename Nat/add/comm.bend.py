def Nat/add/comm(a: Nat, b: Nat) -> Nat{Nat/add(a,b) == Nat/add(b,a)}:
  match a:
    case 0n:
      Nat/add/zero_right(b)
    case 1n+ap:
      rewrite Nat/add/comm(ap,b)
      rewrite Nat/add/succ_right(b,ap)
      finally
