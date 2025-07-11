def Nat/cmp(a: Nat, b: Nat) -> Cmp:
  match a:
    case 0n:
      match b:
        case 0n:
          @EQ
        case 1n+b:
          @LT
    case 1n+a:
      match b:
        case 0n:
          @GT
        case 1n+b:
          Nat/cmp(a, b)
