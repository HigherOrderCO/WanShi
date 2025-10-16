def snd<A,B>(pair: Pair<A,B>) -> B:
  match pair:
    case @Pair{x,y}:
      y
