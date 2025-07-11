
def TC/Game/make_move(game: TC/Game, pos: TC/Position) -> TC/Game:
  match game:
    case @Game{board, state}:
      match state:
        case @Playing{current_player}:
          # Check if move is valid
          if TC/Board/is_valid_move(board, pos):
            # Make the move
            new_board = TC/Board/set_cell(board, pos, current_player)
            
            # Check for winner
            winner = TC/Board/check_winner(new_board)
            match winner:
              case []:
                # No winner, check if board is full
                if TC/Board/is_full(new_board):
                  return @Game{new_board, @Draw{}}
                else:
                  # Continue playing with other player
                  next_player = TC/Player/other(current_player)
                  return @Game{new_board, @Playing{next_player}}
              case [winning_player]:
                # We have a winner
                return @Game{new_board, @Won{winning_player}}
          else:
            # Invalid move, return game unchanged
            return game
        case @Won{winner}:
          # Game already won, no more moves allowed
          return game
        case @Draw:
          # Game is draw, no more moves allowed
          return game
