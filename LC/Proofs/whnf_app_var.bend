
def LC/Proofs/whnf_app_var(idx: Nat, arg: LC/Term) -> LC/Term{LC/whnf(@App{@Var{idx}, arg}) == @App{@Var{idx}, arg}}:
  eq_f = LC/Proofs/whnf_var(idx)
  rewrite eq_f
  # now whnf(@App{Var idx, arg}) returns the application unchanged
  finally
