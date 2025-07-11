
def TC/Player/other(player: TC/Player) -> TC/Player:
  match player:
    case @X:
      return @O
    case @O:
      return @X
