#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ^ = ctrl, + = shift, ! = alt

Iconn = C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\icon3.png
Menu, Tray, Icon, %Iconn%

#SingleInstance force

#Include C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\scripts\main.ahk
#Include C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\scripts\windows.ahk

;=====================================================================================
; OKNA
;=====================================================================================

#if not WinActive("ahk_exe javaw.exe")

!1::open_premiere()
!2::open_explorer()
!3::open_browser()
!4::open_discord()
#if not WinActive("ahk_exe Adobe Premiere Pro.exe")
F4::maximize()


;=====================================================================================
; PREMIERE
;=====================================================================================

!W::yt_search()

;=====================================================================================
; PREMIERE
;=====================================================================================

#ifWinActive ahk_exe Adobe Premiere Pro.exe

!1::open_effects()

;anchor point ----------------------------------
F5::anchor()

;presets ----------------------------------
F2::preset("Slide Left (IN)")
F3::preset("Slide Left (OUT)")
F4::preset("Bige Zoom")

F6::preset("Blur transition")
F8::preset("A - GENTLE SHAKE")

+XButton2::preset("clear motion")

NumpadMult::preset("light blink")
NumpadSub::preset("blur blink")

;track locker
XButton2::tracklocker()
XButton1::musicmute()

;video / audio import
+F1::importer("Bars and Tone")
+F2::importer("no_signal_02")
!+S::importer("GUI_Swipe 09 1")
^!+C::importer("censor")
^!+B::importer("bad_word")

;scale highlight
F1::highlight("scale")

;solid keyframe
+W::keyframe("scale")


;150% speed
+2::
send, ^+!2
send, ^+!2
send, ^+!2
send, ^+!2
send, ^+!2