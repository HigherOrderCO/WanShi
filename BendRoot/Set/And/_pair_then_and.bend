def _pair_then_and<A,B>() -> Proof/And(A,B) -> Set/And(A,B) :
  λsg.λC.λabc.
    match sg:
      case (a,b): abc(a,b)
