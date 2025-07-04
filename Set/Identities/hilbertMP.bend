def Set/Identities/hilbertMP<A,B>() -> ∀ab : A -> B . ∀a:A . B:
  λab.λa.Set/Deduction/impliesElim<A,B>(ab,a)
