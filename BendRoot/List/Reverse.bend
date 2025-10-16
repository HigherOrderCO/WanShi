def Reverse<A>(xs: A[]) -> A[]:
  ReverseGo<A>(xs, [])

def ReverseGo<A>(xs: A[], acc: A[]) -> A[]:
  match xs:
    case []:
      acc
    case h <> t:
      ReverseGo<A>(t, h <> acc)
