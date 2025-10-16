def eq(a: Nat, b: Nat) -> Bool:
  match a:
    case 0n:
      match b:
        case 0n:
          True
        case 1n + q:
          False
    case 1n + p:
      match b:
        case 0n:
          False
        case 1n + q:
          eq(p, q)
