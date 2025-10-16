
def Contains<A>(xs: A[], el: A, eq: A -> A -> Bool) -> Bool:
  match xs:
    case []:
      False
    case x <> xs:
      Bool/Or(eq(x, el), Contains<A>(xs, el, eq))

