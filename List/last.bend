def List/last<A>(xs: A[]) -> Maybe<A>:
  match xs:
    case []:
      @None{}
    case x <> []:
      @Some{x}
    case x <> xs:
      List/last<A>(xs)
