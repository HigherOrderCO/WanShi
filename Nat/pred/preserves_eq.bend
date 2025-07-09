def Nat/pred/preserves_eq() -> ∀a:Nat . ∀b:Nat . Nat{a == b} -> Nat{Nat/pred(a)==Nat/pred(b)}:
  λa.λb.λeq.
    rewrite eq finally
