def Length<A>(xs: A[]) -> Nat:
  match xs:
    case []:
      0n
    case h <> t:
      1n + Length<A>(t)
    
