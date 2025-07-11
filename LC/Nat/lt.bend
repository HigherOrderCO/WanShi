
def LC/Nat/lt(a: Nat, b: Nat) -> Bool:
  match a:
    case 0n:
      match b:
        case 0n:
          return False
        case 1n + _:
          return True
    case 1n + ap:
      match b:
        case 0n:
          return False
        case 1n + bp:
          return LC/Nat/lt(ap, bp)
