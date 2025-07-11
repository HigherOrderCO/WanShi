def Set/And/_and_then_pair<A,B>() -> Set/And(A,B) -> Proof/and(A,B):
  λnd. nd(Σa:A.B)(λa1.λb1.(a1,b1))
