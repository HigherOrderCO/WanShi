def Nat/pow(a: Nat, b: Nat) -> Nat:
  match b:
    case 0:
      1
    case 1 + p:
      Nat/mul(a, Nat/pow(a, p))
