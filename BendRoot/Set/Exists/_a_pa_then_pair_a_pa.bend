# {a:A , P(a)} ⊢ Σa:A.P(a)
def _a_pa_then_pair_a_pa(A:Set, P:A->Set, a:A) -> P(a) -> Proof/Exists<A>(P):
  λPa.(a,Pa)
