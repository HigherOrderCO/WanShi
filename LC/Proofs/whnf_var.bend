
def LC/Proofs/whnf_var(idx: Nat) -> LC/Term{LC/whnf(@Var{idx}) == @Var{idx}}:
  # whnf of a variable is itself
  finally
