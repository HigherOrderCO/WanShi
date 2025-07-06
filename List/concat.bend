
def List/concat<A>(xs: A[], ys: A[]) -> A[]:
  match xs:
    case []:
      ys
    case x <> xs:
      x <> List/concat<A>(xs, ys) 

  
