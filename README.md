# Auto-Hide Desktop (+ ShowDesk)

![Under Construction](https://img.shields.io/static/v1?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAACmElEQVQokUWSa0iTcRTGn//26u4b6ZQ0U8lKMqykwPpgZVBEHyLp8jEoIZJADCQ0iCiStIwuZmHRioIuroQss2VkrkIrdeFckiZqdhctTXPOve8Tr7M6X8/zO+fwPEfIwy7IwQA0GgExGYQwyhCmMLRX1z2hJCJSN+xZgqAZnPgCaAUQ0EHICjSYLlKBCDdNQb7HLmeRoy3zQFnzYk/1WTckGUIXCVD+Kw+BpAxtuBXCpkN7bdXt/JL3W3J3xuHg3iTsL/NkNFWVPoWkQOj/wxooCrRhFgiTjI4n9ZVHHQObjxVEY8UGIi1zEhVFCahwdq5qvn+hHkKC0EcBigxwvAnkW3ge7L6TMi+VztOLOOKOY8ulKL68GM2emnjeLF3AZSlz2FCZ6yaHwLGv6pkv8MyxsUoHLcsLwBuHwE0rtdy2UuLWNTpmpkkszQEfnAPDAd47tbaB7NaJR+eXujfmtGTUXgFWp5uwPd8Oi1GBJEmwWYlP34L4PSFw7chPeD+MYnkWUVmy0CeNfe5N8ANIjNWpNmHzqklYrDIGRwRm2gXsM/xofRMOf1AgcbYOAfgxMvgxCmS9+dbh5A6VarxuIMdBDoJ0g+vSreytNpAEux7qqWrK82I+kC2xYOAzyFbz5QNJPrXhdRo4XK/n3WILkxPsbKqwsr8xBB3PjukhGyJJv+qqB+QvkN0mR2Fim5pU1hobzxTYOPbcyJoTNpoAlu6wdZKvIslR0O9VXe0Clc5p2Ge4WDh36ux3ThM/1RqnNhXvilU32cjvINtAf4cKdkzlSHpBTqgNY11JfLtFA+o14NU8Wx/piggNfg2yGVR8EF9/dP37PyCIoDQLs8z9hmv71nsC4wFz9klX2tD4/AEG+gBoQ7KghD8MZ2xdnt7s7wAAAABJRU5ErkJggg==&label=Under&message=Construction&color=yellow)

> I will be re-wrting this soon to work better with Windows 10.

Auto-Hide Desktop will automatically hide your desktop icons and taskbar once the system has been physically idle for more than the users specified time. Programs default is 3 seconds. The user has the ability to auto start this program at system boot and change the idle delay in the settings found in the system tray.

## Example Code - Toggling desktop icons
```
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
```
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
