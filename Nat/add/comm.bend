def Nat/add/comm(a: Nat, b: Nat) -> Nat{Nat/add(a,b) == Nat/add(b,a)}:
  match a:
    case 0:
      Nat/add/zero_right(b)
    case 1+ap:
      {==} = Nat/add/comm(ap,b)
      {==} = Nat/add/succ_right(b,ap)
      {==}
