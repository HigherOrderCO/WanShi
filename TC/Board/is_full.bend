
def TC/Board/is_full(board: TC/Board) -> Bool:
  match board:
    case @Board{c00, c01, c02, c10, c11, c12, c20, c21, c22}:
      match c00 c01 c02 c10 c11 c12 c20 c21 c22:
        case @Filled{_} @Filled{_} @Filled{_} @Filled{_} @Filled{_} @Filled{_} @Filled{_} @Filled{_} @Filled{_}:
          return True
        case _ _ _ _ _ _ _ _ _:
          return False
