; AutoHotKey script
; 2025-08-17
; aeldar8 <eldar.aliyev8@gmail.com> aka CMDR Aeldar8
;-----------------------
; PIP Management Hotkeys for Elite Dangerous
;-----------------------
;
#Requires AutoHotkey v2.0
#Warn           ; enable warning for debugging
#SingleInstance ; only a single inctance of the script is allowed
#UseHook        ; use keyboard hook instead of the windows API function RegisterHotkey

TraySetIcon "tray-icon.ico"
A_IconTip := "PIP Management hotkeys for Elite Dangerous"

SendMode "Event"   ; set mode to "Event" to use SetKeyDelay
SetKeyDelay 10, 10 ; the default Delay and PressDuration for Event mode is 10, -1

EDAppClass := "ahk_class FrontierDevelopmentsAppWinClass"
EDTitle := "Elite - Dangerous (CLIENT)"

#HotIf WinActive(EDTitle)

; Dodge_mode : 0.5SYS/4ENG/1.5WEP
F1:: {
  Send "{Down}{Left}{Up 3}{Right 2}{Up}"
  SoundPlay "audio/Dodge-Mode-Engaged.wav"
}

; Flee_mode : 2SYS/4ENG/0WEP
^F1:: {
  Send "{Down}{Up 2}{Left}{Up}"
  SoundPlay "audio/Flee-Mode-Engaged.wav"
}

; Combat_mode : 0.5SYS/1.5ENG/4WEP
F2:: {
  Send "{Down}{Left}{Right 3}{Up 2}{Right}"
  SoundPlay "audio/Combat-Mode-Engaged.wav"
}

; Combat2_Combat mode : -SYS/2ENG/4WEP
^F2:: {
  Send "{Down}{Up}{Right 3}"
  SoundPlay "audio/Secondary-Combat-Mode-Engaged.wav"
}

; Pursuit mode : 2SYS/1ENG/3WEP
F3:: {
  Send "{Down}{Up}{Right 3}{Left 2}"
  SoundPlay "audio/Pursuit-Mode-Engaged.wav"
}

; Offense_mode : 3SYS/-ENG/3WEP
^F3:: {
  Send "{Down}{Left}{Right}{Left}{Right}"
  SoundPlay "audio/Offense-Mode-Engaged.wav"
}

; Shields_mode : 4SYS/2ENG/-WEP
F4:: {
  Send "{Down}{Left 2}{Up}{Left}"
  SoundPlay "audio/Shield-Mode-Engaged.wav"
}

; Defense_mode : 4SYS/-ENG/2WEP
^F4:: {
  Send "{Down}{Left 2}{Right}{Left}"
  SoundPlay "audio/Defense-Mode-Engaged.wav"
}

;-------- Additional hotkeys --------
^d:: {
  Send "{1}{e 2}"
  Sleep 200
  Send "{d}"
  Sleep 200
  Send "{Space}"
  Sleep 200
  Send "{q 2}"
  ; exit menu
  Send "{Backspace}"
  Sleep 200
  ; set speed 0%
  Send "{Backspace}"
}

#HotIf
