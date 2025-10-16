
def concat(strings: String[]) -> String:
  match strings:
    case []:
      return ""
    case s <> ss:
      return String/append(s, concat(ss))
