
def Concat<A>(xs: A[], ys: A[]) -> A[]:
  match xs:
    case []:
      ys
    case x <> xs:
      x <> Concat<A>(xs, ys) 

  
