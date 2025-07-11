# Natural number equality function
def Nat/eql(a: Nat, b: Nat) -> Bool:
  match a b:
    case 0n 0n:
      return True
    case 1n+a 0n:
      return False
    case 0n 1n+b:
      return False
    case 1n+a 1n+b:
      return Nat/eql(a, b)