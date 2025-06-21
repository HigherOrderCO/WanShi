def Nat/lte(a: Nat, b: Nat) -> Bool:
  match a:
    case 0:
      True
    case 1 + p:
      match b:
        case 0:
          False
        case 1 + q:
          Nat/lte(p, q)
