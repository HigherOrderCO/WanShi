# ⊥ ⊢ A
def absurdElim : ∀A:Set . (Empty -> A) =
  λA.λf.~f {}
