def Set/Or/_pair_bool_then_or<A,B>() -> Proof/or(A,B) -> Set/Or(A,B):
  λsg.λC.
   match sg:
    case (b, t):
      match b:
        case False: λac.λbc.ac(t)
        case True: λac.λbc.bc(t)
