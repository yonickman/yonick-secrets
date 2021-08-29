#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
 #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force





;rozkliknout source 1 cas 1
;zkopirovat cas
;rozkliknout source 1 cas 2
;zkopirovat cas
;odecist cas 1 od cas 2
;to pricist k source 2




F12::
coordmode, pixel, Screen
coordmode, mouse, Screen
coordmode, Caret, Screen


;PixelSearch, Px, Py, 1052, 547, 1822, 554, 0x2D8CEB, 30, Fast RGB
;sleep 5
;MouseMove, Px-50, 680, 0
;MouseClick, Left
;sleep 5
;MouseClick, Left
;sleep 200
;msgbox otevrel source 1 cas 1

;MouseMove, -1243, 953, 0
;MouseClick, Left
;sleep 5
;Send ^c
;sleep 5
;Source1Cas1 = %clipboard%
;sleep 200
;msgbox zkopiroval source 1 cas 1 %Source1Cas1%

;Sendinput, ^!+4
;Sendinput, ^!+q

;sleep 200

;PixelSearch, Px, Py, 1052, 547, 1822, 554, 0x2D8CEB, 30, Fast RGB
;sleep 5
;MouseMove, Px+20, 680, 0
;sleep 200
;MouseClick, Left
;sleep 5
;MouseClick, Left
;sleep 200
;msgbox otevrel source 1 cas 2

;MouseMove, -1243, 953, 0
;MouseClick, Left
;sleep 5
;Send ^c
;sleep 5
;Source1Cas2 = %clipboard%
;sleep 200
;msgbox zkopiroval source 1 cas 2 %Source1Cas1%

;sleep 200

;mezicas1 := Source1Cas2 - Source1Cas1
;msgbox mezicas je %mezicas1%


;PixelSearch, Px, Py, 1052, 547, 1822, 554, 0x2D8CEB, 30, Fast RGB
;sleep 5
;MouseMove, Px+20, 630, 0
;sleep 200
;MouseClick, Left
;sleep 5
;Sendinput, ^!+0
;sleep 200
;msgbox otevrel source 2 cas 1





MouseGetPos, xx, yy
MouseMove, -1243, 953, 0
sleep 200
MouseClick, Left
sleep 200
sleep 5
Send ^c
sleep 5
Source2Cas1 = %clipboard%
sleep 200
;msgbox zkopiroval source 2 cas 1 %Source2Cas1%
;sleep 200

mezicas = 840
FinalCas1 := Source2Cas1 + mezicas

MouseMove, xx, yy-50, 0
MouseClick, Left
sleep 200
Sendinput, ^!+0
sleep 200

MouseMove, -1243, 953, 0
MouseClick, Left
sleep 200
SendRaw, %FinalCas1%
sleep 200
SendEvent, {Enter}
;msgbox napsal finalni cas
sleep 200
Send, 5
MouseMove, xx, yy
;msgbox oznacil bod

;MouseMove, 1394, 403, 0
;MouseClick, Left
;sleep 5
;Send ^c
;sleep 5
;SequenceCas1 = %clipboard%
;sleep 200
;;msgbox zkopiroval sequence cas 1 %SequenceCas1%
;
;Sendinput, ^!+4
;Sendinput, ^!+q
;
;sleep 200
;
;MouseClick, Left
;sleep 5
;Send ^c
;sleep 200
;SequenceCas2 = %clipboard%
;sleep 200
;;msgbox zkopiroval sequence cas 2 %SequenceCas2%
;
;mezicas2 := SequenceCas2 - SequenceCas1
;sleep 200
;FinalCas2 := FinalCas1 + mezicas2
;
;MouseMove, -1243, 953, 0
;sleep 200
;MouseClick, Left
;sleep 200
;SendRaw, %FinalCas2%
;sleep 200
;SendEvent, {Enter}
;;msgbox napsal finalni cas
;sleep 200
;Send, 6
;;msgbox oznacil bod
;sleep 200
;Sendinput, ^!+4
;Sendinput, ^!+w
;sleep 300
;Sendinput, ^!+e