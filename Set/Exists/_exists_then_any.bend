# ∃a∈A . P(a) -> Σa:A.P(a)
def Set/Exists/_exists_then_any(A: Set, P: A -> Set) -> Set/Exists(A,P) -> Σa:A.P(a):
  pair = Set/Exists/_a_pa_then_pair_a_pa(A,P)
  λI.I(Σa:A.P(a))(pair)
