def Proof/and/intro<A,B>() -> ∀a:A . ∀b:B . Proof/and(A,B):
  λa.λb.(a,b)
