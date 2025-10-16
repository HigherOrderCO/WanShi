def distributive_left() -> Algebra/distributive_left<Nat>(Nat/mul, Nat/add):
  λa.λb.λc.
    match c:
      case 0n:
        finally
      case 1n+pc:
        ind = distributive_left(a,b,pc)
        
        rewrite ind
        assoc1 = Nat/add/associative(Nat/add(a,Nat/mul(pc,a)), b, Nat/mul(pc,b))
        rewrite assoc1

        assoc2 = Nat/add/associative(a,Nat/mul(pc,a), b)
        assoc2 = Proof/Equal/Symmetry(Nat,
          Nat/add(a, Nat/add(Nat/mul(pc,a), b)),
          Nat/add(Nat/add(a, Nat/mul(pc, a)), b), assoc2)
        rewrite assoc2
        rewrite Nat/add/commutative(Nat/mul(pc,a), b)

        assoc3 = Nat/add/associative(a,b,Nat/mul(pc,a))
        rewrite assoc3

        assoc4 = Nat/add/associative(Nat/add(a,b),Nat/mul(pc,a), Nat/mul(pc,b))
        assoc4 = Proof/Equal/Symmetry(Nat,
          Nat/add(Nat/add(a,b), Nat/add(Nat/mul(pc,a), Nat/mul(pc,b))),
          Nat/add(Nat/add(Nat/add(a,b), Nat/mul(pc,a)), Nat/mul(pc,b)), assoc4)
        rewrite assoc4

        finally
