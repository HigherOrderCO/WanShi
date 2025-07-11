
def LC/shift_zero(t: LC/Term) -> LC/Term{LC/shift(0n, t) == t}:
  match t:
    case @Var{idx}:
      # LC/Term{LC/shift(0n,Var idx)==Var idx}
      finally
    case @Abs{body}:
      eq_b = LC/shift_zero(body)
      rewrite eq_b
      finally
    case @App{f, arg}:
      eq_f   = LC/shift_zero(f)
      rewrite eq_f
      eq_arg = LC/shift_zero(arg)
      rewrite eq_arg
      finally
