
def LC/whnf(t: LC/Term) -> LC/Term:
  match t:
    case @App{f, arg}:
      match LC/whnf(f):
        case @Abs{body}:
          LC/whnf(LC/subst(0n, arg, body))
        case f2:
          @App{f2, arg}
    case t:
      t
