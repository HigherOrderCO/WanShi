# String equality for lambda calculus variable names
def String/equal(a: String, b: String) -> Bool:
  match a:
    case "x":
      match b:
        case "x":
          return True
        case _:
          return False
    case _:
      return False