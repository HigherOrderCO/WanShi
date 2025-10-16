# def andElimLeft(A:Set, B:Set, nd: Proof/and(A,B)) -> A:
#   ~nd{(,):λl.λr.l}
# def andElimRight(A:Set, B:Set, nd: Proof/and(A,B)) -> B:
#   ~nd{(,):λl.λr.r}

# def Nat/order/leq_transitive(x:Nat, y:Nat, z:Nat, xy: Nat/order/leq(x,y), yz: Nat/order/leq(y,z)) -> Nat/order/leq(x,z):
#   match z:
#     case 0n:
#       (x,finally)
#     case 1n+pz:
#       ind = Nat/order/leq_transitive(x,y,pz,xy)
#       my = ~xy{(,):λm.λe.m} :: Nat
#       mz = ~yz{(,):λm.λe.m} :: Nat
#       ey = ~xy{(,):λm.λe. pr = finally :: Nat{m==my} e} :: Nat{x==Nat/add(y,my)}
#       ()
def leq_transitive(x:Nat, y:Nat, z:Nat, xy: Nat/order/leq(x,y), yz: Nat/order/leq(y,z)) -> Nat/order/leq(x,z):
  # ~xy{(,):λa.λs1.
  #   ~yz{(,):λb.λs2.
  #     rewrite s2
  #     rewrite Proof/equal/symmetry(Nat, Nat/add(z,Nat/add(b,a)), Nat/add(Nat/add(z,b),a), Nat/add/associative(z,b,a))
  #     (Nat/add(b,a), s1)
  #   }
  # }
  match xy: case (a, s1):
    match yz: case (b, s2):
      rewrite s2
      rewrite Proof/Equal/Symmetry(Nat, Nat/add(z,Nat/add(b,a)), Nat/add(Nat/add(z,b),a), Nat/add/associative(z,b,a))
      (Nat/add(b,a), s1)
      # ()
