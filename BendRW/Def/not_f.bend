
def BendRW/Def/not_f : BendRW/Def =
  @Def{
    @Lam{"x", λx. @BitM{x, @Bt1, @Bt0}},
    @All{"x", @Bit, λx. @Bit}
  }
