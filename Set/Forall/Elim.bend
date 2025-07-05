# {a:A, ∀a∈A:P(a)} ⊢ P(a)
def Set/Forall/Elim : ∀A:Set . (∀P: A -> Set . (∀apa: ∀a:A.P(a) . (∀a:A . (P(a))))) =
  λA.λP.λapa.λa.apa(a)
