def List/zip<A,B>(x: A[], y: B[]) -> (A&B)[]:
  match x y:
    case [] []: []
    case (x <> xs) [] : []
    case [] (y<>ys) : []
    case (x <> xs) (y <> ys): (x,y) <> List/zip<A,B>(xs, ys)

