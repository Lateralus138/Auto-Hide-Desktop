; Auto-hide desktop icons and taskbar on user idle (no physical input).

; Init
#NoEnv
#InstallKeybdHook
#InstallMouseHook
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%

; Vars
If !FileExist(A_WorkingDir "\ShowDesk.exe")
	{
		MsgBox,16,Auto-Hide Desktop Error,	%	"ShowDesk.exe is missing from Auto-Hide Desktop.`n"
													.	"Place ShowDesk.exe in this programs folder and`n"
													.	"try again."
		ExitApp
	}
Else
	check:=A_WorkingDir "\ShowDesk.exe"
exe:=A_WorkingDir "\Auto-HideDesktop.exe"
runState:=(RR("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run","Auto-Hide Desktop") == exe)?1:0
delay:=	RR("HKEY_CURRENT_USER\Software\Auto-Hide Desktop","IdleDelay")
			?RR("HKEY_CURRENT_USER\Software\Auto-Hide Desktop","IdleDelay")
			:3
Gosub, RunState
Gosub, DelayChange

; Build menus, intial loops and guis here
Menu, Tray, NoStandard
Menu, Tray, Tip, Auto-Hide Desktop
Menu, Tray, Add, &Settings, Settings
Menu, Tray, Add, &Reload Auto-Hide Desktop, Reload
Menu, Tray, Add, E&xit Auto-Hide Desktop, Exit

; End auto execute
OnExit("ShowDesk")
Run,% check
SetTimer, ToggleDeskIcons,1
Return

; Hotkeys


; Functions
#Include, C:\Users\jjpride25\Documents\AutoHotkey\Projects\HideDesktop\hdlib.ahk

; Classes


; Subs
DelayChange:
	delayMil:=delay*1000
	RegWrite,REG_SZ,HKEY_CURRENT_USER\Software\Auto-Hide Desktop, IdleDelay, % delay
Return
RunState:
	Gui, Settings:Submit, NoHide
	If runState
		RegWrite,REG_SZ,HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Auto-Hide Desktop, % exe
	Else
		RegDelete,HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Auto-Hide Desktop
Return
Settings:
	Settings()
Return
ToggleDeskIcons:
	ToggleDeskIcons(delayMil)
	ToggleTaskbar(delayMil)
Return
Exit:
	ExitApp
Return
Reload:
	Reload