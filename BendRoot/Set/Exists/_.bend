# ∃a ∈ A : P(a)
def Exists(A : Set, P: A -> Set) -> Set:
  ∀C:Set . ((∀a:A . (P(a) -> C)) -> C)
