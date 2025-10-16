def hilbert_and2<A,B>() -> Set/And(A,B) -> B:
  λandAB.Set/And/ElimRight<A,B>(andAB)
