def List/flat<A>(xss: A[][]) -> A[]:
  match xss:
    case []:
      []
    case xs <> xss:
      List/append<A>(xs, List/flat<A>(xss))
