
def TC/Game/is_over(game: TC/Game) -> Bool:
  match game:
    case @Game{board, state}:
      match state:
        case @Playing{current_player}:
          return False
        case @Won{winner}:
          return True
        case @Draw:
          return True
