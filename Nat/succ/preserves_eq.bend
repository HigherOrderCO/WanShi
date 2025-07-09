def Nat/succ/preserves_eq() -> ∀a:Nat . ∀b:Nat . Nat{a == b} -> Nat{1n+a==1n+b}:
  λa.λb.λeq.
    match a:
      case 0n: 
        match b:
          case 0n: finally
          case 1n+pb: ~eq {}
      case 1n+pa:
        match b:
          case 0n: ~eq {}
          case 1n+pb: rewrite eq finally
