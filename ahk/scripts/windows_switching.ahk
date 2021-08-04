#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Iconnnnn = C:\Users\yonic\Documents\GitHub\yonick-secrets\ahk\support_files\icon2.png
Menu, Tray, Icon, %Iconnnnn%

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



















;Pamatuji si, když jsi měl asi 10,000 odběrů a já tě objevil ještě s mikrofonem z brambory a trollení na legends worldu. Od té doby se strašně moc změnilo.. Čas plyne jako voda a tobě už bude 19. Za poslední 2 roky ses úplně změnil, vyspěl jsi