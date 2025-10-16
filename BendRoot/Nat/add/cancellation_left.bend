def cancellation_left() -> ∀a:Nat . ∀b:Nat . ∀c:Nat . Nat{Nat/add(c,a) == Nat/add(c,b)} -> Nat{a == b}:
  λa.λb.λc.λeq.
    match c:
      case 0n:
        eq
      case 1n+pc:
        ind = cancellation_left(a,b,pc)
        ind(Nat/pred/preserves_eq(1n+Nat/add(pc,a),1n+Nat/add(pc,b), eq))
