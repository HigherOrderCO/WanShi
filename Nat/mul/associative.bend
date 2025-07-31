# def Nat/mul/associative() -> Algebra/associative(Nat, Nat/mul):
#   λa.λb.λc.
#     match a:
#       case 0n:
#         finally
#       case 1n+pa:
#         ind = Nat/mul/associative(pa, b, c)
#         rewrite Nat/mul/distributive_right(b,Nat/mul(pa,b),c)
#         x = Nat/mul(pa,Nat/mul(b,c))
#         y = Nat/mul(Nat/mul(pa,b),c)
#         z = Nat/mul(b,c)
#         Nat/add/preserves_eq_left(x,y,z)(ind)

def Nat/mul/associative() -> Algebra/associative(Nat, Nat/mul):
  λa.λb.λc.
    match a:
      case 0n:
        finally
      case 1n+pa:
        ind = Nat/mul/associative(pa, b, c)
        rewrite Nat/mul/distributive_right(b,Nat/mul(pa,b),c)
        Nat/add/preserves_eq_left(Nat/mul(pa,Nat/mul(b,c)),Nat/mul(Nat/mul(pa,b),c),Nat/mul(b,c))(ind)
