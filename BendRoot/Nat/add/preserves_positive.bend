def preserves_positive(a:Nat, b:Nat) -> Nat/order/positive(a) -> Nat/order/positive(Nat/add(a,b)):
  λap.λabp.
    match a:
      case 0n:
        ap(finally)
      case 1n+pa:
        ~abp{}
