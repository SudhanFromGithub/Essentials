#Requires AutoHotkey v2.0

; Semi Colon comments outs the line (i.e When ; is inserted it will not read the whole line)

;This below script inserts the below line !pfa is typed

:*c:!pfa::
{
    SendText "Sir/Mam,`n    Please find attached the [document/report/file name] for your reference. Kindly let me know if you have any questions or need further information. "
}

; This Below script inserts the today's date in date.month.year format

:*:!dt::
{
    today := FormatTime(, "dd.MM.yyyy")
    SendText today
}

; This below scripts automatically inserts ")" Closing bracket when opening bracket is inserted and puts cursor in the ; middle

:*:(::
{
    SendText "()"
    Send("{Left}")
}

; The below script pastes the recently copied contents from the clipboard

; :*:!cb::
; {
;     SendText A_Clipboard
; }

; !a::
; {
;     ; Save the current clipboard content (optional)
;     oldClip := A_Clipboard
;
;     ; Focus address bar and copy path
;     Send("^l")        ; Ctrl+L: Focus address bar
;     Sleep(100)
;     Send("^c")        ; Ctrl+C: Copy path
;     Sleep(100)
;
;     ; Send Esc twice to return focus to file list
;     Send("{Esc 2}")
;
;     ; Optional: Show notification
;     ; ToolTip "Path copied!"
;     ; Sleep(700)
;     ; ToolTip
; }



NumberToIndianWords(n) {
    static ones := ["", "one","two","three","four","five","six","seven","eight","nine"]
    static teens := ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
    static tens := ["","", "twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]

    if (n = 0)
        return "Zero"
    if (n < 0)
        return "Minus " NumberToIndianWords(-n)

    words := ""
    numStr := Format("{:0}", n)
    len := StrLen(numStr)

    crore := len > 7 ? SubStr(numStr, 1, len - 7) + 0 : 0
    lakh  := len > 5 ? SubStr(numStr, len - 6, 2) + 0 : 0
    thou  := len > 3 ? SubStr(numStr, len - 4, 2) + 0 : 0
    hund  := len > 2 ? SubStr(numStr, len - 2, 1) + 0 : 0
    rest  := SubStr(numStr, Max(1, len - 1)) + 0

    ; --- Singular/Plural for crore ---
    if (crore) {
        words .= NumberToIndianWords(crore) " "
        words .= (crore = 1 ? "crore " : "crores ")
    }
    ; --- Singular/Plural for lakh ---
    if (lakh) {
        words .= NumberToIndianWords(lakh) " "
        words .= (lakh = 1 ? "lakh " : "lakhs ")
    }
    if (thou)
        words .= NumberToIndianWords(thou) " thousand "
    if (hund)
        words .= NumberToIndianWords(hund) " hundred "
    if ((crore or lakh or thou or hund) and rest)
        words .= "and "

    if (rest) {
        if (rest < 10)
            words .= ones[rest+1]
        else if (rest < 20)
            words .= teens[rest - 9]
        else
            words .= tens[Floor(rest / 10)+1] (Mod(rest, 10) ? " " ones[Mod(rest, 10)+1] : "")
    }

    words := RegExReplace(words, "\s+", " ")
    words := Trim(words)
    words := ProperCase(words) ; Capitalize each word

    return words
}

ProperCase(text) {
    words := StrSplit(text, " ")
    for i, w in words
        words[i] := StrUpper(SubStr(w, 1, 1)) . SubStr(w, 2)
    return Trim(JoinWords(words))
}

JoinWords(words, sep := " ") {
    out := ""
    for i, w in words
        out .= (i > 1 ? sep : "") . w
    return out
}


:*:!words::
{
    result := InputBox("Number to convert", "Enter a number (Indian format):")
    if result.Result != "OK" || result.Value = ""
        return
    num := StrReplace(result.Value, ",") ; Remove commas
    words := NumberToIndianWords(num)
    SendText(words)
}
