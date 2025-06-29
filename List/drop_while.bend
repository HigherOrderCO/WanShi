
def List/drop_while<A>(xs: A[], cond: A -> Bool) -> A[]:
  match xs:
    case []:
      []
    case x <> xs:
      if cond(x):
        List/drop_while<A>(xs, cond)
      else:
        x <> xs
