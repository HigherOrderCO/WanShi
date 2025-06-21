def Nat/sub(a: Nat, b: Nat) -> Nat:
  match a:
    case 0:
      0
    case 1 + p:
      match b:
        case 0:
          a
        case 1 + q:
          Nat/sub(p, q)
