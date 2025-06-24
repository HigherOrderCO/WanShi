def Bool/and(a: Bool, b: Bool) -> Bool:
  match a b:
    case True True:
      True
    case c    d:
      False
