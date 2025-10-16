def leq_reflexive(a:Nat) -> Nat/order/leq(a,a):
  match a:
    case 0n:
      (0n,finally)
    case 1n+p:
      rewrite Nat/add/unit_right(p)
      (0n,finally)
