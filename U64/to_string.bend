def U64/to_string/go(n: U64, s: String) -> String:
  if n === 0:
    match s:
      case []:
        "0"
      case h <> t:
        s
  else:
    c = U64/to_char((n % 10) + 48)
    U64/to_string/go(n / 10, c <> s)

def U64/to_string(n: U64) -> String:
  U64/to_string/go(n, "")
