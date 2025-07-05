# {a:A, P(a)} ⊢ ∀a∈A:P(a)
def Set/Deduction/forallIntro : ∀A:Set . (∀P: A -> Set . (∀apa: ∀a:A.(P(a)) . (∀a:A.P(a)))) =
  λA.λP.λapa.apa
