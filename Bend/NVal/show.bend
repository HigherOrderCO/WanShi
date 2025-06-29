def Bend/NVal/show(v: Bend/NVal) -> String:
  match v:
    case @U64_V{n}:
      U64/show(n)
    case @I64_V{n}:
      "TODO"
    case @F64_V{n}:
      "TODO"
    case @CHR_V{n}:
      "TODO"
