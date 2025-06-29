
def List/reverse<A>(xs: A[]) -> A[]:
  match xs:
    case []:
      []
    case h <> t:
      List/append<A>(List/reverse<A>(t), [h])

