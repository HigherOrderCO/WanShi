
def Bool/or(a: Bool, b: Bool) -> Bool:
  match a b:
    case True _:
      True
    case _    True:
      True
    case _    _:
      False

