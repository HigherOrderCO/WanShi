def Or(a: Bool, b: Bool) -> Bool:
  match a:
    case True:
      True
    case False:
      b

