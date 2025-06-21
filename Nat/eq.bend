def Nat/eq(a: Nat, b: Nat) -> Bool:
  match a:
    case 0:
      match b:
        case 0:
          True
        case 1 + q:
          False
    case 1 + p:
      match b:
        case 0:
          False
        case 1 + q:
          Nat/eq(p, q)
