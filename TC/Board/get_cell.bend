
def TC/Board/get_cell(board: TC/Board, pos: TC/Position) -> TC/Cell:
  match board:
    case @Board{c00, c01, c02, c10, c11, c12, c20, c21, c22}:
      match pos:
        case @Pos{row, col}:
          match row col:
            case 0n 0n:
              return c00
            case 0n 1n:
              return c01
            case 0n 2n:
              return c02
            case 1n 0n:
              return c10
            case 1n 1n:
              return c11
            case 1n 2n:
              return c12
            case 2n 0n:
              return c20
            case 2n 1n:
              return c21
            case 2n 2n:
              return c22
            case _ _:
              return @Empty{}
