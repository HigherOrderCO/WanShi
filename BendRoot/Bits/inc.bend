
def inc(a: Bits) -> Bits:
  match a:
    case @E{}:
      @I{@E{}}
    case @O{pred}:
      @I{pred}
    case @I{pred}:
      @O{inc(pred)}
