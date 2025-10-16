
def Filter<A>(p: A -> Bool, xs: A[]) -> A[]:
  match xs:
    case []:
      []
    case h <> t:
      if p(h):
        h <> Filter<A>(p, t)
      else:
        Filter<A>(p, t)
