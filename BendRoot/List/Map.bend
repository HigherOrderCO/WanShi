def Map<A,B>(xs: A[], f: A -> B) -> B[]:
  match xs:
    case []:
      []
    case x <> xs:
      f(x) <> Map<A,B>(xs,f)
