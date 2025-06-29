def Bool/xor(a: Bool, b: Bool) -> Bool:
  match a b:
    case True  False:
      True
    case False True:
      True
    case _     _:
      False
