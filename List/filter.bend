
def List/filter<A>(p: A -> Bool, xs: A[]) -> A[]:
  match xs:
    case []:
      []
    case h <> t:
      if p(h):
        h <> List/filter<A>(p, t)
      else:
        List/filter<A>(p, t)
