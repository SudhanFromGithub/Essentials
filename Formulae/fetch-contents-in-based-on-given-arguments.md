This formula fetch the contents in the cell based on the given arguments

>[!important] Formula
>```
>⁠ =INDEX(A1:E1, MATCH(TRUE, ISNUMBER(SEARCH("JVL", A1:E1)), 0)) ⁠
>```

Example:

Values in Cells 
A1 ==> hello
A2 ==> hi
A3 ==> How?

If you apply this formula for the range A1:A3 and set arguments to "o"

It will fetch values in cell A1 and A3 as it has "o" in its cells 