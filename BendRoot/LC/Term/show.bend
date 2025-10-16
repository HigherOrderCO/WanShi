# Display function for Lambda Calculus terms
def show(term: LC/Term) -> String:
  match term:
    case @Var{name}:
      return name
    case @Lam{param, body}:
      return String/flat(["λ", param, ".", LC/Term/show(body)])
    case @App{func, arg}:
      return String/flat(["(", show(func), " ", show(arg), ")"])
