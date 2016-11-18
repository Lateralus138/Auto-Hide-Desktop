#Persistent
#NoTrayIcon
#SingleInstance, Force
SetTimer,CheckHD,3000
OnExit("ShowDesk")
#Include, hdlib.ahk
CheckHD:
DetectHiddenWindows, On
If !WinExist("ahk_exe Auto-HideDesktop.exe")
	ExitApp
DetectHiddenWindows, Off
Return