def List/head<A>(xs: A[]) -> Maybe<A>:
  match xs:
    case []:
      @None{}
    case x <> xs:
      @Some{x}
  
