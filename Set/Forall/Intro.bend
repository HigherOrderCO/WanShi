# {a:A, P(a)} ⊢ ∀a∈A:P(a)
def Set/Forall/Intro : ∀A:Set . (∀P: A -> Set . (∀apa: ∀a:A.(P(a)) . (∀a:A.P(a)))) =
  λA.λP.λapa.apa
