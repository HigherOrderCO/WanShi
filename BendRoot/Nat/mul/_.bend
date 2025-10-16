def mul(a: Nat, b: Nat) -> Nat:
  match a:
    case 0n:
      0n
    case 1n + p:
      Nat/add(b, Nat/mul(p, b))
