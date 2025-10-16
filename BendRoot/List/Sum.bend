def Sum(xs: Nat[]) -> Nat:
  match xs:
    case []:
      0n
    case x <> xs:
      Nat/add(x, Sum(xs))
