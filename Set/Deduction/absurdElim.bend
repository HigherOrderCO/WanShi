# ⊥ ⊢ A
def Set/Deduction/absurdElim : ∀A:Set . (Empty -> A) =
  λA.λf.~f {}
