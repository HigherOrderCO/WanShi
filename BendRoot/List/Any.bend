
def Any<A>(ls: A[], cond: A -> Bool) -> Bool:
  match ls:
    case []:
      False
    case x <> xs:
      Bool/Or(cond(x), Any<A>(xs, cond))

