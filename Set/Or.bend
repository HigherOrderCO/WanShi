# A ∨ B
def Set/Or(A: Set, B: Set) -> Set:
  ∀C:Set. ((A -> C) -> (B -> C) -> C)
