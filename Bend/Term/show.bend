def Bend/Term/show(tm: Bend/Term) -> String:
  match tm:
    case @Var{k,i}:
      k
    case @Ref{k}:
      k
    case @Sub{t}:
      "unreachable"
    case @Fix{k,f}:
      f = Bend/Term/show(f(@Var{k,0}))
      String/flatten(["μ", k, ". ", f])
    case @Let{v,f}:
      v = Bend/Term/show(v)
      f = Bend/Term/show(f)
      String/flatten(["!", v, ";", f])
    case @Set{}:
      "Set"
    case @Ann{x,t}:
      x = Bend/Term/show(x)
      t = Bend/Term/show(t)
      String/flatten(["<", x, ":", t, ">"])
    case @Chk{x,t}:
      x = Bend/Term/show(x)
      t = Bend/Term/show(t)
      String/flatten(["(", x, "::", t, ")"])
    case @Emp{}:
      "Empty"
    case @Efq{}:
      "λ{}"
    case @Uni{}:
      "Unit"
    case @One{}:
      "()"
    case @Use{f}:
      f = Bend/Term/show(f)
      String/flatten(["λ{ ():", f, " }"])
    case @Bit{}:
      "Bool"
    case @Bt0{}:
      "False"
    case @Bt1{}:
      "True"
    case @Bif{f,t}:
      f = Bend/Term/show(f)
      t = Bend/Term/show(t)
      String/flatten(["λ{ False: ", f, " ; True: ", t, " }"])
    case @Nat{}:
      "Nat"
    case @Zer{}:
      "0"
    case @Suc{n}:
      n = Bend/Term/show(n)
      String/flatten(["↑", n])
    case @Swi{z,s}:
      z = Bend/Term/show(z)
      s = Bend/Term/show(s)
      String/flatten(["λ{ 0: ", z, " ; +: ", s, " }"])
    case @Lst{t}:
      t = Bend/Term/show(t)
      String/flatten([t, "[]"])
    case @Nil{}:
      "[]"
    case @Con{h,t}:
      h = Bend/Term/show(h)
      t = Bend/Term/show(t)
      String/flatten([h, "<>", t])
    case @Mat{n,c}:
      n = Bend/Term/show(n)
      c = Bend/Term/show(c)
      String/flatten(["λ{ []:", n, " ; <>:", c, " }"])
    case @Enu{s}:
      ks = List/map<String,String>(s, λk. String/flatten(["@", k]))
      ks = String/join(ks, ",")
      String/flatten(["{", ks, "}"])
    case @Sym{s}:
      String/flatten(["@", s])
    case @Cse{c}:
      c = List/map<(String & Bend/Term),String>(c, λ(s,t). String/flatten(["@", s, ": ", Bend/Term/show(t)]))
      c = String/join(c, " ; ")
      String/flatten(["λ{ ", c, " }"])
    case @Sig{a,b}:
      a = Bend/Term/show(a)
      b = Bend/Term/show(b)
      String/flatten(["Σ", a, ". ", b])
    case @Tup{a,b}:
      a = Bend/Term/show(a)
      b = Bend/Term/show(b)
      String/flatten(["(", a, ",", b, ")"])
    case @Get{f}:
      f = Bend/Term/show(f)
      String/flatten(["λ{ (,):", f, " }"])
    case @All{a,b}:
      a = Bend/Term/show(a)
      b = Bend/Term/show(b)
      String/flatten(["∀", a, ". ", b])
    case @Lam{k,f}:
      f = Bend/Term/show(f(@Var{k,0}))
      String/flatten(["λ", k, ". ", f])
    case @App{f,x}:
      f = Bend/Term/show(f)
      x = Bend/Term/show(x)
      String/flatten(["(", f, " ", x, ")"])
    case @Eql{t,a,b}:
      t = Bend/Term/show(t)
      a = Bend/Term/show(a)
      b = Bend/Term/show(b)
      String/flatten([t, "{", a, "==", b, "}"])
    case @Rfl{}:
      "{==}"
    case @Rwt{f}:
      f = Bend/Term/show(f)
      String/flatten(["λ{ {==}:", f, " }"])
    case @Met{n,t,x}:
      "?"
    case @Num{t}:
      Bend/NTyp/show(t)
    case @Val{v}:
      Bend/NVal/show(v)
    case @Op2{o,a,b}:
      "TODO"
    case @Op1{o,a}:
      "TODO"
