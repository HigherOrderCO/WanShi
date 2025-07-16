
def Nat/leq(a: Nat, b: Nat) -> Bool:
  match a:
    case 0n:
      return True
    case 1n + ap:
      match b:
        case 0n:
          return False
        case 1n + bp:
          return Nat/leq(ap, bp)
