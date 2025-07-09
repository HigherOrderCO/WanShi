# {A,B} ⊢ A ∧ B
def Set/And/Intro : ∀A:Set . ∀B: Set. ∀a:A . ∀b:B. Set/And(A, B) =
  λA.λB.λa.λb.λC.λABC.(ABC a b)
