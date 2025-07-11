
def BendRW/Def/ex0_f : BendRW/Def =
  @Def{
    @Lam{"x", λx. @Lam{"y", λy. x}},
    @All{"x", @Nat, λx. @All{"y", @Bit, λy. @Nat}}
  }
