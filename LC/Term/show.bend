# Display function for Lambda Calculus terms
def LC/Term/show(term: LC/Term) -> String:
  match term:
    case @Var{name}:
      return name
    case @Lam{param, body}:
      return String/flat(["λ", param, ".", LC/Term/show(body)])
    case @App{func, arg}:
      return String/flat(["(", LC/Term/show(func), " ", LC/Term/show(arg), ")"])