def main : Char =
  U64_TO_CHAR(65)

#def main : String =
  #Bend/show(@Lam{"x", λx. @Lam{"y", λy. @App{x,y}}})
