def Nat/div(a: Nat, b: Nat) -> Nat:
  match b:
    case 0:
      0
    case 1 + q:
      match Nat/lt(a, b):
        case True:
          0
        case False:
          1 + Nat/div(Nat/sub(a, b), b)
