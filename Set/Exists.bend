# ∃a ∈ A : P(a)
def Set/Exists(A : Set, P: A -> Set) -> Set:
  ∀C:Set . ((∀a:A . (P(a) -> C)) -> C)
