type Result<E: Set, A: Set>:
  case @Fail:
    error: E
  case @Done:
    value: A
