def Nat/add/commutative() -> Algebra/commutative<Nat,Nat>(Nat/add):
  λa.λb.
  match a:
    case 0n:
      rewrite Nat/add/unit_right(b)
      finally
    case 1n + pa:
      ind = Nat/add/commutative(pa,b)
      rewrite ind
      rewrite Nat/succ/add_suc_right(b,pa)
      finally




















