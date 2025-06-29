
def List/length<A>(xs: A[]) -> U64:
  match xs:
    case []:
      0
    case h <> t:
      1 + List/length<A>(t)

def List/length_nat<A>(xs: A[]) -> Nat:
  match xs:
    case []:
      0n
    case h <> t:
      1n + List/length_nat<A>(t)
    
