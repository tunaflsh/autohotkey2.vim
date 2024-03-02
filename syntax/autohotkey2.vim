" Vim syntax file
" Language:         AutoHotkey script file
" Maintainer:       Michael Wong
"                   https://github.com/mmikeww/autohotkey.vim
" Latest Revision:  2017-04-03
" Previous Maintainers:       SungHyun Nam <goweol@gmail.com>
"                             Nikolai Weibull <now@bitwi.se>

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

syn keyword autohotkeyTodo
      \ contained
      \ TODO FIXME XXX NOTE

" only these chars are valid as escape sequences:   ,%`;nrbtvaf
" https://autohotkey.com/docs/commands/_EscapeChar.htm
syn match   autohotkeyEscape
      \ display
      \ '`[,%`;nrbtvaf]'

syn region autohotkeyString
      \ display
      \ oneline
      \ matchgroup=autohotkeyStringDelimiter
      \ start=+"+
      \ end=+"+
      \ contains=autohotkeyEscape

syn match autohotkeyVariable
      \ display
      \ oneline
      \ contains=autohotkeyBuiltinVariable
      \ keepend
      \ '%\S\{-}%'

syn keyword autohotkeyBuiltinVariable
      \ A_AhkPath A_AhkVersion A_AllowMainWindow A_AppData A_AppDataCommon
      \ A_Args A_Clipboard A_ComSpec A_ComputerName A_ControlDelay
      \ A_CoordModeCaret A_CoordModeMenu A_CoordModeMouse A_CoordModePixel
      \ A_CoordModeToolTip A_Cursor A_DD A_DDD A_DDDD A_DefaultMouseSpeed
      \ A_Desktop A_DesktopCommon A_DetectHiddenText A_DetectHiddenWindows
      \ A_EndChar A_EventInfo A_FileEncoding A_HotkeyInterval
      \ A_HotkeyModifierTimeout A_Hour A_IconFile A_IconHidden A_IconNumber
      \ A_IconTip A_Index A_InitialWorkingDir A_Is64bitOS A_IsAdmin A_IsCompiled
      \ A_IsCritical A_IsPaused A_IsSuspended A_KeyDelay A_KeyDelayPlay
      \ A_KeyDuration A_KeyDurationPlay A_Language A_LastError A_LineFile
      \ A_LineNumber A_ListLines A_LoopField A_LoopFileAttrib A_LoopFileDir
      \ A_LoopFileExt A_LoopFileFullPath A_LoopFileName A_LoopFilePath
      \ A_LoopFileShortName A_LoopFileShortPath A_LoopFileSize A_LoopFileSizeKB
      \ A_LoopFileSizeMB A_LoopFileTimeAccessed A_LoopFileTimeCreated
      \ A_LoopFileTimeModified A_LoopReadLine A_LoopRegKey A_LoopRegName
      \ A_LoopRegTimeModified A_LoopRegType A_MDay A_MM A_MMM A_MMMM A_MSec
      \ A_MaxHotkeysPerInterval A_MenuMaskKey A_Min A_Mon A_MouseDelay
      \ A_MouseDelayPlay A_MyDocuments A_Now A_NowUTC A_OSVersion A_PriorHotkey
      \ A_PriorKey A_ProgramFiles A_Programs A_ProgramsCommon A_PtrSize
      \ A_RegView A_ScreenDPI A_ScreenHeight A_ScreenWidth A_ScriptDir
      \ A_ScriptFullPath A_ScriptHwnd A_ScriptName A_Sec A_SendLevel A_SendMode
      \ A_Space A_StartMenu A_StartMenuCommon A_Startup A_StartupCommon
      \ A_StoreCapsLockMode A_Tab A_Temp A_ThisFunc A_ThisHotkey A_TickCount
      \ A_TimeIdle A_TimeIdleKeyboard A_TimeIdleMouse A_TimeIdlePhysical
      \ A_TimeSincePriorHotkey A_TimeSinceThisHotkey A_TitleMatchMode
      \ A_TitleMatchModeSpeed A_TrayMenu A_UserName A_WDay A_WinDelay A_WinDir
      \ A_WorkingDir A_YDay A_YWeek A_YYYY A_Year

syn match   autohotkeyBuiltinVariable
      \ contained
      \ display
      \ '%\d\+%'

syn keyword autohotkeyCommand
      \ ClipWait EnvGet EnvSet EnvUpdate
      \ Drive DriveGet DriveSpaceFree FileAppend FileCopy FileCopyDir
      \ FileCreateDir FileCreateShortcut FileDelete FileGetAttrib FileEncoding
      \ FileGetShortcut FileGetSize FileGetTime FileGetVersion FileInstall
      \ FileMove FileMoveDir FileReadLine FileRead FileRecycle FileRecycleEmpty
      \ FileRemoveDir FileSelectFolder FileSelectFile FileSetAttrib FileSetTime
      \ IniDelete IniRead IniWrite SetWorkingDir
      \ SplitPath
      \ Gui GuiControl GuiControlGet IfMsgBox InputBox MsgBox Progress
      \ SplashImage SplashTextOn SplashTextOff ToolTip TrayTip
      \ Hotkey ListHotkeys BlockInput ControlSend ControlSendRaw GetKeyState
      \ KeyHistory KeyWait Input Send SendRaw SendInput SendPlay SendEvent
      \ SendMode SetKeyDelay SetNumScrollCapsLockState SetStoreCapslockMode
      \ EnvAdd EnvDiv EnvMult EnvSub Random SetFormat Transform
      \ AutoTrim BlockInput CoordMode Critical Edit ImageSearch
      \ ListLines ListVars Menu OutputDebug PixelGetColor PixelSearch
      \ SetBatchLines SetEnv SetTimer SysGet Thread Transform URLDownloadToFile
      \ Click ControlClick MouseClick MouseClickDrag MouseGetPos MouseMove
      \ SetDefaultMouseSpeed SetMouseDelay
      \ Process Run RunWait RunAs Shutdown Sleep
      \ RegDelete RegRead RegWrite
      \ SoundBeep SoundGet SoundGetWaveVolume SoundPlay SoundSet
      \ SoundSetWaveVolume
      \ FormatTime IfInString IfNotInString Sort StringCaseSense StringGetPos
      \ StringLeft StringRight StringLower StringUpper StringMid StringReplace
      \ StringSplit StringTrimLeft StringTrimRight StringLen
      \ StrSplit StrReplace Throw
      \ Control ControlClick ControlFocus ControlGet ControlGetFocus
      \ ControlGetPos ControlGetText ControlMove ControlSend ControlSendRaw
      \ ControlSetText Menu PostMessage SendMessage SetControlDelay
      \ WinMenuSelectItem GroupActivate GroupAdd GroupClose GroupDeactivate
      \ DetectHiddenText DetectHiddenWindows SetTitleMatchMode SetWinDelay
      \ StatusBarGetText StatusBarWait WinActivate WinActivateBottom WinClose
      \ WinGet WinGetActiveStats WinGetActiveTitle WinGetClass WinGetPos
      \ WinGetText WinGetTitle WinHide WinKill WinMaximize WinMinimize
      \ WinMinimizeAll WinMinimizeAllUndo WinMove WinRestore WinSet
      \ WinSetTitle WinShow WinWait WinWaitActive WinWaitNotActive WinWaitClose
      \ SetCapsLockState SetNumLockState SetScrollLockState

syn keyword autohotkeyFunction
      \ InStr RegExMatch RegExReplace StrLen SubStr Asc Chr Func
      \ DllCall VarSetCapacity WinActive WinExist IsLabel OnMessage 
      \ Abs Ceil Exp Floor Log Ln Mod Round Sqrt Sin Cos Tan ASin ACos ATan
      \ FileExist GetKeyState NumGet NumPut StrGet StrPut RegisterCallback
      \ IsFunc Trim LTrim RTrim IsObject Object Array FileOpen
      \ ComObjActive ComObjArray ComObjConnect ComObjCreate ComObjGet
      \ ComObjError ComObjFlags ComObjQuery ComObjType ComObjValue ComObject
      \ Format Exception

syn keyword autohotkeyStatement
      \ Break Continue Exit ExitApp Gosub Goto OnExit Pause Return
      \ Suspend Reload new class extends

syn keyword autohotkeyRepeat
      \ Loop

syn keyword autohotkeyConditional
      \ IfExist IfNotExist If IfEqual IfLess IfGreater Else
      \ IfWinExist IfWinNotExist IfWinActive IfWinNotActive
      \ IfNotEqual IfLessOrEqual IfGreaterOrEqual
      \ while until for in try catch finally

syn match   autohotkeyPreProcStart
      \ nextgroup=
      \   autohotkeyInclude,
      \   autohotkeyPreProc
      \ skipwhite
      \ display
      \ '^\s*\zs#'

syn keyword autohotkeyInclude
      \ contained
      \ Include
      \ IncludeAgain

syn keyword autohotkeyPreProc
      \ contained
      \ HotkeyInterval HotKeyModifierTimeout
      \ Hotstring
      \ IfWinActive IfWinNotActive IfWinExist IfWinNotExist
      \ If IfTimeout
      \ MaxHotkeysPerInterval MaxThreads MaxThreadsBuffer MaxThreadsPerHotkey
      \ UseHook InstallKeybdHook InstallMouseHook
      \ KeyHistory
      \ NoTrayIcon SingleInstance
      \ WinActivateForce
      \ AllowSameLineComments
      \ ClipboardTimeout
      \ CommentFlag
      \ ErrorStdOut
      \ EscapeChar
      \ MaxMem
      \ NoEnv
      \ Persistent
      \ LTrim
      \ InputLevel
      \ MenuMaskKey
      \ Warn

syn keyword autohotkeyMatchClass
      \ ahk_group ahk_class ahk_id ahk_pid ahk_exe

syn match   autohotkeyNumbers
      \ display
      \ transparent
      \ contains=
      \   autohotkeyInteger,
      \   autohotkeyFloat
      \ '\<\d\|\.\d'

syn match   autohotkeyInteger
      \ contained
      \ display
      \ '\d\+\>'

syn match   autohotkeyInteger
      \ contained
      \ display
      \ '0x\x\+\>'

syn match   autohotkeyFloat
      \ contained
      \ display
      \ '\d\+\.\d*\|\.\d\+\>'

syn keyword autohotkeyType
      \ local
      \ global
      \ static
      \ byref

syn keyword autohotkeyBoolean
      \ true
      \ false

syn match   autohotkeyHotkey
      \ contains=autohotkeyKey,
      \   autohotkeyHotkeyDelimiter
      \ display
      \ '^\s*\S*\%( Up\)\?::'

syn match   autohotkeyKey
      \ contained
      \ display
      \ '^.\{-}'

syn match   autohotkeyDelimiter
      \ contained
      \ display
      \ '::'

" allowable hotstring options:
" https://autohotkey.com/docs/Hotstrings.htm
syn match   autohotkeyHotstringDefinition
      \ contains=autohotkeyHotstring,
      \   autohotkeyHotstringDelimiter
      \ display
      \ '^\s*:\%([*?]\|[BORZ]0\?\|C[01]\?\|K\d\+\|P\d\+\|S[IPE]\)*:.\{-}::'

syn match   autohotkeyHotstring
      \ contained
      \ display
      \ '.\{-}'

syn match   autohotkeyHotstringDelimiter
      \ contained
      \ display
      \ '::'

syn match   autohotkeyHotstringDelimiter
      \ contains=autohotkeyHotstringOptions
      \ contained
      \ display
      \ ':\%([*?]\|[BORZ]0\?\|C[01]\?\|K\d\+\|P\d\+\|S[IPE]\)*:'

syn match   autohotkeyHotstringOptions
      \ contained
      \ display
      \ '\%([*?]\|[BORZ]0\?\|C[01]\?\|K\d\+\|P\d\+\|S[IPE]\)*'

syn cluster autohotkeyCommentGroup
      \ contains=
      \   autohotkeyTodo,
      \   @Spell

syn match   autohotkeyComment
      \ display
      \ contains=@autohotkeyCommentGroup
      \ '\%(^;\|\s\+;\).*$'

syn region  autohotkeyComment
      \ contains=@autohotkeyCommentGroup
      \ matchgroup=autohotkeyCommentStart
      \ start='^\s*/\*'
      \ end='^\s*\*/'

" TODO: Shouldn't we look for g:, b:,  variables before defaulting to
" something?
if exists("g:autohotkey_syntax_sync_minlines")
  let b:autohotkey_syntax_sync_minlines = g:autohotkey_syntax_sync_minlines
else
  let b:autohotkey_syntax_sync_minlines = 50
endif
exec "syn sync ccomment autohotkeyComment minlines=" . b:autohotkey_syntax_sync_minlines

hi def link autohotkeyTodo                Todo
hi def link autohotkeyComment             Comment
hi def link autohotkeyCommentStart        autohotkeyComment
hi def link autohotkeyEscape              Special
hi def link autohotkeyHotkey              Type
hi def link autohotkeyKey                 Type
hi def link autohotkeyDelimiter           Delimiter
hi def link autohotkeyHotstringDefinition Type
hi def link autohotkeyHotstring           Type
hi def link autohotkeyHotstringDelimiter  autohotkeyDelimiter
hi def link autohotkeyHotstringOptions    Special
hi def link autohotkeyString              String
hi def link autohotkeyStringDelimiter     autohotkeyString
hi def link autohotkeyVariable            Identifier
hi def link autohotkeyVariableDelimiter   autohotkeyVariable
hi def link autohotkeyBuiltinVariable     Macro
hi def link autohotkeyCommand             Keyword
hi def link autohotkeyFunction            Function
hi def link autohotkeyStatement           autohotkeyCommand
hi def link autohotkeyRepeat              Repeat
hi def link autohotkeyConditional         Conditional
hi def link autohotkeyPreProcStart        PreProc
hi def link autohotkeyInclude             Include
hi def link autohotkeyPreProc             PreProc
hi def link autohotkeyMatchClass          Typedef
hi def link autohotkeyNumber              Number
hi def link autohotkeyInteger             autohotkeyNumber
hi def link autohotkeyFloat               autohotkeyNumber
hi def link autohotkeyType                Type
hi def link autohotkeyBoolean             Boolean

let b:current_syntax = "autohotkey"

let &cpo = s:cpo_save
unlet s:cpo_save
