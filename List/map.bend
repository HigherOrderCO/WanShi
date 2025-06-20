def map<A,B>(xs: A[], f: A -> B) -> B[]:
  match xs:
    case []:
      []
    case x <> xs:
      f(x) <> map<A,B>(xs,f)
