
# Prelude
# --------

def sp0(x: U64) -> U64:
  (((x * 16293) + 1) % 65536)

def sp1(x: U64) -> U64:
  (((x * 32677) + 3) % 65536)

# @fix(f)  = !&{f0 f1}=f (f0 @fix(f1))
def fix<A>(f: A -> A) -> A:
  return f(fix<A>(f))

def when<A>(c: Bool, t: A) -> A:
  if c:
    t
  else:
    *

def Bool/all(xs: Bool[]) -> Bool:
  match xs:
    case []:
      True
    case h <> t:
      Bool/and(h, Bool/all(t))


# GenGen
# ---------

type Term:
  case @F:
  case @T:
  case @C:
    x: Term
    y: Term
  
def eq(a: Term, b: Term) -> Bool:
  match a b:
    case @F @F:
      True
    case @F @T:
      False
    case @F @C{_,_}:
      False
    case @T @T:
      True
    case @T @F:
      False
    case @T @C{_,_}:
      False
    case @C{x, y} @C{z, w}:
      Bool/and(eq(x, z), eq(y, w))
    case @C{_,_} @F:
      False
    case @C{_,_} @T:
      False

def genn(L: U64, rec: Term -> Term, lib: (Term -> Term)[], ctx: Pair<U64, Term>[]) -> Term:
  fork L:
    intr(L, rec, lib, ctx)
  else:
    fork L:
      roll(L, rec, lib, ctx, ctx)
    else:
      fork L:
        elim(L, rec, lib, ctx, ctx)
      else:
        call(L, rec, lib, ctx, lib)

def roll(L: U64, rec: Term -> Term, lib: (Term -> Term)[], ctx: Pair<U64, Term>[], ts: Pair<U64, Term>[]) -> Term:
  match ts:
    case []:
      *
    case t <> ts:
      fork L:
        done(L, rec, t)
      else:
        roll(L, rec, lib, ctx, ts)
        
def intr(L: U64, rec: Term -> Term, lib: (Term -> Term)[], ctx: Pair<U64, Term>[]) -> Term:
  fork L:
    fork L:
      @F
    else:
      @T
  else:
    @C{
      genn(sp0(L), rec, lib, ctx),
      genn(sp1(L), rec, lib, ctx)
    }

def elim(L: U64, rec: Term -> Term, lib: (Term -> Term)[], ctx: Pair<U64, Term>[], ts: Pair<U64, Term>[]) -> Term:
  match ts:
    case []:
      *
    case t <> ts:
      fork L:
        cse(L, rec, lib, ctx, t)
      else:
        elim(L, rec, lib, ctx, ts)

def call(L: U64, rec: Term -> Term, lib: (Term -> Term)[], ctx: Pair<U64, Term>[], fs: (Term -> Term)[]) -> Term:
  match fs:
    case []:
      *
    case f <> fs:
      fork L:
        f(genn(L, rec, lib, ctx))
      else:
        call(L, rec, lib, ctx, fs)

def cse(L: U64, rec: Term -> Term, lib: (Term -> Term)[], ctx: Pair<U64, Term>[], t: Pair<U64, Term>) -> Term:
  match t:
    case @Pair{n, tm}:
      match tm:
        case @F:
          genn(sp0(sp0(L)), rec, lib, ctx)
        case @T:
          genn(sp1(sp0(L)), rec, lib, ctx)
        case @C{tx, ty}: 
          ctxVars = [@Pair{1, tx}, @Pair{1, ty}]
          newCtx = List/concat<Pair<U64, Term>>(ctx, ctxVars)
          genn(sp1(L), rec, lib, newCtx)
        
def done(L: U64, f: Term -> Term, x: Pair<U64, Term>) -> Term:
  match x:
    case @Pair{h, x}:
      if h === 0:
        return x
      else:
        fork L:
          return x
        else:
          return f(x)

# Main
# ----

# Nat ::= @F | @C{@T, Nat}
def Z() -> Term:
  return @F

def S(x: Term) -> Term:
  return @C{@T, x}

# Bits ::= @C{@F Bits} | @C{@T Bits} | @F
def O(x: Term) -> Term:
  return @C{@F, x}

def I(x: Term) -> Term:
  return @C{@T, x}

def E() -> Term:
  return @F

def fix<A>(f: A -> A) -> A:
  return f(fix<A>(f))

def code(f: Term -> Term, x: Term) -> Term:
  genn(1, f, [], [@Pair{0, x}])

def func() -> (Term -> Term):
  fix<(Term -> Term)>(code)

# bit not:
def main() -> (Term -> Term) -> Term -> Term:
  t0 = (func() O(I(O(E()))))
  e0 = eq(t0, I(O(I(E()))))

  t1 = (func() O(O(O(E()))))
  e1 = eq(t1, I(I(I(E()))))

  t2 = (func() O(I(I(E()))))
  e2 = eq(t2, I(O(O(E()))))

  t3 = (func() I(I(I(E()))))
  e3 = eq(t3, O(O(O(E()))))

  when<((Term -> Term) -> Term -> Term)>(Bool/all([e0, e1, e2, e3]), code)

