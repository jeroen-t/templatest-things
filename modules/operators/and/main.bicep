param operand1 bool = true
param operand2 bool = true
param operand3 bool = false

// Expect value true
output andResultParm bool = operand1 && operand2

// Expect value true
output andResultExp bool = bool(10 >= 10) && bool(5 > 2)

// Expect value false
output andresultParmf bool = operand1 && operand3
