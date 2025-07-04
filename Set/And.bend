# A ∧ B
def Set/And(A: Set, B: Set) -> Set:
  ∀C:Set. ((A -> B -> C) -> C)
