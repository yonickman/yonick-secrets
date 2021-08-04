#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ^ = ctrl, + = shift, ! = alt

Iconnn = C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\icon4.png
Menu, Tray, Icon, %Iconnn%

#SingleInstance force

#Include C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\scripts\main.ahk
#Include C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\scripts\windows_switching.ahk

#if (getKeyState("F23", "P"))
F23::return ;this line is mandatory for proper functionality

a::
Send !{F4}

s::open_explorer()
d::open_premiere()

z::open_path("C:\Users\yonic\Documents\videa\currect_project")
x::open_path("C:\Users\yonic\Documents\videa\music")
c::open_path("C:\Users\yonic\Documents\videa\sound_effects")
v::open_path("C:\Users\yonic\Documents\videa")

#if ;this line will end the F23 secondary keyboard assignments.