# A ∨ B
def Or(A: Set, B: Set) -> Set:
  ∀C:Set. ((A -> C) -> (B -> C) -> C)
