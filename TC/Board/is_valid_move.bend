
def TC/Board/is_valid_move(board: TC/Board, pos: TC/Position) -> Bool:
  cell = TC/Board/get_cell(board, pos)
  match cell:
    case @Empty:
      return True
    case @Filled{player}:
      return False
