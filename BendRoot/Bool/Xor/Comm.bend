
# Proof of commutativity for XOR
# (a xor b) == (b xor a)
def Comm(a: Bool, b: Bool) -> Bool{Bool/Xor(a, b) == Bool/Xor(b, a)}:
  # The proof follows the case analysis strategy.
  if a:
    if b:
      # Case a=True, b=True: xor(T,T) == xor(T,T) -> F == F
      finally
    else:
      # Case a=True, b=False: xor(T,F) == xor(F,T) -> T == T
      finally
  else:
    if b:
      # Case a=False, b=True: xor(F,T) == xor(T,F) -> T == T
      finally
    else:
      # Case a=False, b=False: xor(F,F) == xor(F,F) -> F == F
      finally
