def Nat/add/preserves_eq_right() -> ∀a:Nat . ∀b:Nat . ∀c:Nat . Nat{a == b} -> Nat{Nat/add(a,c) == Nat/add(b,c)}:
  λa.λb.λc.λeq.
    match c:
      case 0n:
        rewrite Nat/add/unit_right(a)
        rewrite Nat/add/unit_right(b)
        eq
      case 1n+pc:
        ind = Nat/add/preserves_eq_right(a,b,pc,eq)
        rewrite Nat/succ/add_suc_right(a,pc)
        rewrite Nat/succ/add_suc_right(b,pc)
        Nat/succ/preserves_eq(Nat/add(a,pc), Nat/add(b,pc), ind)
