
def TC/Board/set_cell(board: TC/Board, pos: TC/Position, player: TC/Player) -> TC/Board:
  match board:
    case @Board{c00, c01, c02, c10, c11, c12, c20, c21, c22}:
      match pos:
        case @Pos{row, col}:
          match row col:
            case 0n 0n:
              return @Board{@Filled{player}, c01, c02, c10, c11, c12, c20, c21, c22}
            case 0n 1n:
              return @Board{c00, @Filled{player}, c02, c10, c11, c12, c20, c21, c22}
            case 0n 2n:
              return @Board{c00, c01, @Filled{player}, c10, c11, c12, c20, c21, c22}
            case 1n 0n:
              return @Board{c00, c01, c02, @Filled{player}, c11, c12, c20, c21, c22}
            case 1n 1n:
              return @Board{c00, c01, c02, c10, @Filled{player}, c12, c20, c21, c22}
            case 1n 2n:
              return @Board{c00, c01, c02, c10, c11, @Filled{player}, c20, c21, c22}
            case 2n 0n:
              return @Board{c00, c01, c02, c10, c11, c12, @Filled{player}, c21, c22}
            case 2n 1n:
              return @Board{c00, c01, c02, c10, c11, c12, c20, @Filled{player}, c22}
            case 2n 2n:
              return @Board{c00, c01, c02, c10, c11, c12, c20, c21, @Filled{player}}
            case _ _:
              return board
