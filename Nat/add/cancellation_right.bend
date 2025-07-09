def Nat/add/cancellation_right() -> ∀a:Nat . ∀b:Nat . ∀c:Nat . Nat{Nat/add(a,c) == Nat/add(b,c)} -> Nat{a == b}:
  λa.λb.λc.λeq.
    match c:
      case 0n:
        rewrite Nat/add/zero_unit_right(a)
        rewrite Nat/add/zero_unit_right(b)
        eq
      case 1n+pc:
        ind = Nat/add/cancellation_right(a,b,pc)
        rewrite Nat/succ/add_suc_right(a,pc)
        rewrite Nat/succ/add_suc_right(b,pc)
        ind(Nat/pred/preserves_eq(1n+Nat/add(a,pc),1n+Nat/add(b,pc), eq))
