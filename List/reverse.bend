def List/reverse<A>(xs: A[]) -> A[]:
  List/reverse/go<A>(xs, [])

def List/reverse/go<A>(xs: A[], acc: A[]) -> A[]:
  match xs:
    case []:
      acc
    case h <> t:
      List/reverse/go<A>(t, h <> acc)
