
def BendRW/Def/bft_f : BendRW/Def =
  @Def{
    @Lam{"x", λx. @BitM{x, @Rfl, @Rfl}},
    @All{"x", @Bit, λx. @Eql{@Bit, @App{BendRW/Def/tm(BendRW/Def/not_f), @App{BendRW/Def/tm(BendRW/Def/not_f), x}}, x}}
  }
