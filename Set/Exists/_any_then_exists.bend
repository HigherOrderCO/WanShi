# Σa:A.P(a) -> ∃a∈A.P(a)
def Set/Exists/_any_then_exists(A: Set, P: A -> Set) -> Proof/exists<A>(P) -> Set/Exists(A,P):
  λsig.λC.λPC.
    match sig:
      case (a,Pa): PC(a,Pa)
