" Vim syntax file
" Language:         AutoHotkey v2.0 script file
" Maintainer:       Lauri Kaitala
"                   https://github.com/lawkaita/autohotkey2.vim
" Latest Revision:  2024-03-02
" Forked From:      https://github.com/mmikeww/autohotkey.vim
" V1 Syntax File Maintainers:        Michael Wong <https://github.com/mmikeww>
"                                    SungHyun Nam <goweol@gmail.com>
"                                    Nikolai Weibull <now@bitwi.se>

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

syn match   autohotkeySingleEquals        '\v\='

syn match   autohotkeyCompare             '\v\<'
syn match   autohotkeyCompare             '\v\>'
syn match   autohotkeyCompare             '\v\<\='
syn match   autohotkeyCompare             '\v\>\='
syn match   autohotkeyCompare             '\v\=\='

" ! symbol
syn match   autohotkeyLogical             '!'
syn match   autohotkeyCompare             '\v\!\='
syn match   autohotkeyCompare             '\v\!\=\='

" & symbol
syn match   autohotkeyBitwise             '\v\&'
syn match   autohotkeyVarRef              '&\S'he=e-1,me=e-1
syn match   autohotkeyLogical             '&&'

" | symbol
syn match   autohotkeyBitwise             '\v\|'
syn match   autohotkeyLogical             '||'

syn match   autohotkeyBitwise             '\v\^'
syn match   autohotkeyBitwise             '\v\~'
syn match   autohotkeyBitwise             '\v\<\<'
syn match   autohotkeyBitwise             '\v\>\>'
syn match   autohotkeyBitwise             '\v\>\>\>'

syn match   autohotkeyArithmetic          '\v\+'
syn match   autohotkeyArithmetic          '\v\-'
syn match   autohotkeyArithmetic          '\v\*'
syn match   autohotkeyArithmetic          '\v\*\*'
syn match   autohotkeyArithmetic          '\v\/'
syn match   autohotkeyArithmetic          '\v\/\/'

syn match   autohotkeyFatArrow            '\v\=\>'
syn match   autohotkeyRegexMatch          '\v\~\='

syn match   autohotkeyIncrement           '\S++'hs=s+1,ms=s+1
syn match   autohotkeyIncrement           '++\S'he=e-1,me=e-1
syn match   autohotkeyDecrement           '\S--'hs=s+1,ms=s+1

" doesnt work for some reason, gets mixed up with normal minus
"syn match   autohotkeyDecrement           '\v\-\-\S'he=e-1,ms=e-1

" this works however
syn match   autohotkeyDecrement           '\v\-\-\S'he=e-1

syn match   autohotkeyMaybe               '\i?'hs=s+1,ms=s+1

syn match   autohotkeyOrMaybe             '??'

syn match   autohotkeyAssign              '\v\&\='
syn match   autohotkeyAssign              '\v\*\='
syn match   autohotkeyAssign              '\v\-\='
syn match   autohotkeyAssign              '\v\.\='
syn match   autohotkeyAssign              '\v\/\/\='
syn match   autohotkeyAssign              '\v\:\='
syn match   autohotkeyAssign              '\v\<\<\='
syn match   autohotkeyAssign              '\v\>\>\='
syn match   autohotkeyAssign              '\v\>\>\>\='
syn match   autohotkeyAssign              '\v\^\='
syn match   autohotkeyAssign              '\v\|\='
syn match   autohotkeyAssign              '\v\+\='
syn match   autohotkeyAssign              '\v\/\='

syn match   autohotkeyPropertyAccess      '\.\i\+'hs=s+1,ms=s+1
hi def link autohotkeyPropertyAccess      Identifier

syn keyword autohotkeyTodo
      \ contained
      \ TODO FIXME XXX NOTE

" only these chars are valid as escape sequences:   "',%`;nrbtvaf
" https://www.autohotkey.com/docs/v2/misc/EscapeChar.htm
syn match   autohotkeyEscape
      \ display
      \ /`["',%`;nrbtvaf]/

syn region autohotkeyString
      \ display
      \ oneline
      \ matchgroup=autohotkeyStringDelimiter
      \ start=+"+
      \ end=+"+
      \ skip=+`"+
      \ contains=autohotkeyEscape,autohotkeyMatchClass

syn region autohotkeyStringSingleQuoted
      \ display
      \ oneline
      \ matchgroup=autohotkeyStringDelimiter
      \ start=+'+
      \ end=+'+
      \ skip=+`'+
      \ contains=autohotkeyEscape,autohotkeyMatchClass

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

syn keyword autohotkeyFunction
      \ ACos ASin ATan Abs BlockInput CallbackCreate CallbackFree CaretGetPos
      \ Ceil Chr Click ClipWait ComCall ComObjActive ComObjConnect ComObjFlags
      \ ComObjFromPtr ComObjGet ComObjQuery ComObjType ComObjValue
      \ ControlAddItem ControlChooseIndex ControlChooseString ControlClick
      \ ControlDeleteItem ControlFindItem ControlFocus ControlGetChecked
      \ ControlGetChoice ControlGetClassNN ControlGetEnabled ControlGetExStyle
      \ ControlGetFocus ControlGetHwnd ControlGetIndex ControlGetItems
      \ ControlGetPos ControlGetStyle ControlGetText ControlGetVisible
      \ ControlHide ControlHideDropDown ControlMove ControlSend ControlSendText
      \ ControlSetChecked ControlSetEnabled ControlSetExStyle ControlSetStyle
      \ ControlSetText ControlShow ControlShowDropDown CoordMode Cos Critical
      \ DateAdd DateDiff DetectHiddenText DetectHiddenWindows DirCopy DirCreate
      \ DirDelete DirExist DirMove DirSelect DllCall Download DriveEject
      \ DriveGetCapacity DriveGetFileSystem DriveGetLabel DriveGetList
      \ DriveGetSerial DriveGetSpaceFree DriveGetStatus DriveGetStatusCD
      \ DriveGetType DriveLock DriveRetract DriveSetLabel DriveUnlock Edit
      \ EditGetCurrentCol EditGetCurrentLine EditGetLine EditGetLineCount
      \ EditGetSelectedText EditPaste EnvGet EnvSet Exit ExitApp Exp FileAppend
      \ FileCopy FileCreateShortcut FileDelete FileEncoding FileExist
      \ FileGetAttrib FileGetShortcut FileGetSize FileGetTime FileGetVersion
      \ FileInstall FileMove FileOpen FileRead FileRecycle FileRecycleEmpty
      \ FileSelect FileSetAttrib FileSetTime Floor Format FormatTime GetKeyName
      \ GetKeySC GetKeyState GetKeyVK GetMethod GroupActivate GroupAdd
      \ GroupClose GroupDeactivate GuiCtrlFromHwnd GuiFromHwnd HasBase HasMethod
      \ HasProp HotIf HotIfWinActive HotIfWinExist HotIfWinNotActive
      \ HotIfWinNotExist Hotkey Hotstring IL_Add IL_Create IL_Destroy
      \ ImageSearch InStr IniDelete IniRead IniWrite InputBox InstallKeybdHook
      \ InstallMouseHook IsAlnum IsAlpha IsDigit IsFloat IsInteger IsLabel
      \ IsLower IsNumber IsObject IsSet IsSetRef IsSpace IsTime IsUpper IsXDigit
      \ KeyHistory KeyWait LTrim ListHotkeys ListLines ListVars
      \ ListViewGetContent Ln LoadPicture Log Max MenuFromHandle MenuSelect Min
      \ Mod MonitorGet MonitorGetCount MonitorGetName MonitorGetPrimary
      \ MonitorGetWorkArea MouseClick MouseClickDrag MouseGetPos MouseMove
      \ MsgBox NumGet NumPut ObjAddRef ObjBindMethod ObjFromPtr ObjFromPtrAddRef
      \ ObjGetBase ObjGetCapacity ObjHasOwnProp ObjOwnPropCount ObjOwnProps
      \ ObjPtr ObjPtrAddRef ObjRelease ObjSetBase ObjSetCapacity
      \ OnClipboardChange OnError OnExit OnMessage Ord OutputDebug Pause
      \ Persistent PixelGetColor PixelSearch PostMessage ProcessClose
      \ ProcessExist ProcessGetName ProcessGetParent ProcessGetPath
      \ ProcessSetPriority ProcessWait ProcessWaitClose RTrim Random
      \ RegCreateKey RegDelete RegDeleteKey RegExMatch RegExReplace RegRead
      \ RegWrite Reload Round Run RunAs RunWait Send SendEvent SendInput
      \ SendLevel SendMessage SendMode SendPlay SendText SetCapsLockState
      \ SetControlDelay SetDefaultMouseSpeed SetKeyDelay SetMouseDelay
      \ SetNumLockState SetRegView SetScrollLockState SetStoreCapsLockMode
      \ SetTimer SetTitleMatchMode SetWinDelay SetWorkingDir Shutdown Sin Sleep
      \ Sort SoundBeep SoundGetInterface SoundGetMute SoundGetName
      \ SoundGetVolume SoundPlay SoundSetMute SoundSetVolume SplitPath Sqrt
      \ StatusBarGetText StatusBarWait StrCompare StrGet StrLen StrLower StrPtr
      \ StrPut StrReplace StrSplit StrTitle StrUpper SubStr Suspend SysGet
      \ SysGetIPAddresses Tan Thread ToolTip TraySetIcon TrayTip Trim Type
      \ VarSetStrCapacity VerCompare WinActivate WinActivateBottom WinActive
      \ WinClose WinExist WinGetClass WinGetClientPos WinGetControls
      \ WinGetControlsHwnd WinGetCount WinGetExStyle WinGetID WinGetIDLast
      \ WinGetList WinGetMinMax WinGetPID WinGetPos WinGetProcessName
      \ WinGetProcessPath WinGetStyle WinGetText WinGetTitle WinGetTransColor
      \ WinGetTransparent WinHide WinKill WinMaximize WinMinimize WinMinimizeAll
      \ WinMinimizeAllUndo WinMove WinMoveBottom WinMoveTop WinRedraw WinRestore
      \ WinSetAlwaysOnTop WinSetEnabled WinSetExStyle WinSetRegion WinSetStyle
      \ WinSetTitle WinSetTransColor WinSetTransparent WinShow WinWait
      \ WinWaitActive WinWaitClose WinWaitNotActive

syn keyword autohotkeyBuiltinClass
      \ Any Array BoundFunc Buffer Class ClipboardAll Closure ComObjArray
      \ ComObject ComValue ComValueRef Enumerator Error File Float Func Gui
      \ IndexError InputHook Integer Map MemberError MemoryError Menu MenuBar
      \ MethodError Number OSError Object Primitive PropertyError RegExMatchInfo
      \ String TargetError TimeoutError TypeError UnsetError UnsetItemError
      \ ValueError VarRef ZeroDivisionError

syn keyword autohotkeyStatement
      \ as class extends in is super this

syn keyword autohotkeyLogical
      \ and or not


syn keyword autohotkeyUnset
      \ unset

syn keyword autohotkeyRepeat
      \ Loop For While Until

syn keyword autohotkeyConditional
      \ Break Case Catch Continue Default Else Finally Goto If Return Switch
      \ Throw Try

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
      \ ClipboardTimeout DllLoad ErrorStdOut HotIf HotIfTimeout Hotstring
      \ InputLevel MaxThreads MaxThreadsBuffer MaxThreadsPerHotkey NoTrayIcon
      \ Requires SingleInstance SuspendExempt UseHook Warn WinActivateForce

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

syn keyword autohotkeyBoolean
      \ true
      \ false

syn match   autohotkeyLabel
      \ contains=autohotkeyLabelName,
      \   autohotkeyLabelDelimiter,
      \   autohotkeyComment
      \ display
      \ '^\s*\i\+:\s*\%(;.*\)\?$'

syn match   autohotkeyLabelName
      \ contained
      \ display
      \ '\i\+'

syn match   autohotkeyLabelDelimiter
      \ contained
      \ display
      \ ':'

syn match   autohotkeyHotkey
      \ contains=autohotkeyKey,
      \   autohotkeyDelimiter
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
hi def link autohotkeyLabelName           PreProc
hi def link autohotkeyLabelDelimiter      Delimiter
hi def link autohotkeyEscape              Special
hi def link autohotkeyHotkey              Type
hi def link autohotkeyKey                 Type
hi def link autohotkeyDelimiter           Delimiter
hi def link autohotkeyHotstringDefinition Type
hi def link autohotkeyHotstring           Type
hi def link autohotkeyHotstringDelimiter  autohotkeyDelimiter
hi def link autohotkeyHotstringOptions    Special
hi def link autohotkeyString              String
hi def link autohotkeyStringSingleQuoted  String
hi def link autohotkeyStringDelimiter     autohotkeyString
hi def link autohotkeyVariable            Identifier
hi def link autohotkeyVariableDelimiter   autohotkeyVariable
hi def link autohotkeyBuiltinVariable     Macro
hi def link autohotkeyBuiltinClass        Type
hi def link autohotkeyFunction            Function
hi def link autohotkeyStatement           Keyword
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
hi def link autohotkeyUnset               Special
hi def link autohotkeyLogical             autohotkeyStatement
hi def link autohotkeyMaybe               Special
hi def link autohotkeyVarRef              autohotkeyType

let b:current_syntax = "autohotkey2"

let &cpo = s:cpo_save
unlet s:cpo_save
