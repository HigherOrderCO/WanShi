# {a:A , P(a)} ⊢ Σa:A.P(a)
def Set/Exists/_a_pa_then_pair_a_pa(A:Set, P:A->Set, a:A) -> P(a) -> Σa:A.P(a):
  λPa.(a,Pa)
