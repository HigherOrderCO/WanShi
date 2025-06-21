def Nat/mul(a: Nat, b: Nat) -> Nat:
  match a:
    case 0:
      0
    case 1 + p:
      Nat/add(b, Nat/mul(p, b))
