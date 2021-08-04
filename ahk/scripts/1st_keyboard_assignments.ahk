#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ^ = ctrl, + = shift, ! = alt

Iconn = C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\icon3.png
Menu, Tray, Icon, %Iconn%

#SingleInstance force

#Include C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\scripts\main.ahk
#Include C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\scripts\windows_switching.ahk

;=====================================================================================
; OKNA
;=====================================================================================

#IfWinActive

!1::open_premiere()
!2::open_explorer()
!3::open_browser()
!4::open_discord()