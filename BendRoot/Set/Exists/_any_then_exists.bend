# Σa:A.P(a) -> ∃a∈A.P(a)
def _any_then_exists(A: Set, P: A -> Set) -> Proof/Exists<A>(P) -> Set/Exists(A,P):
  λsig.λC.λPC.
    match sig:
      case (a,Pa): PC(a,Pa)
