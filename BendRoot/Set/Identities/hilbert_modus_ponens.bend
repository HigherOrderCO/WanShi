def hilbert_modus_ponens<A,B>() -> ∀ab : A -> B . ∀a:A . B:
  λab.λa.Set/Implies/Elim<A,B>(ab,a)
