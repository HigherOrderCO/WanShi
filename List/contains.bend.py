
def List/contains<A>(xs: A[], el: A, eq: A -> A -> Bool) -> Bool:
  match xs:
    case []:
      False
    case x <> xs:
      Bool/or(eq(x, el), List/contains<A>(xs, el, eq))

