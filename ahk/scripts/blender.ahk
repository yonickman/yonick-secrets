#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Iconn = C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\icon5.png
;Menu, Tray, Icon, %Iconnnnn%

#SingleInstance force
#InstallKeybdHook
#InstallMouseHook
#UseHook On
#KeyHistory 500

Menu, Tray, Icon, %Iconn%
