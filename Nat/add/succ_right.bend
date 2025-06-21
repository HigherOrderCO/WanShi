def Nat/add/succ_right(a: Nat, b: Nat) -> Nat{Nat/add(a,1+b) == 1+Nat/add(a,b)}:
  match a:
    case 0:
      {==}
    case 1+ap:
      1 + Nat/add/succ_right(ap,b)
