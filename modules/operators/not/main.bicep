param initTrue bool = true
param initFalse bool = false

// value false
output startedTrue bool = !(initTrue)

// value true - can but does not have to be wrapped with parentheses:
output startedFalse bool = !initFalse
