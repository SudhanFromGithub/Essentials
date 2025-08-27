This script insert blank excel worksheet when ctrl shift e is pressed

>[!important] ahk
>```
>^+e::  ; Ctrl + Shift + E hotkey
>{     
>    ; Get the active window's path (assumes it's File Explorer)
>    hwnd := WinActive("ahk_class CabinetWClass")     
>    if !hwnd {         
>        MsgBox "No File Explorer window is active."         
>        return     
>    }      
>    for window in ComObject("Shell.Application").Windows     
>    {         
>        if (window.hwnd = hwnd)         
>        {             
>            folder := window.Document.Folder.Self.Path             
>            break         
>        }     
>    }      
>    if !IsSet(folder) {         
>        MsgBox "Failed to get folder path."         
>        return     
>    }      
>    ; Define file path for new Excel file     
>    filePath := folder "\NewExcelSheet.xlsx"      
>    ; Create Excel application object     
>    xl := ComObject("Excel.Application")     
>    wb := xl.Workbooks.Add()     
>    wb.SaveAs(filePath)     
>    wb.Close(false)     
>    xl.Quit()      
>    ; Release COM objects     
>    xl := wb := "" 
>}
>```
