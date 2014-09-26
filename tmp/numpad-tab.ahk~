#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force ; Only one copy of this script should run at a time.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Numpad conversion on Tab-{jkluio789} {{{
$Tab::
KeyDown:=A_TickCount
KeyWait Tab
if (A_TickCount-KeyDown < 500)
    Send {Tab}
Return

#If GetKeyState("Tab", "p")
n::0
m::0
j::1
k::2
l::3
u::4
i::5
o::6

`;::Enter
p::Delete
Space::Send {Tab}

#If

;}}}
