def Flat<A>(xss: A[][]) -> A[]:
  match xss:
    case []:
      []
    case xs <> xss:
      List/Append<A>(xs, Flat<A>(xss))
