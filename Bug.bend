type Term:
  case @A:
  case @B:
  case @C:

def foo(x: Term) -> Term:
  match x:
    case @A:
      @A
    case x:
      x
    




#def foo(x: Bool, y: Bool) -> Bool:
  #return x and y




#type Term:
  #case @A:
  #case @B:

#def foo(t: Term) -> Term:
  #match t:
    #case @A:
      #return @A
    #case k:
      #kg

#def foo(t: Term) -> Term:
  #~ t {
    #(,):λ_x1. λ_x2. ~ _x1 {
      #&A: ~ _x2 { (): @A{} }
      #λ_x3. (_x3,_x2)
    #}
  #}





#- check: Set :: Set
#- infer: Set
#- check: Σctr:&{&A,&B}. ~ ctr { &A: Unit ; &B: Unit ; λ_. () } :: Set
#- infer: Σctr:&{&A,&B}. ~ ctr { &A: Unit ; &B: Unit ; λ_. () }
#- check: &{&A,&B} :: Set
#- infer: &{&A,&B}
#- check: λctr. ~ ctr { &A: Unit ; &B: Unit ; λ_. () } :: &{&A,&B} -> Set
#- check: ~ ctr { &A: Unit ; &B: Unit ; λ_. () } :: Set
#- infer: ctr
#- check: Unit :: ctr ⇒ &A; Set
#- check: Unit :: Set
#- infer: Unit
#- check: Unit :: ctr ⇒ &B; Set
#- check: Unit :: Set
#- infer: Unit
#✓ Term
#- check: ∀t:Term. Term :: Set
#- infer: ∀t:Term. Term
#- check: Term :: Set
#- check: Term :: Set
#- infer: Term
#- check: λt. Term :: Term -> Set
#- check: Term :: Set
#- check: Term :: Set
#- infer: Term
#- check: λt. ~ t { (,):λ_x1. λ_x2. ~ _x1 { &A: ~ _x2 { (): @A{} } ; λ_x3. (_x2,_x3) } } :: ∀t:Term. Term
#- check: ~ t { (,):λ_x1. λ_x2. ~ _x1 { &A: ~ _x2 { (): @A{} } ; λ_x3. (_x2,_x3) } } :: Term
#- check: ~ t { (,):λ_x1. λ_x2. ~ _x1 { &A: ~ _x2 { (): @A{} } ; λ_x3. (_x2,_x3) } } :: Term
#- infer: t
#- infer: t
#- check: λ_x1. λ_x2. ~ _x1 { &A: ~ _x2 { (): @A{} } ; λ_x3. (_x2,_x3) } :: ∀x:&{&A,&B}. ∀y:(λctr. ~ ctr { &A: Unit ; &B: Unit ; λ_. () })(x). t ⇒ (x,y); Term
#- check: λ_x2. ~ _x1 { &A: ~ _x2 { (): @A{} } ; λ_x3. (_x2,_x3) } :: ∀y:(λctr. ~ ctr { &A: Unit ; &B: Unit ; λ_. () })(_x1). t ⇒ (_x1,y); Term
#- check: ~ _x1 { &A: ~ _x2 { (): @A{} } ; λ_x3. (_x2,_x3) } :: t ⇒ (_x1,_x2); Term
#- check: ~ _x1 { &A: ~ _x2 { (): @A{} } ; λ_x3. (_x2,_x3) } :: Term
#- infer: _x1
#- check: ~ _x2 { (): @A{} } :: _x1 ⇒ &A; Term
#- check: ~ _x2 { (): @A{} } :: Term
#- infer: _x2
#- check: @A{} :: _x2 ⇒ (); Term
#- check: @A{} :: Term
#- check: @A{} :: Term
#- check: @A{} :: Term
#- check: &A :: &{&A,&B}
#- check: () :: Unit
#- check: λ_x3. (_x2,_x3) :: &{&A,&B} -> Term
#- check: (_x2,_x3) :: Term
#- check: (_x2,_x3) :: Term
#- check: _x2 :: &{&A,&B}
#- infer: _x2
#✗ foo
#Mismatch:
#- Goal: &{&A,&B}
#- Type: (λctr. ~ ctr { &A: Unit ; &B: Unit ; λ_. () })(_x1)
#Context:
#- t : Term
#Location: (line 10, column 7)
#10 |       k
