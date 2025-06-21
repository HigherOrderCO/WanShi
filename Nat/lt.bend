def Nat/lt(a: Nat, b: Nat) -> Bool:
  match a:
    case 0:
      match b:
        case 0:
          False
        case 1 + q:
          True
    case 1 + p:
      match b:
        case 0:
          False
        case 1 + q:
          Nat/lt(p, q)
