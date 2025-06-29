def List/append<A>(xs: A[], ys: A[]) -> A[]:
  match xs:
    case []:
      ys
    case x <> xs:
      x <> List/append<A>(xs, ys)
