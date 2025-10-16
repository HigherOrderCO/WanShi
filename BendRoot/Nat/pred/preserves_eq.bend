def preserves_eq(a:Nat, b:Nat) -> Nat{a == b} -> Nat{Nat/pred(a)==Nat/pred(b)}:
  λeq.
    rewrite eq finally
