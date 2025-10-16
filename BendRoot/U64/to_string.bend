def to_stringGo(n: U64, s: String) -> String:
  if n === 0:
    match s:
      case []:
        "0"
      case h <> t:
        s
  else:
    c = U64_TO_CHAR((n % 10) + 48)
    to_stringGo(n / 10, c <> s)

def to_string(n: U64) -> String:
  to_stringGo(n, "")
