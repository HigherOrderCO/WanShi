
def LC/Proofs/whnf_abs(body: LC/Term) -> LC/Term{LC/whnf(@Abs{body}) == @Abs{body}}:
  # whnf of an abstraction is itself
  finally
