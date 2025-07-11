
def TC/Game/new() -> TC/Game:
  return @Game{
    TC/Board/empty(),
    @Playing{@X}
  }
