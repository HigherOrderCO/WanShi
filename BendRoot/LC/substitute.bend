# Substitution function: substitute variable with term
def substitute(term: LC/Term, var: String, replacement: LC/Term) -> LC/Term:
  match term:
    case @Var{name}:
      if String/equal(name, var):
        return replacement
      else:
        return term
    case @Lam{param, body}:
      if String/equal(param, var):
        # Variable is bound, don't substitute
        return term
      else:
        # Substitute in body
        new_body = substitute(body, var, replacement)
        return @Lam{param, new_body}
    case @App{func, arg}:
      new_func = substitute(func, var, replacement)
      new_arg = substitute(arg, var, replacement)
      return @App{new_func, new_arg}
