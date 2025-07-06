def Set/And/_pair_then_and<A,B>() -> Σa:A.B -> Set/And(A,B) :
  λsg.λC.λabc.
    match sg:
      case (a,b): abc(a,b)
