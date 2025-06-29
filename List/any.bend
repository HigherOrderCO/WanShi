
def List/any<A>(ls: A[], cond: A -> Bool) -> Bool:
  match ls:
    case []:
      False
    case x <> xs:
      Bool/or(cond(x), List/any<A>(xs, cond))

