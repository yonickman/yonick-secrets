#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; name: Eyedropper
; description: Get the color by your cursor.
; version: v1.1.0
; author: Gooosie
; github: https://github.com/gooosie/eyedropper
GUI -Caption -Resize +AlwaysOnTop +Border +ToolWindow
#Persistent
SetTimer, WatchCursor, 5
return

WatchCursor:
MouseGetPos, posX, posY
PixelGetColor, color, %posX%, %posY%, Slow RGB
colorRGB := HexToRGB(color)
ToolTip, %posX%`, %posY%`n%color%`n%colorRGB%
WinGetPos, tooltipX, tooltipY, tooltipW, tooltipH, ahk_class tooltips_class32
GUI, Color, %color%
winX := tooltipX
winY := tooltipY + tooltipH + 4
GUI, Show, x%winX% y%winY% w12 h12 NA
return

^h::
MouseGetPos, posX, posY
PixelGetColor, color, %posX%, %posY%, Slow RGB
Clipboard := color
return

^c::
MouseGetPos, posX, posY
PixelGetColor, color, %posX%, %posY%, Slow RGB
Clipboard := HexToRGB(color)
return

^q::
ExitApp

HexToRGB(color) {
    colorR := SubStr(color, 3, 2)
    colorG := SubStr(color, 5, 2)
    colorB := SubStr(color, 7, 2)
    colorR = 0x%colorR%
    colorG = 0x%colorG%
    colorB = 0x%colorB%
    SetFormat, IntegerFast, D
    colorR += 0
    SetFormat, IntegerFast, D
    colorG += 0
    SetFormat, IntegerFast, D
    colorB += 0
    colorRGB = %colorR%`, %colorG%`, %colorB%
    return colorRGB
}