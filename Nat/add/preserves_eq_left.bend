def Nat/add/preserves_eq_left() -> ∀a:Nat . ∀b:Nat . ∀c:Nat . Nat{a == b} -> Nat{Nat/add(c, a) == Nat/add(c, b)}:
  λa.λb.λc.λeq.
    match c:
      case 0n:
        eq
      case 1n+pc:
        ind = Nat/add/preserves_eq_left(a,b,pc,eq)
        Nat/succ/preserves_eq(Nat/add(pc,a),Nat/add(pc,b),ind)
