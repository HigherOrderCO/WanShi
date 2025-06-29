def Z_Nat/add/comm(a: Nat, b: Nat) -> Nat{Nat/add(a,b) == Nat/add(b,a)}:
  match a:
    case 0n:
      Nat/add/zero_right(b)
    case 1n+ap:
      t0 = Z_Nat/add/comm(ap,b)
      t1 = Nat/add/succ_right(b,ap)
      rewrite t0
      rewrite t1
      finally

#def Eq(A: Set, a: A, b: A) -> Set:
  #∀ P: A -> Set. P(a) -> P(b)

#def sym(T: Set, a: T, b: T, e: Eq(T,a,b)) -> Eq(T,b,a):
  #λP. λpb. e(λx. P(x) -> P(a), λx.x, pb)


  #λT. λa. λb. λP. λe. λpb.
    ##k = e(pb)
    #()


#def foo : (∀P:Bool->Set. ∀x:Bool. ∀y:Bool. ∀e:P(x) -> P(y). ∀p:P(x). P(y)) =
  #λP. λx. λy. λe. λp.
  #(e p)


#def aux
  #( a: Nat
  #, b: Nat
  #, t0: Nat{t0~Nat/add(ap,b) == Nat/add(b,ap)}
  #, t1: Nat{Nat/add(b,1n+ap) == 1n+Nat/add(b,ap)}
  #) -> Nat{1n+Nat/add(ap,b) == Nat/add(b,1n+ap)}
  #rewrite t0
  #rewrite t1
  #finally


#def foo : (∀P:Bool->Set. ∀x:Bool. ∀y:Bool. ∀e:Bool{x == y}. ∀p:P(x). P(y)) =
  #λP. λx. λy. λe. aux(P,x,y,e,p)

#def aux : (∀P:Bool->Set. ∀x:Bool. ∀y:Bool. ∀e:Bool{x == y}. ∀p:P(e~x). P(y)) =
  #λP. λx. λy. λ{ {==}: {==} }


#Nat{1n+Nat/add(ap,b) ~ t0 == Nat/add(b,1n+ap)}

#- Goal: Nat{1n+Nat/add(ap,b)==Nat/add(b,1n+ap)}
#- Type: Unit
#Context:
#- a : Nat
#- b : Nat
#- ap : Nat
#- t0 : Nat{Nat/add(ap,b)==Nat/add(b,ap)}
#- t1 : Nat{Nat/add(b,1n+ap)==1n+Nat/add(b,ap)}






#def add(a: Nat, b: Nat) -> Nat:
  #match a:
    #case 0n:
      #b
    #case 1n + p:
      #1n + add(p, b)

#def bug
  #( a: Nat
  #, b: Nat
  #, ap: Nat
  #, P: Nat -> Set
  #, e0: Nat{a == (1n+ap)}
  #, e1: Nat{(add(b,1n+ap)) == (1n+add(b,ap))}
  #) -> P(add(b,a)):
  #rewrite e0
  #rewrite e1
  #()



#sub Nat/add(b,1n+ap) → 1n+Nat/add(b,ap)
#sub a → 1n+ap
#sub Nat/add(ap,b) → Nat/add(b,ap)
#sub a → 1n+ap
#EQ: Nat{Nat/add(b,1n+ap)==1n+Nat/add(b,ap)} == Nat{Nat/add(a,b)==Nat/add(b,a)}
#~>: Nat{1n+Nat/add(b,ap)==1n+Nat/add(b,ap)} == Nat{1n+Nat/add(b,ap)==Nat/add(b,1n+ap)}

#Nat{1n+Nat/add(b,ap)==1n+Nat/add(b,ap)} == Nat{1n+Nat/add(b,ap)==Nat/add(b,1n+ap)}


#SUBS:
#| a            → 1n+ap
#| add(b,1n+ap) → 1n+add(b,ap)

#NORM:
#- add(b,a)



#question:
#is add(b,a) == add(b,1n+ap) ?
#if it was:
#whnf(add(b,a)) → 1n+add(b,ap)
#and it should be, no?

























