This VBA Code filters data in a column into separate sheets for each unique value 

When it prompt to give the header name of the column

Note : Header name is case-sensitive

>[!important] VBA
>```
> Sub SplitDataBySelectedColumn()
>     Dim ws As Worksheet
>     Dim wsNew As Worksheet
>     Dim rng As Range
>     Dim lastRow As Long
>     Dim lastCol As Long
>     Dim uniqueValues As Collection
>     Dim cell As Range
>     Dim value As Variant
>     Dim colToFilter As Long
>     Dim columnHeader As String
>     Dim headerFound As Boolean
>     Dim i As Long
>     Dim sanitizedValue As String
> 
>     ' Use the active worksheet
>     Set ws = ActiveSheet
>     lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
>     lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
>     Set rng = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
> 
>     ' Prompt the user to select the column header
>     columnHeader = InputBox("Enter the column header to split the data by (case-insensitive):")
>     If columnHeader = "" Then
>         MsgBox "No column header entered. Exiting.", vbExclamation
>         Exit Sub
>     End If
> 
>     ' Find the column based on header value (case-insensitive)
>     headerFound = False
>     For colToFilter = 1 To lastCol
>         If LCase(ws.Cells(1, colToFilter).Value) = LCase(columnHeader) Then
>             headerFound = True
>             Exit For
>         End If
>     Next colToFilter
> 
>     If Not headerFound Then
>         MsgBox "Column header not found. Please try again.", vbExclamation
>         Exit Sub
>     End If
> 
>     ' Create a collection of unique values in the selected column
>     Set uniqueValues = New Collection
>     On Error Resume Next
>     For Each cell In ws.Range(ws.Cells(2, colToFilter), ws.Cells(lastRow, colToFilter))
>         uniqueValues.Add cell.Value, CStr(cell.Value)
>     Next cell
>     On Error GoTo 0
> 
>     ' Loop through unique values and create a new worksheet for each
>     For Each value In uniqueValues
>         ' Sanitize value for worksheet name
>         sanitizedValue = Replace(CStr(value), "/", "_")
>         sanitizedValue = Replace(sanitizedValue, "\", "_")
>         sanitizedValue = Replace(sanitizedValue, "*", "_")
>         sanitizedValue = Replace(sanitizedValue, "[", "_")
>         sanitizedValue = Replace(sanitizedValue, "]", "_")
>         sanitizedValue = Left(sanitizedValue, 31) ' Truncate to 31 characters if needed
> 
>         ' Check if the sheet name is valid and unique
>         On Error Resume Next
>         Set wsNew = ThisWorkbook.Sheets(sanitizedValue)
>         On Error GoTo 0
>         If wsNew Is Nothing Then
>             ' Add a new worksheet and name it after the sanitized unique value
>             Set wsNew = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
>             wsNew.Name = sanitizedValue
>         Else
>             Set wsNew = Nothing
>             GoTo NextValue
>         End If
> 
>         ' Copy the headers
>         ws.Rows(1).Copy Destination:=wsNew.Rows(1)
> 
>         ' Copy matching rows directly without filtering
>         i = 2 ' Start pasting from row 2 in the new sheet
>         For Each cell In ws.Range(ws.Cells(2, colToFilter), ws.Cells(lastRow, colToFilter))
>             If cell.Value = value Then
>                 cell.EntireRow.Copy wsNew.Rows(i)
>                 i = i + 1
>             End If
>         Next cell
> 
> NextValue:
>         Set wsNew = Nothing
>     Next value
> End Sub
>```
