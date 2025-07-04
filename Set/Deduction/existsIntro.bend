# {a∈A, P(a)} ⊢ ∃a:A . P(a)
def Set/Deduction/existsIntro : ∀A: Set . (∀P: A -> Set . (∀a:A . (∀pa:P(a) . (Set/Exists(A,P))))) =
  λA.λP.λa.λpa.λC.λI.I(a)(pa)
