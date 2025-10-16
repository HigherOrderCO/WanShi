
def Drop_while<A>(xs: A[], cond: A -> Bool) -> A[]:
  match xs:
    case []:
      []
    case x <> xs:
      if cond(x):
        Drop_while<A>(xs, cond)
      else:
        x <> xs
