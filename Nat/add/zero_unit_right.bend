def Nat/add/zero_unit_right() -> Proof/algebra/right_unit(Nat, Nat/add,0n):
  λa.
  match a:
    case 0n:
      finally
    case 1n + ap:
      ind = Nat/add/zero_unit_right(ap)
      rewrite ind finally
