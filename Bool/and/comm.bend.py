
# Proof of commutativity for AND
def Bool/and/comm(a: Bool, b: Bool) -> Bool{(Bool/and(a, b)) == (Bool/and(b, a))}:
  # We prove by case analysis on 'a' and 'b'.
  # The type checker will reduce both sides of the equality
  # for each of the four possible cases (T/T, T/F, F/T, F/F).
  if a:
    if b:
      # Case a=True, b=True: and(T,T) == and(T,T) -> T == T
      finally
    else:
      # Case a=True, b=False: and(T,F) == and(F,T) -> F == F
      finally
  else:
    if b:
      # Case a=False, b=True: and(F,T) == and(T,F) -> F == F
      finally
    else:
      # Case a=False, b=False: and(F,F) == and(F,F) -> F == F
      finally
