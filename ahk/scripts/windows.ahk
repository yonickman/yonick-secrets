#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Iconnnnn = C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\icon2.png
;Menu, Tray, Icon, %Iconnnnn%

#SingleInstance force
#InstallKeybdHook
#InstallMouseHook
#UseHook On
#KeyHistory 500

Menu, Tray, Icon, imageres.dll, 262


;!Xbutton1

#If MouseIsOver("ahk_class Shell_TrayWnd") or MouseIsOver("ahk_class Shell_SecondaryTrayWnd") ;To use over taskbars on other monitors
WheelUp::Send {Volume_Up} ;Increase volume when over taskbar
WheelDown::Send {Volume_Down} ;Decrease volumen when over taskbar
#If
	
MouseIsOver(WinTitle) {
MouseGetPos,,, Win ;Detect Window mouse is over
return WinExist(WinTitle " ahk_id " Win) ;Return Window title that Mouse is overj
}

open_premiere()
{
WinActivate ahk_class Premiere Pro
Return
}

open_effects()
{
WinActivate ahk_class AE_CApplication_18.0
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

;open_path(item)
;{
;Run, %item%
;}

open_path(item)
{
currect_project = "C:\Users\yonic\Documents\videa\currect_project"
music = "C:\Users\yonic\Documents\videa\music"
sound_effects = "C:\Users\yonic\Documents\videa\sound_effects"

Run, %item%

if item contains music
	WinClose, angry
	WinClose, dramatic
	WinClose, epidemic
	WinClose, epidemic_jazz
	WinClose, happy_fast
	WinClose, happy_neutral
	WinClose, jazz
	WinClose, meme
	WinClose, neutral
	WinClose, orchestrated
	WinClose, slow
if item contains sound_effects
	WinClose, BIG5AUDIO_UI & UX_FINAL
	WinClose, minecraft_sounds
	WinClose, WhooshToHit
	WinClose, wooshes
}














;-------------------------------------------------
; Window dragging via alt+lbutton                -
; Author: Lasmori (email AT lasmori D0T com)     -
;-------------------------------------------------
Xbutton2::

CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
WinGet, window_minmax, MinMax, ahk_id %window_id%

; Return if the window is maximized or minimized
if window_minmax <> 0
{
  return
}

CoordMode, Mouse, Screen
SetWinDelay, 0

loop
{
  ; exit the loop if the left mouse button was released
  if !GetKeyState("Xbutton2", "P")
  {
    break
  }

  ; move the window based on cursor position
  MouseGetPos, cur_x, cur_y
  WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}

return











#if not WinActive("ahk_exe Adobe Premiere Pro.exe")

#if not (WinActive("ahk_class Premiere Pro") and WinActive("ahk_exe Adobe Premiere Pro.exe") or (WinActive("ahk_exe AfterFX.exe"))
or (WinActive("ahk_class DroverLord - Window Class") and WinActive("ahk_exe Adobe Premiere Pro.exe") ) ) ;YOU CAN DELETE THIS LINE ENTIRELY. i have this just for a SINGLE exception in Premiere when i want to use window dragging on Save/load dialouge boxes and sheeyt. Also i want it to work when the timeline is NOT on the main Premiere window. ;edit: wow, it works incredibly well. nice! ;edit2: now it also deliberately won't work in after effects. Nice! so i can keep adding ORs to the end to add more applications. I just remember that pairing OR and NOT together can sometimes result in everything being accepted by the IF statement...




Xbutton1::

; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
    KDE_WinLeft := 1
Else
    KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
    KDE_WinUp := 1
Else
    KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,Xbutton1,P ; Break if button has been released
	If KDE_Button = U
        break

    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    SetWinDelay,-1
	WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
	KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return







