def Nat/sub(a: Nat, b: Nat) -> Nat:
  match a:
    case 0n:
      0n
    case 1n + p:
      match b:
        case 0n:
          a
        case 1n + q:
          Nat/sub(p, q)
