This script enters today's date when !dt is typed

>[!important] scripts
>```
>:*c:!dt::
>{
>    today := FormatTime(, "dd.MM.yyyy")
>    SendText today
>}
>```

Tags: 