#Requires AutoHotkey v2.0
;--------------------------------------------------------------------------------------------------------------------------------------
; Text Expandments
;--------------------------------------------------------------------------------------------------------------------------------------

:*c:!rp::Ready for Payment
:*c:!na::No Attachment

;--------------------------------------------------------------------------------------------------------------------------------------
; Caps Lock Functions
;--------------------------------------------------------------------------------------------------------------------------------------

capsLockDisabled := true  ; Default to Caps Lock always off
SetCapsLockState "AlwaysOff"

; Left Shift and Right Shift to toggle capslock
~LShift & RShift::ToggleCapsLockFunction()

ToggleCapsLockFunction() {
    global capsLockDisabled

    if capsLockDisabled {
        SetCapsLockState "AlwaysOn"  ; Allow Caps Lock toggle
        capsLockDisabled := false
        ;ToolTip("Caps Lock is now ENABLED")
    } else {
        SetCapsLockState "AlwaysOff" ; Disable Caps Lock toggle
        capsLockDisabled := true
        ;ToolTip("Caps Lock is now DISABLED")
    }
    
    ;SetTimer () => ToolTip(), -1500  ; Hide tooltip after 1.5 seconds
}

SetCapsLockState "AlwaysOff" ; Disable Caps Lock toggle

; Tap CapsLock alone sends Escape
CapsLock::
{
    KeyWait("CapsLock", "T0.2")
    if !GetKeyState("CapsLock", "P")
        Send "{Escape}"
}

; CapsLock + H/J/K/L are arrow keys
CapsLock & h::SendInput "{Left}"
CapsLock & j::SendInput "{Down}"
CapsLock & k::SendInput "{Up}"
CapsLock & l::SendInput "{Right}"

; CapsLock + B = Windows + Ctrl + Left
CapsLock & b:: Send("#^{Left}")
; CapsLock + N = Windows + Ctrl + Right
CapsLock & n:: Send("#^{Right}")
; CapsLock + Up = Windows + Ctrl + Left
CapsLock & up:: Send("#^{Left}")
; CapsLock + Down = Windows + Ctrl + Right
CapsLock & down:: Send("#^{Right}")

;--------------------------------------------------------------------------------------------------------------------------------------
; Custom Hotkeys
;--------------------------------------------------------------------------------------------------------------------------------------

#Enter::Send("{F8}")
#Backspace:: {
	Send("+{Home}") 
	Send("{Backspace}")
}
!q::Send("!{F4}")

; Ctrl+Alt+P to Pause the Playing Media
^!p:: {
    SendMode("Event")
    Send("{Media_Play_Pause}")
}

; Ctrl+Alt+[ to Play Previous Song
^![:: {
    SendMode("Event")
    Send("{Media_Prev}")
}

; Ctrl+Alt+] to Play Next Song
^!]:: {
    SendMode("Event")
    Send("{Media_Next}")
}

;--------------------------------------------------------------------------------------------------------------------------------------
; End of the Scripts
;--------------------------------------------------------------------------------------------------------------------------------------
