def Nat/show(n: Nat) -> String:
  match n:
    case 0n:
      "0"
    case 1n + p:
      '↑' <> Nat/show(p)
