def Nat/pow(a: Nat, b: Nat) -> Nat:
  match b:
    case 0n:
      1n
    case 1n + p:
      Nat/mul(a, Nat/pow(a, p))
