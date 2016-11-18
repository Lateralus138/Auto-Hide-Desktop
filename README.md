## Auto-Hide Desktop (+ ShowDesk)

Auto-Hide Desktop will automatically hide your desktop icons and taskbar once the system has been physically idle for more than the users specified time. Programs default is 3 seconds. The user has the ability to auto start this program at system boot and change the idle delay in the settings found in the system tray.

## Example Code - Getting the app list

ToggleDeskIcons(idle_time){
	DetectHiddenWindows, On
    ControlGet,id,Hwnd,,SysListView321,ahk_class Progman
    If !id
        ControlGet,id,Hwnd,,SysListView321,ahk_class WorkerW
	If (A_TimeIdlePhysical >= idle_time)
		{
			If IsVisible(id)
				WinHide, ahk_id %id%
			Return "Desktop icons are hidden."	
		}
    Else
        {
			If !IsVisible(id)
				WinShow, ahk_id %id%
			Return
        }
}

## Motivation

I want my machine to operate the way I want it to and this is how I want it to behave. Normal auto-hide for the taskbar means you have to hover at the bottom and that's not how I want it to behave. Maybe there are others like me who feel the same way and here is an option.

## Installation

Portable program (Plans for installer and portable option).


## Test
I have tested on Windows 10 32 Bit and Windows 7 64 Bit.

## Contributors

Ian Pride @ faithnomoread@yahoo.com - [Lateralus138] @ New Pride Services 

## License

	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

	License provided in gpl.txt