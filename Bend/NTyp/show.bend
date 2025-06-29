def Bend/NTyp/show(t: Bend/NTyp) -> String:
  match t:
    case @U64_T{}:
      "U64"
    case @I64_T{}:
      "I64"
    case @F64_T{}:
      "F64"
    case @CHR_T{}:
      "Char"
