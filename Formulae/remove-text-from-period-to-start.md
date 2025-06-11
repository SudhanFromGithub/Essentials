This formula removes text from period(.) to the start 

Example : 1.One ==> One

>[!important] Formula
>```
>=RIGHT(A6, LEN(A6) - SEARCH(".", A6))
>```

Tags:[[formulae]]