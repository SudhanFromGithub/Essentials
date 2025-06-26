This formula fetches only numbers from the cell

>[!important] Formula
>```
>=TEXTJOIN("",,IF(ISNUMBER(MID(A2,ROW(INDIRECT("1:"&LEN(A2))),1)*1),MID(A2,ROW(INDIRECT("1:"&LEN(A2))),1),""))
>```

Example:

If In cell A2 = Hello, I am Master-09 ==> It fetches only 09 from the cell