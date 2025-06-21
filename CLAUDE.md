# WanShi is a library of Bend programs & proofs.

# Bend Usage

Check a file, and run `main` (if present):

```
bend Path/To/file.bend
```

NOTES:

- Always check and test a file after writing it.

- Write only one definition per file.

# Bend Syntax Reference

## Comments

```python
# Single line comment
```

## Basic Types

### Primitives

```python
Set      # Type universe
Empty    # Empty type
Unit     # Unit type
()       # Unit value
Bool     # Boolean type  
False    # Boolean false
True     # Boolean true
Nat      # Natural number type
0        # Zero
123      # Natural number literals
```

### Enums

```python
@{@A, @B, @C}   # Enum type
@Tag            # Enum value
```

### Compound Types

```python
T[]             # List of T
A -> B          # Function type (sugar for all _:A. B)
A & B           # Product type (sugar for any _:A. B)
all x:A. B      # Dependent function type
all x:A y:B. C  # Multi-argument dependent function
any x:A. B      # Dependent pair type
any x:A y:B. C  # Multi-argument dependent pair
T{a == b}       # Propositional Equality type
```

## Variables and Bindings

```python
x               # Variable
x = v           # Assignment (untyped)
x : T = v       # Assignment (typed)
```

## Functions

```python
lam x. e        # Lambda abstraction
lam x y z. e    # Multi-argument lambda
f(a, b, c)      # Function application

# Function definition sugar:
def f(x: A, y: B) -> C:
  body
```

Note: All functions take exactly one argument. Multi-argument syntax is sugar for curried functions.

## Pattern Matching

### Simple Patterns

```python
# Booleans
if cond:
  trueCase
else:
  falseCase

# Natural numbers  
match n:
  case 0:
    zeroCase
  case 1 + p:
    succCase
```

### General Pattern Matching

```python
match x y ...:
  with a = val0
  with b = val1
  ...
  case pat1 pat2 ...:
    body1
  case pat3 pat4 ...:
    body2
  ...
```

The `with` clause serves two purposes:
- Linearizes a variable (useful for HVM target)
- Specializes its type (useful for theorem proving)

### Eliminators (Low-level)

Pattern matches desugar to native eliminators, which can also be used directly:

```python
λ{(): e}              # Unit eliminator
λ{False: f; True: t}  # Bool eliminator  
λ{0: z; +: s}         # Nat eliminator
λ{[]: n; <>: c}       # List eliminator
λ{(,): f}             # Pair eliminator
λ{{==}: f}            # Equality eliminator
λ{@A: a; @B: b}       # Enum eliminator
```

## Data Constructors

### Lists

```python
[]              # Empty list
[1, 2, 3]       # List literal
h <> t          # Cons
```

### Tuples

```python
(a, b)          # Tuples
(a, b, c)       # Nested tuples: (a, (b, c))
```

### Equality

```python
{==}            # Reflexivity proof
```

## Type Annotations

```python
x :: T          # Type hint
```

## Simple Datatypes

Declaration:

```python
type Maybe<A: Set>:
  case @None:
  case @Some:
    value: A
```

Constructor:

```python
@None{}      # desugars to (@None,())
@Some{value} # desugars to (@Some,value,())
```

Pattern-Matching:

```python
match x:
  case @None{}:
    ...
  case @Some{value}:
    ...
```

## Inductive Datatypes

Declaration:

```python
# Same as:
# data Vec (A : Set) : Nat → Set where
#   nil  : Vec A zero
#   cons : ∀ {n} → A → Vec A n → Vec A (suc n)
type Vec<A: Set>(N: Nat) -> Set:
  case @Nil:
    e: Nat{N == 0}
  case @Cons:
    n: Nat
    h: A
    t: Vec(A, n)
    e: Nat{N == 1+n}
```

This desugars to a function that returns a dependent pair:
- First component: an enum tag (@Nil or @Cons)
- Second component: a record of fields based on the constructor

Constructor:

```
@Cons{head,tail} # desugars to (@Cons,head,tail,())
```

You can also pattern-match on constructors.

## Holes, Implicits, Type-Classes, Unification

Bend has *none* of these. Every type must be written explicitly in the source
code. For example, to call the identity function:

```python
def id<A>(x: A) -> A:
  x
```

The user MUST provide the polymorphic type:

```
id<Nat>(3)
```

This is also the case through the entire language.

## Imports

Bend automatically imports definitions from corresponding file names.

For example, in the file:

```
def main() -> Nat:
  Foo/bar(123)
```

Bend will automatically import `Foo/bar` from one of:
- `./Foo/bar.bend`
- `./Foo/bar/_.bend`


# Examples

## Basic Programming

```python
# Boolean operations
def and(a: Bool, b: Bool) -> Bool:
  if a:
    b
  else:
    False

def or(a: Bool, b: Bool) -> Bool:
  if a:
    True
  else:
    b

# List operations
def length<A>(xs: A[]) -> Nat:
  match xs:
    case []:
      0
    case h <> t:
      1 + length(t)

def append<A>(xs: A[], ys: A[]) -> A[]:
  match xs:
    case []:
      ys
    case h <> t:
      h <> append(t, ys)

def map<A, B>(f: A -> B, xs: A[]) -> B[]:
  match xs:
    case []:
      []
    case h <> t:
      f(h) <> map(f, t)
```


```python
# Binary tree
type Tree<A: Set> -> Set:
  case @Leaf:
  case @Node:
    value: A
    left: Tree(A)
    right: Tree(A)

# Tree operations
def size<A>(t: Tree(A)) -> Nat:
  match t:
    case @Leaf{}:
      0
    case @Node{v, l, r}:
      1 + add(size(l), size(r))

def mirror<A>(t: Tree(A)) -> Tree(A):
  match t:
    case @Leaf{}:
      @Leaf{}
    case @Node{v, l, r}:
      @Node{v, mirror(r), mirror(l)}
```

## Theorem Proving

```python
# Identity function is identity
def id_is_id<A>(x: A) -> A{id(x) == x}:
  {==}

# Symmetry of equality
def sym<A>(a: A, b: A, e: A{a == b}) -> A{b == a}:
  {==} = e
  {==}

# Transitivity of equality
def trans<A>(a: A, b: A, c: A, e1: A{a == b}, e2: A{b == c}) -> A{a == c}:
  {==} = e1
  {==} = e2
  {==}

# List concatenation is associative
def append_assoc<A>(xs: A[], ys: A[], zs: A[]) -> A[]{append(append(xs, ys), zs) == append(xs, append(ys, zs))}:
  match xs:
    case []:
      {==}
    case h <> t:
      # Goal transforms to: A[]{h <> append(append(t, ys), zs) == h <> append(t, append(ys, zs))}
      1 <> append_assoc(t, ys, zs)
