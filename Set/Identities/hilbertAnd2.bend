def Set/Identities/hilbertAnd2<A,B>() -> Set/And(A,B) -> B:
  λandAB.Set/Deduction/andElimRight<A,B>(andAB)
