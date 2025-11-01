# what is the task ?

I want to get the content names inside the google drive folder

# what i did?

I planned to get the filenames of the content via terminal

So I installed google drive cli via brew

>[!important] cli
>```
>brew install gdrive
>```


After i installation of google drive CLIthis [steps](https://github.com/glotlabs/gdrive/blob/main/docs/create_google_api_credentials.md)

>[!important] cli
>```
>gdrive files list --parent [folder_id] --limit 1000
>```
