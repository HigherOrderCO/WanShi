def All<A>(ls: A[], cond: A -> Bool) -> Bool:
  match ls:
    case []:
      True
    case x <> xs:
      Bool/And(cond(x), All<A>(xs, cond))

