This VBA copies the sum of the selected cells in excel

>[!important] VBA
>```
>#If VBA7 Then
>    Private Declare PtrSafe Function OpenClipboard Lib "user32" (ByVal hwnd As LongPtr) As Long
>    Private Declare PtrSafe Function CloseClipboard Lib "user32" () As Long
>    Private Declare PtrSafe Function EmptyClipboard Lib "user32" () As Long
>    Private Declare PtrSafe Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByVal hMem As LongPtr) As LongPtr
>    Private Declare PtrSafe Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As LongPtr) As LongPtr
>    Private Declare PtrSafe Function GlobalLock Lib "kernel32" (ByVal hMem As LongPtr) As LongPtr
>    Private Declare PtrSafe Function GlobalUnlock Lib "kernel32" (ByVal hMem As LongPtr) As Long
>    Private Declare PtrSafe Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal Destination As LongPtr, ByVal Source As Any, ByVal Length As LongPtr)
>#Else
>    Private Declare Function OpenClipboard Lib "user32" (ByVal hwnd As Long) As Long
>    Private Declare Function CloseClipboard Lib "user32" () As Long
>    Private Declare Function EmptyClipboard Lib "user32" () As Long
>    Private Declare Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByVal hMem As Long) As Long
>    Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
>    Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
>    Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
>    Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal Destination As Long, ByVal Source As Any, ByVal Length As Long)
>#End If
>
>Private Const CF_UNICODETEXT As Long = 13
>Private Const GMEM_MOVEABLE As Long = &H2
>
>Sub CopySumOfSelectionToClipboard()
>    Dim rng As Range
>    Dim total As Double
>    Dim textData As String
>    Dim hMem As LongPtr, pMem As LongPtr
>
>    On Error Resume Next
>    Set rng = Selection
>    On Error GoTo 0
>
>    If rng Is Nothing Then
>        MsgBox "?? No cells selected.", vbExclamation, "Sum to Clipboard"
>        Exit Sub
>    End If
>
>    total = Application.WorksheetFunction.Sum(rng)
>    textData = CStr(total) & vbNullChar
>
>    OpenClipboard 0
>    EmptyClipboard
>    hMem = GlobalAlloc(GMEM_MOVEABLE, LenB(textData))
>    pMem = GlobalLock(hMem)
>    CopyMemory pMem, ByVal StrPtr(textData), LenB(textData)
>    GlobalUnlock hMem
>    SetClipboardData CF_UNICODETEXT, hMem
>    CloseClipboard
>
>End Sub
>```
