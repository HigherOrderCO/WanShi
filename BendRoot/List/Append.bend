def Append<A>(xs: A[], ys: A[]) -> A[]:
  match xs:
    case []:
      ys
    case x <> xs:
      x <> Append<A>(xs, ys)
