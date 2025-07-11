
def TC/Proofs/new_game_properties() -> TC/Player{
  match TC/Game/new():
    case @Game{board, state}:
      match state:
        case @Playing{current_player}:
          return current_player
        case @Won{winner}:
          return @X  # This case should never happen
        case @Draw:
          return @X  # This case should never happen
}:
  finally
