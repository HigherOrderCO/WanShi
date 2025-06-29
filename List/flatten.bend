def List/flatten<A>(xss: A[][]) -> A[]:
  match xss:
    case []:
      []
    case xs <> xss:
      List/append<A>(xs, List/flatten<A>(xss))
