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

maximize()
{
WinGetTitle, Title, A
WinMaximize, %Title%
}

open_premiere()
{
WinActivate ahk_class Premiere Pro
return
}

open_ae()
{
WinActivate ahk_class AE_CApplication_23.2
return
}

open_photoshop()
{
WinActivate ahk_class Photoshop
return
}

open_blender()
{
WinActivate ahk_exe blender.exe
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

get_color()
{
    MouseGetPos, xpos, ypos
    PixelGetColor, color, %xpos%, %ypos%, RGB
    hex := RGBToHex(color)
    Clipboard := hex
    ;MsgBox, Color Hex Code: %hex%`nCopied to clipboard!
}

RGBToHex(color) {
    r := (color & 0xFF)
    g := ((color >> 8) & 0xFF)
    b := ((color >> 16) & 0xFF)
    hex := Format("{:02X}{:02X}{:02X}", b, g, r)
    return hex
}


yt_search()
{
global
Gui, Add, Text,, Search:
Gui, Add, Edit, vname ym  ; The ym option starts a new column of controls.
Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
Gui, Show,, YouTube
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
StringReplace, nname, name, %A_Space%, +, All
link := "https://www.youtube.com/results?search_query=" + nname
Run opera.exe %link%
GuiEscape:
    Gui, Destroy
return
}