# Examples of Lambda Calculus terms and evaluation

# Identity function: λx.x
def identity() -> LC/Term:
  @Lam{"x", @Var{"x"}}

# Const function: λx.λy.x
def const() -> LC/Term:
  @Lam{"x", @Lam{"y", @Var{"x"}}}

# Self-application: λx.xx
def self_app() -> LC/Term:
  @Lam{"x", @App{@Var{"x"}, @Var{"x"}}}

# Example application: (λx.x) y
def example_app() -> LC/Term:
  @App{identity(), @Var{"y"}}

# Test evaluation
def test_eval() -> LC/Term:
  LC/eval(example_app())

# Church Numerals (Lambda encodings of natural numbers)
# Church numeral n = λf.λx.f(f(...f(x)...)) (n applications of f)

# Church numeral 0: λf.λx.x
def church_zero() -> LC/Term:
  @Lam{"f", @Lam{"x", @Var{"x"}}}

# Church numeral 1: λf.λx.f x
def church_one() -> LC/Term:
  @Lam{"f", @Lam{"x", @App{@Var{"f"}, @Var{"x"}}}}

# Church numeral 2: λf.λx.f (f x)
def church_two() -> LC/Term:
  @Lam{"f", @Lam{"x", @App{@Var{"f"}, @App{@Var{"f"}, @Var{"x"}}}}}

# Church numeral 3: λf.λx.f (f (f x))
def church_three() -> LC/Term:
  @Lam{"f", @Lam{"x", @App{@Var{"f"}, @App{@Var{"f"}, @App{@Var{"f"}, @Var{"x"}}}}}}

# Church addition: λm.λn.λf.λx.m f (n f x)
def church_add() -> LC/Term:
  @Lam{"m", 
    @Lam{"n", 
      @Lam{"f", 
        @Lam{"x", 
          @App{@App{@Var{"m"}, @Var{"f"}}, 
               @App{@App{@Var{"n"}, @Var{"f"}}, @Var{"x"}}}}}}}

# Helper function to apply church addition to two numbers
def apply_church_add(m: LC/Term, n: LC/Term) -> LC/Term:
  @App{@App{church_add(), m}, n}

# Test: 1 + 2 = 3 using Church numerals
def test_church_add() -> LC/Term:
  # Calculate 1 + 2
  one_plus_two = apply_church_add(church_one(), church_two())
  # Evaluate the result
  LC/eval(one_plus_two)

# Test: 2 + 1 = 3 using Church numerals  
def test_church_add_2() -> LC/Term:
  # Calculate 2 + 1
  two_plus_one = apply_church_add(church_two(), church_one())
  # Evaluate the result
  LC/eval(two_plus_one)

def main() -> String:
  # Test the church addition
  result = test_church_add()
  String/flat(["Church addition 1 + 2 = ", LC/Term/show(result)])
