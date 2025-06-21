def Pair/fst<A,B>(pair: Pair<A,B>) -> A:
  match pair:
    case @Pair{x,y}:
      x
