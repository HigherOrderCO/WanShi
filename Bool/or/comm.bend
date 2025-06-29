
# Proof of commutativity for OR
def Bool/or/comm(a: Bool, b: Bool) -> Bool{Bool/or(a,b) == Bool/or(b,a)}:
  # The proof follows the same case analysis strategy as and_comm.
  if a:
    if b:
      # Case a=True, b=True: or(T,T) == or(T,T) -> T == T
      finally
    else:
      # Case a=True, b=False: or(T,F) == or(F,T) -> T == T
      finally
  else:
    if b:
      # Case a=False, b=True: or(F,T) == or(T,F) -> T == T
      finally
    else:
      # Case a=False, b=False: or(F,F) == or(F,F) -> F == F
      finally
