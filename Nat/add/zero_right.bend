def Nat/add/zero_right(a: Nat) -> Nat{a == Nat/add(a,0)}:
  match a:
    case 0:
      {==}
    case 1+ap:
      1 + Nat/add/zero_right(ap)
