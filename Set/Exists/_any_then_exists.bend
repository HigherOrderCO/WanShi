# Σa:A.P(a) -> ∃a∈A.P(a)
def Set/Exists/_any_then_exists(A: Set, P: A -> Set) -> Σa:A.P(a) -> Set/Exists(A,P):
  λsig.λC.λPC.
    match sig:
      case (a,Pa): PC(a,Pa)
