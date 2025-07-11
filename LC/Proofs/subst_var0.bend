
def LC/Proofs/subst_var0(s: LC/Term) -> LC/Term{LC/subst(0n, s, @Var{0n}) == LC/shift(0n, s)}:
  # by definition, subst(0,s,Var 0) = shift(0,s)
  finally
