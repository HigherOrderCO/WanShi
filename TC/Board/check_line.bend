
def TC/Board/check_line(cell1: TC/Cell, cell2: TC/Cell, cell3: TC/Cell) -> TC/Player[]:
  match cell1 cell2 cell3:
    case @Filled{p1} @Filled{p2} @Filled{p3}:
      match p1 p2 p3:
        case @X @X @X:
          return [@X]
        case @O @O @O:
          return [@O]
        case _ _ _:
          return []
    case _ _ _:
      return []
