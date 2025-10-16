# Σa:A.P(a) <-> ∃a∈A : P(a)
def any_iff_exists(A: Set, P: A -> Set) -> Set/Iff(Proof/Exists<A>(P), Set/Exists(A,P)):
  Set/Iff/Intro<Σa:A.P(a), Set/Exists(A,P)>(Set/Exists/_any_then_exists(A,P), Set/Exists/_exists_then_any(A,P))
