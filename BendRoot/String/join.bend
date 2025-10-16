def join(xs: String[], sep: String) -> String:
  match xs:
    case []:
      []
    case x <> []:
      x
    case x <> xs:
      List/Append<Char>(x, List/Append<Char>(sep, join(xs, sep)))
