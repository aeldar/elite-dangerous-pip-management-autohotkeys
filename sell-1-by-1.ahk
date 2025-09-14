; AutoHotKey script
; 2025-08-31
; aeldar8 <eldar.aliyev8@gmail.com> aka CMDR Aeldar8
;-----------------------
; Sell selected good on-by-one on a market. A Hotkey for Elite Dangerous
;-----------------------
;
#Requires AutoHotkey v2.0
#Warn           ; enable warning for debugging
#SingleInstance ; only a single inctance of the script is allowed
#UseHook        ; use keyboard hook instead of the windows API function RegisterHotkey

TraySetIcon "sell-1-by-1.ico"
A_IconTip := "Sell selected good on-by-one on a market. F9/CTRL+F9 to start/stop."

SendMode "Event"   ; set mode to "Event" to use SetKeyDelay
SetKeyDelay 30, 50 ; the default Delay and PressDuration for Event mode is 10, -1

EDAppClass := "ahk_class FrontierDevelopmentsAppWinClass"
EDTitle := "Elite - Dangerous (CLIENT)"

#HotIf WinActive(EDTitle)

; Global state of a cycle
StopLoop := True

; Sell an item on the market one-by-one. Select the good in the market, and DON'T go into selling screen. Press F9, and wait.
F9:: {
  global StopLoop
  StopLoop := False

	Loop {
	  ; Enter selling screen
	  Send "{Enter}"
	  Sleep 2000
	  ; Go up, just in case
	  Send "{Up}"
		Sleep 200
		; Go up once again, just in case, as this is critical
		Send "{Up}"
	  Sleep 2000
	  Send "{Left down}"
	  Sleep 3000
	  Send "{Left up}"
	  Sleep 300
	  Send "{Right}"
	  Sleep 300
	  Send "{Down}"
	  Sleep 300
	  ; Sell one tonn
	  Send "{Enter}"
		Sleep 10
		; Exit very fast
		Send "{Backspace}"
	  Sleep 2000
	  
	  ; some strange pattern to prevent bugs
	  ; Send "{Down}"
	  ; Sleep 1500
	  ; Send "{Up}"
	  ; Sleep 2000
    } Until (StopLoop)
  
}

; CTRL+F9 to stop selling.
^F9:: {
  global StopLoop
  StopLoop := True
}

#HotIf
