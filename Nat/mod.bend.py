def Nat/mod(a: Nat, b: Nat) -> Nat:
  match b:
    case 0:
      a
    case 1 + q:
      match Nat/lt(a, b):
        case True:
          a
        case False:
          Nat/mod(Nat/sub(a, b), b)
