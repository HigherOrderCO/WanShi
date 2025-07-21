def List/all<A>(ls: A[], cond: A -> Bool) -> Bool:
  match ls:
    case []:
      True
    case x <> xs:
      Bool/and(cond(x), List/all<A>(xs, cond))

