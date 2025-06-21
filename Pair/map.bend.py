def Pair/map<A,B,C,D>(f: A -> C, g: B -> D, pair: Pair<A,B>) -> Pair<C,D>:
  match pair:
    case @Pair{x,y}:
      @Pair{f(x), g(y)}
