def Set/Identities/hilbert_and1<A,B>() -> Set/And(A,B) -> A:
  λandAB.Set/And/ElimLeft<A,B>(andAB)
