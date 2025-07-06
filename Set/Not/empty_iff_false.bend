def Set/Not/empty_iff_false() -> Set/Iff(Empty, Set/Not/false):
  Set/Iff/Intro<Empty,Set/Not/false>(Set/Not/_empty_then_false, Set/Not/_false_then_empty)
