
def LC/subst(j: Nat, s: LC/Term, t: LC/Term) -> LC/Term:
  match t:
    case @Var{idx}:
      if Nat/eq(idx, j):
        return LC/shift(j, s)
      else:
        if LC/Nat/lt(j, idx):
          return @Var{Nat/pred(idx)}
        else:
          return @Var{idx}
    case @Abs{body}:
      # under a binder: bump j, and pre-shift the substitution
      return @Abs{LC/subst(1n + j, LC/shift(1n, s), body)}
    case @App{f, arg}:
      return @App{LC/subst(j, s, f), LC/subst(j, s, arg)}
