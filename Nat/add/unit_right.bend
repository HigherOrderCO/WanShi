def Nat/add/unit_right() -> Algebra/unit_right(Nat, Nat/add,0n):
  λa.
  match a:
    case 0n:
      finally
    case 1n + ap:
      ind = Nat/add/unit_right(ap)
      rewrite ind finally
