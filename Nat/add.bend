def add(a: Nat, b: Nat) -> Nat:
  match a:
    case 0:
      b
    case 1 + p:
      1 + add(p, b)
