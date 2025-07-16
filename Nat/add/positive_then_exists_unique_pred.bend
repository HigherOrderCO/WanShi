def Nat/add/positive_then_exists_unique_pred(a:Nat) -> Nat/order/positive(a) -> Proof/exists_unique(Nat, λp. Nat{1n+p == a}):
  λap.
    match a:
      case 0n:
        ~(ap(finally)){}
      case 1n+pa:
        (pa,(finally,λx.λxpa.Nat/pred/preserves_eq(1n+x,1n+pa, xpa)))
