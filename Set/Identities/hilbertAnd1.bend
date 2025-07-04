def Set/IdentitieshilbertAnd1<A,B>() -> Set/And(A,B) -> A:
  λandAB.Set/Deduction/andElimLeft<A,B>(andAB)
