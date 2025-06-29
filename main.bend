#def main : Char =
  #U64_TO_CHAR(65)

#def main : String =
  #Bend/show(@Lam{"x", λx. @Lam{"y", λy. @App{x,@Val{@U64_V{1234}}}}})


def Foo(x: F64) -> F64:
  x ** 2.0

def main : F64 = Foo(3.0)
