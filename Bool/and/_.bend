def Bool/and(a: Bool, b: Bool) -> Bool:
  match a:
    case False:
      False
    case True:
      b
