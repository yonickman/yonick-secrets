#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ^ = ctrl, + = shift, ! = alt

#SingleInstance force

Iconnnn = C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\icon1.png
Menu, Tray, Icon, %Iconnnn%

#IfWinActive ahk_class Chrome_WidgetWin_1
^r::
send ^s
sleep 5
SoundBeep, 1000, 500
Reload
Return


#ifWinActive ahk_exe Adobe Premiere Pro.exe


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
+F1::importer("no_signal_01")
+F2::importer("no_signal_02")
^!+S::importer("GUI_Swipe 09 1")
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


preset(item)
{
keywait, %A_PriorHotKey%

coordmode, pixel, Screen
coordmode, mouse, Screen
coordmode, Caret, Screen

BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

SetKeyDelay, 0

Sendinput, ^!+k
sleep 5
Sendinput, ^!+k
sleep 5

MouseGetPos, xposP, yposP

DllCall("SetCursorPos", "int", -500, "int", 600)
sleep 5

MouseClick, middle, , , 1
sleep 5

Sendinput, ^b
sleep 5

Sendinput, %item%
sleep 5

DllCall("SetCursorPos", "int", -732, "int", 190)
sleep 5

MouseClickDrag, Left, , , %xposP%, %yposP%, 0

MouseClick, middle, , , 1

blockinput, MouseMoveOff
BlockInput, off
}

;preset(item)
;{
;keywait, %A_PriorHotKey%
;
;coordmode, pixel, Window
;coordmode, mouse, Window
;coordmode, Caret, Window
;
;BlockInput, SendAndMouse
;BlockInput, MouseMove
;BlockInput, On
;
;SetKeyDelay, 0
;
;Sendinput, ^!+k ;shuttle stop
;sleep 5
;Sendinput, ^!+k
;sleep 5
;
;MouseGetPos, xposP, yposP
;
;Sendinput, ^!+7
;sleep 5
;
;Sendinput, ^b
;sleep 5
;
;Sendinput, %item%
;sleep 5
;
;MouseMove, %A_CaretX%, %A_CaretY%
;
;MouseGetPos, , , Window, classNN
;WinGetClass, class, ahk_id %Window%
;
;ControlGetPos, XX, YY, Width, Height, %classNN%, ahk_class %class%, SubWindow, SubWindow 
;
;MouseMove, XX+25, YY+70, 0
;sleep 5
;
;Sendinput, ^!+4
;sleep 5
;
;MouseClickDrag, Left, , , %xposP%, %yposP%, 0
;
;MouseClick, middle, , , 1
;
;blockinput, MouseMoveOff
;BlockInput, off
;}

;=====================================================================================

anchor()
{
keywait, %A_PriorHotKey%

coordmode, pixel, Screen
coordmode, mouse, Screen
coordmode, Caret, Screen

BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

SetKeyDelay, 0

MouseGetPos, xposP, yposP

DllCall("SetCursorPos", "int", 100, "int", 262)
sleep 5

Click, WheelUp, 100, , ,
sleep 500

MouseClick, Left, , , 1
sleep 200
MouseClick, Left, , , 1
sleep 5

PixelSearch, xx, yy, 1888, 79, 1914, 108, 0x2D8CEC, 30, Fast RGB
MouseMove, xx, yy, 0
sleep 5

;DllCall("SetCursorPos", "int", 1904, "int", 87)
;sleep 5

MouseClickDrag, Left, , , 1608, 253, 0
sleep 5

MouseMove, %xposP%, %yposP%, 0
sleep 5

MouseClick, middle, , , 1

blockinput, MouseMoveOff
BlockInput, off
}

;=====================================================================================

tracklocker()
{
keywait, %A_PriorHotKey%

BlockInput, on
BlockInput, MouseMove
MouseGetPos xPosCursor, yPosCursor

CoordMode Pixel
CoordMode Mouse, screen

ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_unlocked_targeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_unlocked_targeted.png
if ErrorLevel = 1
    goto try21
if ErrorLevel = 0
	{
	MouseMove, FoundX+15, FoundY+15, 0
	sleep 5
	click left
    goto resetlocker
	}
	
try21:
ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_unlocked_untargeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_unlocked_untargeted.png
if ErrorLevel = 1
    goto try31
if ErrorLevel = 0
	{
	MouseMove, FoundX+15, FoundY+15, 0
	sleep 5
	click left
    goto resetlocker
	}

try31:
ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_locked_targeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_locked_targeted.png
if ErrorLevel = 1
    goto try41
if ErrorLevel = 0
	{
	MouseMove, FoundX+15, FoundY+15, 0
	sleep 5
	click left
    goto resetlocker
	}

try41:
ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_locked_untargeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_locked_untargeted.png
if ErrorLevel = 0
	{
	MouseMove, FoundX+15, FoundY+15, 0
	sleep 5
	click left
    goto resetlocker
	}

resetlocker:
MouseMove, xPosCursor, yPosCursor, 0

blockinput, MouseMoveOff
BlockInput, off
}

;=====================================================================================

musicmute()
{
keywait, %A_PriorHotKey%

BlockInput, on
BlockInput, MouseMove
MouseGetPos xPosCursor, yPosCursor

CoordMode Pixel
CoordMode Mouse, screen

ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_unlocked_targeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_unlocked_targeted.png
if ErrorLevel = 1
    goto try22
if ErrorLevel = 0
	{
	MouseMove, FoundX+90, FoundY+3, 0
	sleep 5
	click left
    goto resetmute
	}
	
try22:
ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_unlocked_untargeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_unlocked_untargeted.png
if ErrorLevel = 1
    goto try32
if ErrorLevel = 0
	{
	MouseMove, FoundX+90, FoundY+3, 0
	sleep 5
	click left
    goto resetmute
	}

try32:
ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_locked_targeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_locked_targeted.png
if ErrorLevel = 1
    goto try42
if ErrorLevel = 0
	{
	MouseMove, FoundX+90, FoundY+3, 0
	sleep 5
	click left
    goto resetmute
	}

try42:
ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_locked_untargeted.png
if ErrorLevel = 1
	ImageSearch, FoundX, FoundY, 0, 600, 480, 1000, *5 C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\A3_ALT_locked_untargeted.png
if ErrorLevel = 0
	{
	MouseMove, FoundX+90, FoundY+3, 0
	sleep 5
	click left
    goto resetmute
	}

resetmute:
MouseMove, xPosCursor, yPosCursor, 0

blockinput, MouseMoveOff
BlockInput, off
}

;=====================================================================================

importer(item)
{
keywait, %A_PriorHotKey%

coordmode, pixel, Screen
coordmode, mouse, Screen
coordmode, Caret, Screen

BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

SetKeyDelay, 0

Sendinput, ^!+k
sleep 5
Sendinput, ^!+k
sleep 5

MouseGetPos, xposP, yposP

DllCall("SetCursorPos", "int", -1000, "int", 400)
sleep 5

MouseClick, middle, , , 1
sleep 5

Sendinput, ^b
sleep 5

Sendinput, %item%
sleep 300

DllCall("SetCursorPos", "int", -1150, "int", 210)
sleep 5

SendEvent {LButton Down}
;MouseClickDrag, Left, , , %xposP%, %yposP%, 0
MouseMove, xposP, yposP, 0

MouseClick, middle, , , 1

blockinput, MouseMoveOff
BlockInput, off
}

;=====================================================================================

highlight(item)
{
MouseGetPos x, y
DllCall("SetCursorPos", "int", 88, "int", 135)
MouseClick, left
PixelSearch, Px, Py, 130, 175, 445, 185, 0x2d8ceb, 30, Fast RGB
MouseMove, Px+10, Py+5, 0
SendEvent {LButton Down}
Loop
{
;sleep, 5
if !GetKeyState("LButton")
break
}
sleep 5
MouseMove, x, y, 0
}

;=====================================================================================

keyframe(item)
{
MouseGetPos x, y
PixelGetColor, color, 120, 180
if color=0x1D1D1D
{
DllCall("SetCursorPos", "int", 120, "int", 180)
MouseClick, left
Sendinput, ^!+5
MouseMove, x, y, 0
}
if color=0x454545
{
Sendinput, ^!+5
}
return
}