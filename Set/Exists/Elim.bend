# {∃x∈A:P(a), ∀x∈A:P(x) -> B} ⊢ B
def Set/Exists/Elim : ∀A:Set . (∀B: Set. (∀P: A -> Set . (∀l: Set/Exists(A,P) . (∀r: ∀a:A.(P(a) -> B) . (B))))) =
  λA.λB.λP.λl.λr.l(B)(r)
