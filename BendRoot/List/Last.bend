def Last<A>(xs: A[]) -> Maybe<A>:
  match xs:
    case []:
      @None{}
    case x <> []:
      @Some{x}
    case x <> xs:
      Last<A>(xs)
