# A ∧ B
def And(A: Set, B: Set) -> Set:
  ∀C:Set. ((A -> B -> C) -> C)
