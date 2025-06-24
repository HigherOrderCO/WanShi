def main : String =
  Bend/show(@Lam{"x", λx. @Lam{"y", λy. @App{x,y}}})
