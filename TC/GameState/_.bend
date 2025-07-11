
type TC/GameState:
  case @Playing:
    current_player: TC/Player
  case @Won:
    winner: TC/Player
  case @Draw:
