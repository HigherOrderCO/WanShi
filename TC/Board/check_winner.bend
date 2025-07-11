
def TC/Board/check_winner(board: TC/Board) -> TC/Player[]:
  match board:
    case @Board{c00, c01, c02, c10, c11, c12, c20, c21, c22}:
      # Check rows
      row0 = TC/Board/check_line(c00, c01, c02)
      row1 = TC/Board/check_line(c10, c11, c12)
      row2 = TC/Board/check_line(c20, c21, c22)
      
      # Check columns
      col0 = TC/Board/check_line(c00, c10, c20)
      col1 = TC/Board/check_line(c01, c11, c21)
      col2 = TC/Board/check_line(c02, c12, c22)
      
      # Check diagonals
      diag1 = TC/Board/check_line(c00, c11, c22)
      diag2 = TC/Board/check_line(c02, c11, c20)
      
      # Return first winner found
      match row0:
        case []:
          match row1:
            case []:
              match row2:
                case []:
                  match col0:
                    case []:
                      match col1:
                        case []:
                          match col2:
                            case []:
                              match diag1:
                                case []:
                                  return diag2
                                case winner:
                                  return winner
                            case winner:
                              return winner
                        case winner:
                          return winner
                    case winner:
                      return winner
                case winner:
                  return winner
            case winner:
              return winner
        case winner:
          return winner
