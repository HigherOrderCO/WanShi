# ⊥ ⊢ A
def Set/Not/absurdElim : ∀A:Set . (Empty -> A) =
  λA.λf.~f {}
