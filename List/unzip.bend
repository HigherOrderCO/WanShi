def List/unzip<A,B>(ls: (A&B)[]) -> (A[] & B[]):
  match ls:
    case []: ([] , [])
    case (h <> tail):
      (xs,ys) = List/unzip<A,B>(tail)
      (x,y) = h
      (x <> xs, y <> ys)
