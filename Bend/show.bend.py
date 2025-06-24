#./../../Bend2/src/Core/Type.hs#

#./../Bend.md#
#./../Bend/Term.bend.py#

# TODO: complete the function below
# Note: use 'String/flatten(["foo", "bar", ...])' to concat strings

# now, implement the complete show fn

def Bend/show(tm: Bend/Term) -> String:
  match tm:
    case @Var{k,i}:
      k
    case @Ref{k}:
      k
    case @Sub{t}:
      "unreachable"
    case @Fix{k,f}:
      body = Bend/show(f(@Var{k,0}))
      String/flatten(["μ", k, ". ", body])
    case @Let{v,f}:
      v = Bend/show(v)
      f = Bend/show(f)
      String/flatten(["!", v, ";", f])
    case @Set{}:
      "Set"
    case @Ann{x,t}:
      x = Bend/show(x)
      t = Bend/show(t)
      String/flatten(["<", x, ":", t, ">"])
    case @Chk{x,t}:
      x = Bend/show(x)
      t = Bend/show(t)
      String/flatten(["(", x, "::", t, ")"])
    case @Emp{}:
      "⊥"
    case @Efq{}:
      "λ{}"
    case @Uni{}:
      "Unit"
    case @One{}:
      "()"
    case @Use{f}:
      f = Bend/show(f)
      String/flatten(["λ{ ():", f, " }"])
    case @Bit{}:
      "Bool"
    case @Bt0{}:
      "False"
    case @Bt1{}:
      "True"
    case @Bif{f,t}:
      f = Bend/show(f)
      t = Bend/show(t)
      String/flatten(["λ{ False: ", f, " ; True: ", t, " }"])
    case @Nat{}:
      "Nat"
    case @Zer{}:
      "0"
    case @Suc{n}:
      n = Bend/show(n)
      String/flatten(["↑", n])
    case @Swi{z,s}:
      z = Bend/show(z)
      s = Bend/show(s)
      String/flatten(["λ{ 0: ", z, " ; +: ", s, " }"])
    case @Lst{t}:
      t = Bend/show(t)
      String/flatten([t, "[]"])
    case @Nil{}:
      "[]"
    case @Con{h,t}:
      h = Bend/show(h)
      t = Bend/show(t)
      String/flatten([h, "<>", t])
    case @Mat{n,c}:
      n = Bend/show(n)
      c = Bend/show(c)
      String/flatten(["λ{ []:", n, " ; <>:", c, " }"])
    case @Enu{s}:
      tags = List/map<String,String>(s, lambda tag. String/flatten(["@", tag]))
      inner = String/join(tags, ",")
      String/flatten(["{", inner, "}"])
    case @Sym{s}:
      String/flatten(["@", s])
    case @Cse{c}:
      cases = List/map<(String & Bend/Term),String>(c, lambda pair.
        match pair:
          case (s,t):
            t_str = Bend/show(t)
            String/flatten(["@", s, ": ", t_str]))
      inner = String/join(cases, " ; ")
      String/flatten(["λ{ ", inner, " }"])
    case @Sig{a,b}:
      a = Bend/show(a)
      b = Bend/show(b)
      String/flatten(["Σ", a, ". ", b])
    case @Tup{a,b}:
      a = Bend/show(a)
      b = Bend/show(b)
      String/flatten(["(", a, ",", b, ")"])
    case @Get{f}:
      f = Bend/show(f)
      String/flatten(["λ{ (,):", f, " }"])
    case @All{a,b}:
      a = Bend/show(a)
      b = Bend/show(b)
      String/flatten(["∀", a, ". ", b])
    case @Lam{k,f}:
      body = Bend/show(f(@Var{k,0}))
      String/flatten(["λ", k, ". ", body])
    case @App{f,x}:
      f = Bend/show(f)
      x = Bend/show(x)
      String/flatten(["(", f, " ", x, ")"])
    case @Eql{t,a,b}:
      t = Bend/show(t)
      a = Bend/show(a)
      b = Bend/show(b)
      String/flatten([t, "{", a, "==", b, "}"])
    case @Rfl{}:
      "{==}"
    case @Rwt{f}:
      f = Bend/show(f)
      String/flatten(["λ{ {==}:", f, " }"])
    case @Met{n,t,x}:
      "?"
    case @Num{t}:
      Bend/NTyp/show(t)
    case @Val{v}:
      "TODO"
    case @Op2{o,a,b}:
      "TODO"
    case @Op1{o,a}:
      "TODO"

def U64/show(n: U64) -> String:
  "TODO"

def I64/show(n: I64) -> String:
  "TODO"

def F64/show(n: F64) -> String:
  "TODO"

def I64/gte(a: I64, b: I64) -> Bool:
  True

def Bend/NTyp/show(t: Bend/NTyp) -> String:
  match t:
    case @U64_T{}:
      "U64"
    case @I64_T{}:
      "I64"
    case @F64_T{}:
      "F64"
    case @CHR_T{}:
      "Char"
