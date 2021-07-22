#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Iconnn = C:\Users\yonic\Documents\applications\ahk\support_files\icon2.png
Menu, Tray, Icon, %Iconnn%

open_premiere()
{
WinActivate ahk_class Premiere Pro
Return
}

open_explorer()
{
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, explorers, ahk_class CabinetWClass
if WinActive("ahk_exe explorer.exe")
	GroupActivate, explorers, r
else
	WinActivate ahk_class CabinetWClass
Return
}

open_browser()
{
IfWinNotExist, ahk_class Chrome_WidgetWin_1
	Run, opera.exe
GroupAdd, opery, ahk_exe opera.exe
if WinActive("ahk_exe opera.exe")
	GroupActivate, opery, r
else
	WinActivate ahk_exe opera.exe
Return
}

open_discord()
{
WinActivate ahk_exe DiscordCanary.exe
Return
}