def List/length<A>(xs: A[]) -> Nat:
  match xs:
    case []:
      0n
    case h <> t:
      1n + List/length<A>(t)
    
