def Nat/mul/distrib_right(a: Nat, b: Nat, c: Nat) -> Nat{
  Nat/mul(a, Nat/add(b, c)) == Nat/add(Nat/mul(a, b), Nat/mul(a, c))
}:

  # We proceed by induction on the first argument `a`.
  match a:

    # -------------------------------------------------------------------
    # Base case : a = 0
    # -------------------------------------------------------------------
    #   Nat/mul(0, b + c)   ≡ 0                      (by definition)
    #   Nat/mul(0, b)       ≡ 0                      (by definition)
    #   Nat/mul(0, c)       ≡ 0                      (by definition)
    #   RHS = 0 + 0         ≡ 0                      (add/zero_right)
    # Both sides reduce to 0, hence `finally` is enough.
    case 0:
      finally

    # -------------------------------------------------------------------
    # Inductive step : a = 1 + ap
    # Induction hypothesis
    #   Nat/mul(ap, b + c) == Nat/add(Nat/mul(ap, b), Nat/mul(ap, c))
    # -------------------------------------------------------------------
    case 1 + ap:

      # Move the term we want to rewrite (`Nat/mul(ap, b + c)`) to the front so
      # that it appears in a position where `rewrite` can easily match.
      rewrite Nat/add/comm(Nat/add(b, c), Nat/mul(ap, Nat/add(b, c)))

      # Apply the induction hypothesis.
      rewrite Nat/mul/distrib_right(ap, b, c)


      # Expand the two `Nat/mul(1+ap, …)` occurrences on the right-hand side.
      rewrite Nat/mul/succ_left(ap, b)
      rewrite Nat/mul/succ_left(ap, c)

      # Current shape: ap*b + (ap*c + (b + c))

      # 1. Re-associate the outer addition to flatten the first three terms so
      #    we can manipulate them individually.
      #    Result: ap*b + ap*c + b + c
      rewrite Nat/add/assoc(Nat/mul(ap, b), Nat/mul(ap, c), Nat/add(b, c))

      # 2. Re-associate inside to expose `ap*c` and `b` as siblings.
      #    ap*b + ((ap*c + b) + c)
      rewrite Nat/add/assoc(Nat/mul(ap, c), b, c)

      # 3. Swap `ap*c` and `b` so we have `b` next to `ap*b`.
      rewrite Nat/add/comm(Nat/mul(ap, c), b)

      # 4. Re-associate to group `(ap*b, b)` and `(ap*c, c)`.
      #    (ap*b + b) + (ap*c + c)
      rewrite Nat/add/assoc(Nat/mul(ap, b), b, Nat/add(Nat/mul(ap, c), c))

      # 5. Swap inside each inner addition to obtain the required order.
      rewrite Nat/add/comm(Nat/mul(ap, b), b)
      rewrite Nat/add/comm(Nat/mul(ap, c), c)

      finally
