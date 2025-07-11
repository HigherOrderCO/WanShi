def LC/shift_rec(d: Nat, c: Nat, t: LC/Term) -> LC/Term:
    match t:
      case @Var{idx}:
        if LC/Nat/lt(c, idx):
          return @Var{Nat/add(idx, d)}
        else:
          return @Var{idx}
      case @Abs{body}:
        return @Abs{LC/shift_rec(d, 1n + c, body)}
      case @App{f, arg}:
        return @App{LC/shift_rec(d, c, f), LC/shift_rec(d, c, arg)}

def LC/shift(d: Nat, t: LC/Term) -> LC/Term:
  LC/shift_rec(d, 0n, t)
