#include "GUI_Zones.au3"
#include <WinAPI.au3>
#include <WinAPITheme.au3>
#include <WinAPIConstants.au3>

Global $strName = ""
Global $NumberRun = 0
Global $boolrun = False
Global $coords[2]
Global $Title, $sGW
Global $Bool_Donate = False, $Bool_HM = False, $Bool_AddHeroes = False, $Bool_Bu = False, $Bool_Stones = False
Global $Bool_OpenChests = False, $Bool_Conset = False
Global $iniHero = $VANQUISHER_HERO_INI

; Blue dashboard palette (AutoIt uses 0xRRGGBB colors)
Global Const $GUI_CLR_BG = 0x0B0F14       ; Version 5.0a near-black navy background
Global Const $GUI_CLR_PANEL = 0x121A24    ; card / panel navy
Global Const $GUI_CLR_INPUT = 0x0D1B2A    ; input and log surface
Global Const $GUI_CLR_BORDER = 0x163A63   ; subtle blue border
Global Const $GUI_CLR_ACCENT = 0x2F8CFF   ; clean blue accent
Global Const $GUI_CLR_ACTIVE = 0x1F5FAF   ; selected navigation button
Global Const $GUI_CLR_HEADER = 0x163A63   ; card header strip
Global Const $GUI_CLR_TEXT = 0xF1F7FF     ; clean white text
Global Const $GUI_CLR_MUTED = 0xA8B3C2    ; muted blue labels

Global $lvRoutes
Global $lblStatusValue, $lblStatusChar, $lblStatusCampaign, $lblStatusZone, $lblStatusQueue, $lblStatusTitle
Global $edtRoutePreview, $edtSessionLog

Opt("GUIOnEventMode", 1)

$Master_Vanquisher = GUICreate("Master Vanquisher Reforged", 1120, 760, -1, -1)
GUISetBkColor($GUI_CLR_BG)

; --- Header ---
Global $lblHeader = GUICtrlCreateLabel("MASTER VANQUISHER REFORGED", 28, 18, 600, 34)
GUICtrlSetFont(-1, 20, 800, 0, "Segoe UI")
GUICtrlSetColor(-1, $GUI_CLR_ACCENT)
Global $lblSubtitle = GUICtrlCreateLabel("Legendary Vanquisher Title Assistance", 30, 56, 420, 18)
GUICtrlSetFont(-1, 10, 400, 2, "Segoe UI")
GUICtrlSetColor(-1, 0x7DBEFF)
Global $lblTagline = GUICtrlCreateLabel("by Incognito-ghroot", 30, 76, 260, 18)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
Global $lblVersion = GUICtrlCreateLabel("Version 5.0a", 300, 76, 120, 18)
GUICtrlSetColor(-1, 0x6E7D91)
Global $lblStatusBadge = GUICtrlCreateLabel("IDLE", 500, 76, 82, 20, $SS_CENTER)
GUICtrlSetFont(-1, 9, 700, 0, "Segoe UI")
GUICtrlSetBkColor(-1, $GUI_CLR_HEADER)
GUICtrlSetColor(-1, $GUI_CLR_TEXT)

; --- Control bar ---
GUICtrlCreateLabel("Character", 28, 122, 70, 18)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
Global Const $txtName = GUICtrlCreateCombo("", 105, 118, 190, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
Global $btnRefreshChars = GUICtrlCreateButton("Refresh", 310, 118, 76, 25)
GUICtrlSetTip(-1, "Refresh Guild Wars client list")
GUICtrlSetOnEvent(-1, "RefreshCharNames")
Global $btnAttach = GUICtrlCreateButton("Attach", 394, 118, 70, 25)
GUICtrlSetTip(-1, "Connect to the selected Guild Wars character")
GUICtrlSetOnEvent(-1, "AttachToGuildWars")
Global $chkOnTop = GUICtrlCreateCheckbox("On Top", 484, 122, 75, 18)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
Global $chkDebug = GUICtrlCreateCheckbox("Debug", 570, 122, 65, 18)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $btnSaveQueue = GUICtrlCreateButton("Save Queue", 650, 118, 90, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $btnLoadQueue = GUICtrlCreateButton("Load Queue", 750, 118, 90, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $Start = GUICtrlCreateButton("Start Vanquishing", 870, 118, 145, 26)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
Global $btnPause = GUICtrlCreateButton("Pause", 1025, 118, 70, 24)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $btnStop = GUICtrlCreateButton("Stop", 1025, 146, 70, 24)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $btnStartQueue = GUICtrlCreateButton("Start Queue", 1060, 116, 48, 48)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetState($btnStartQueue, $GUI_HIDE)

; --- Status bar ---
GUICtrlCreateLabel("Status:", 28, 166, 42, 16)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
$lblStatusValue = GUICtrlCreateLabel("WAITING FOR ATTACH", 86, 166, 160, 16)
GUICtrlSetColor(-1, $GUI_CLR_ACCENT)
GUICtrlCreateLabel("Character:", 265, 166, 62, 16)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
$lblStatusChar = GUICtrlCreateLabel("None", 335, 166, 125, 16)
GUICtrlSetColor(-1, $GUI_CLR_TEXT)
GUICtrlCreateLabel("Campaign:", 470, 166, 62, 16)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
$lblStatusCampaign = GUICtrlCreateLabel("None", 540, 166, 88, 16)
GUICtrlSetColor(-1, $GUI_CLR_TEXT)
GUICtrlCreateLabel("Current Zone:", 640, 166, 82, 16)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
$lblStatusZone = GUICtrlCreateLabel("None", 730, 166, 110, 16)
GUICtrlSetColor(-1, $GUI_CLR_TEXT)
GUICtrlCreateLabel("Queue:", 850, 166, 40, 16)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
$lblStatusQueue = GUICtrlCreateLabel("0 zones", 898, 166, 65, 16)
GUICtrlSetColor(-1, $GUI_CLR_TEXT)
GUICtrlCreateLabel("Title:", 990, 166, 32, 16)
GUICtrlSetColor(-1, $GUI_CLR_MUTED)
$lblStatusTitle = GUICtrlCreateLabel("0%", 1030, 166, 45, 16)
GUICtrlSetColor(-1, $GUI_CLR_ACCENT)

; --- Custom navigation buttons (replaces native tabs for consistent Windows styling) ---
Global $btnPageMain = GUICtrlCreateButton("Main", 610, 28, 86, 32)
GUICtrlSetOnEvent(-1, "_Vanquisher_TabClick")
Global $btnPageStats = GUICtrlCreateButton("Stats", 702, 28, 86, 32)
GUICtrlSetOnEvent(-1, "_Vanquisher_TabClick")
Global $btnPageAreas = GUICtrlCreateButton("Areas", 794, 28, 86, 32)
GUICtrlSetOnEvent(-1, "_Vanquisher_TabClick")
Global $btnPageOptions = GUICtrlCreateButton("Heroes", 886, 28, 86, 32)
GUICtrlSetOnEvent(-1, "_Vanquisher_TabClick")
Global $btnPageLogs = GUICtrlCreateButton("Log", 978, 28, 86, 32)
GUICtrlSetOnEvent(-1, "_Vanquisher_TabClick")

; === Main page ===

Global $grpOverall = GUICtrlCreateGroup("", 24, 196, 1070, 70)
Global $hdrOverall = _Vanquisher_CreateCardHeader("MASTER VANQUISHER PROGRESS", 24, 196, 1070)
Global $lblOverallProgress = GUICtrlCreateLabel("0 / 136 Zones Completed", 48, 228, 220, 18)
GUICtrlSetColor(-1, $GUI_CLR_TEXT)
Global $progOverall = GUICtrlCreateProgress(320, 228, 700, 18)
GUICtrlSetData(-1, 0)
Global $lblOverallPct = GUICtrlCreateLabel("0%", 1040, 228, 40, 18, $SS_RIGHT)
GUICtrlSetColor(-1, $GUI_CLR_TEXT)

Global $grpTitleProg = GUICtrlCreateGroup("", 24, 286, 260, 164)
Global $hdrTitleProg = _Vanquisher_CreateCardHeader("TITLE PROGRESS", 24, 286, 260)
Global $lblProgProp = GUICtrlCreateLabel("Prophecies: 0 / 54", 44, 318, 130, 16)
Global $progProp = GUICtrlCreateProgress(190, 318, 78, 14)
Global $lblProgFac = GUICtrlCreateLabel("Factions: 0 / 33", 44, 342, 130, 16)
Global $progFac = GUICtrlCreateProgress(190, 342, 78, 14)
Global $lblProgNF = GUICtrlCreateLabel("Nightfall: 0 / 34", 44, 366, 130, 16)
Global $progNF = GUICtrlCreateProgress(190, 366, 78, 14)
Global $lblProgEotN = GUICtrlCreateLabel("EotN: 0 / 15", 44, 390, 130, 16)
Global $progEotN = GUICtrlCreateProgress(190, 390, 78, 14)
Global $lblProgTotal = GUICtrlCreateLabel("Total: 0 / 136", 44, 422, 130, 16)
Global $progTotal = GUICtrlCreateProgress(190, 422, 78, 14)

Global $grpSession = GUICtrlCreateGroup("", 306, 286, 250, 118)
Global $hdrSession = _Vanquisher_CreateCardHeader("SESSION STATS", 306, 286, 250)
Global $lblRuntime = GUICtrlCreateLabel("Runtime: 00:00:00", 326, 318, 210, 16)
Global $lblZonesDone = GUICtrlCreateLabel("Zones Completed: 0", 326, 342, 210, 16)
Global $lblDeaths = GUICtrlCreateLabel("Deaths: 0", 326, 366, 210, 16)
Global $lblFails = GUICtrlCreateLabel("Fails: 0", 326, 390, 210, 16)

Global $grpCharInfo = GUICtrlCreateGroup("", 306, 420, 250, 126)
Global $hdrCharInfo = _Vanquisher_CreateCardHeader("CHARACTER INFO", 306, 420, 250)
Global $lblCharName = GUICtrlCreateLabel("Name: None", 326, 452, 210, 16)
Global $lblCharProf = GUICtrlCreateLabel("Profession: Unknown", 326, 476, 210, 16)
Global $lblCharLevel = GUICtrlCreateLabel("Level: --", 326, 500, 210, 16)
Global $lblCharTitle = GUICtrlCreateLabel("Title Progress: 0%", 326, 524, 210, 16)

Global $grpRoute = GUICtrlCreateGroup("", 580, 286, 250, 284)
Global $hdrRoute = _Vanquisher_CreateCardHeader("CURRENT ROUTE", 580, 286, 250)
Global $edtRoutePreview = GUICtrlCreateEdit("", 594, 318, 220, 234, BitOR($ES_READONLY, $ES_MULTILINE, $WS_VSCROLL))
GUICtrlSetData(-1, "Select zones on the Routes tab." & @CRLF & "Route display is scrollable.")

Global $grpCompleted = GUICtrlCreateGroup("", 850, 286, 244, 118)
Global $hdrCompleted = _Vanquisher_CreateCardHeader("COMPLETED CAMPAIGNS", 850, 286, 244)
Global $chkDoneProp = GUICtrlCreateCheckbox("Prophecies Vanquisher", 868, 318, 205, 18)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $chkDoneFac = GUICtrlCreateCheckbox("Factions Vanquisher", 868, 342, 205, 18)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $chkDoneNF = GUICtrlCreateCheckbox("Nightfall Vanquisher", 868, 366, 205, 18)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $chkDoneEotN = GUICtrlCreateCheckbox("EotN Vanquisher", 868, 390, 205, 18)
GUICtrlSetState(-1, $GUI_DISABLE)

Global $grpRecent = GUICtrlCreateGroup("", 850, 420, 244, 126)
Global $hdrRecent = _Vanquisher_CreateCardHeader("RECENT ACTIVITY", 850, 420, 244)
Global $lblRecentDone = GUICtrlCreateLabel("Completed: None", 868, 452, 205, 16)
Global $lblRecentSkip = GUICtrlCreateLabel("Skipped: None", 868, 476, 205, 16)
Global $lblRecentFail = GUICtrlCreateLabel("Last Fail: None", 868, 500, 205, 16)

Global $grpVanquish = GUICtrlCreateGroup("", 24, 466, 260, 104)
Global $hdrVanquish = _Vanquisher_CreateCardHeader("CURRENT ZONE", 24, 466, 260)
Global $lblKilled = GUICtrlCreateLabel("Killed", 44, 498, 90, 16)
Global $lblMissing = GUICtrlCreateLabel("Missing", 44, 522, 90, 16)
Global $lblTotalMobs = GUICtrlCreateLabel("Total Mobs", 44, 546, 90, 16)
Global $Tot_Killed = GUICtrlCreateLabel("0", 220, 498, 48, 16, $SS_RIGHT)
Global $Tot_Missing = GUICtrlCreateLabel("0", 220, 522, 48, 16, $SS_RIGHT)
Global $Tot_Total = GUICtrlCreateLabel("0", 220, 546, 48, 16, $SS_RIGHT)

; === Session tab ===
; GUICtrlCreateTabItem("Session") ; native tab removed
Global $grpSessionDetail = GUICtrlCreateGroup("", 24, 210, 520, 160)
Global $hdrSessionDetail = _Vanquisher_CreateCardHeader("SESSION OVERVIEW", 24, 210, 520)
Global $lblSessionRuntime = GUICtrlCreateLabel("Runtime: 00:00:00", 44, 242, 300, 18)
Global $lblSessionZones = GUICtrlCreateLabel("Zones Completed: 0", 44, 270, 300, 18)
Global $lblSessionDeaths = GUICtrlCreateLabel("Deaths: 0", 44, 298, 300, 18)
Global $lblSessionFails = GUICtrlCreateLabel("Fails: 0", 44, 326, 300, 18)
Global $RUN = GUICtrlCreateGroup("", 570, 210, 250, 160)
Global $hdrRuns = _Vanquisher_CreateCardHeader("RUNS", 570, 210, 250)
Global $lblTotalRuns = GUICtrlCreateLabel("Total Runs", 590, 242, 90, 17)
Global $gui_status_runs = GUICtrlCreateLabel("0", 760, 242, 40, 17, $SS_RIGHT)

; === Routes tab ===
; GUICtrlCreateTabItem("Routes") ; native tab removed
Global $grpRoutes = GUICtrlCreateGroup("", 24, 210, 1070, 370)
Global $hdrRoutes = _Vanquisher_CreateCardHeader("ZONE CHECKLIST", 24, 210, 1070)
$lvRoutes = GUICtrlCreateListView("Campaign|Zone", 36, 240, 1042, 320, BitOR($LVS_REPORT, $WS_VSCROLL, $WS_HSCROLL, $WS_BORDER))
_GUICtrlListView_SetExtendedListViewStyle($lvRoutes, BitOR($LVS_EX_CHECKBOXES, $LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES))
_Vanquisher_PopulateRouteList()

; === Settings tab ===
; GUICtrlCreateTabItem("Settings") ; native tab removed
Global $GENERAL = GUICtrlCreateGroup("", 24, 210, 300, 180)
Global $hdrGeneral = _Vanquisher_CreateCardHeader("GENERAL CONFIGURATOR", 24, 210, 300)
Global $Gui_HM_enable = GUICtrlCreateCheckbox("Hard Mode (HM)", 40, 236, 200, 18)
Global $Gui_Legio = GUICtrlCreateCheckbox("Use Stones", 40, 260, 200, 18)
Global $Gui_Bu = GUICtrlCreateCheckbox("Use BU", 40, 284, 200, 18)
Global $Gui_Conset = GUICtrlCreateCheckbox("Use Conset", 40, 308, 200, 18)
Global $Gui_OpenChests = GUICtrlCreateCheckbox("Open Chests", 40, 332, 200, 18)
Global $Gui_Donate = GUICtrlCreateCheckbox("Donate Faction", 40, 356, 200, 18)
GUICtrlSetTip($Gui_Donate, "Donate Luxon/Kurzick faction to your guild. Only used on Echovald Forest and Jade Sea maps.")

Global $Gui_AddHeroes = GUICtrlCreateCheckbox("Add Heroes", 340, 210, 120, 18)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
Global $Group2 = GUICtrlCreateGroup("", 340, 232, 340, 220)
Global $hdrHeroTeam = _Vanquisher_CreateCardHeader("HERO TEAM", 340, 232, 340)
Global $Hero1 = IniRead($iniHero, "Use Hero:", "1", "")
Global $COMBO_HERO1 = GUICtrlCreateCombo($Hero1, 352, 256, 310, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero2 = IniRead($iniHero, "Use Hero:", "2", "")
Global $COMBO_HERO2 = GUICtrlCreateCombo($Hero2, 352, 284, 310, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero3 = IniRead($iniHero, "Use Hero:", "3", "")
Global $COMBO_HERO3 = GUICtrlCreateCombo($Hero3, 352, 312, 310, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero4 = IniRead($iniHero, "Use Hero:", "4", "")
Global $COMBO_HERO4 = GUICtrlCreateCombo($Hero4, 352, 340, 310, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero5 = IniRead($iniHero, "Use Hero:", "5", "")
Global $COMBO_HERO5 = GUICtrlCreateCombo($Hero5, 352, 368, 310, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero6 = IniRead($iniHero, "Use Hero:", "6", "")
Global $COMBO_HERO6 = GUICtrlCreateCombo($Hero6, 352, 396, 310, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero7 = IniRead($iniHero, "Use Hero:", "7", "")
Global $COMBO_HERO7 = GUICtrlCreateCombo($Hero7, 352, 424, 310, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $GUISaveHeroButton = GUICtrlCreateButton("Save Heroes", 580, 460, 100, 25)
GUICtrlSetOnEvent($GUISaveHeroButton, "InitSave")

GUICtrlSetState($COMBO_HERO1, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO2, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO3, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO4, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO5, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO6, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO7, $GUI_DISABLE)

; === Logs tab ===
; GUICtrlCreateTabItem("Logs") ; native tab removed
Global $grpLogsTab = GUICtrlCreateGroup("", 24, 210, 1070, 370)
Global $hdrLogsTab = _Vanquisher_CreateCardHeader("EVENT LOG", 24, 210, 1070)
$edtSessionLog = GUICtrlCreateEdit("", 36, 240, 1042, 320, BitOR($ES_READONLY, $ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
GUICtrlSetData(-1, "Session log entries also appear in the Live Log panel below.")

; GUICtrlCreateTabItem("") ; native tab removed

; --- Live log (always visible) ---
Global $grpLiveLog = GUICtrlCreateGroup("", 24, 608, 1070, 132)
Global $hdrLiveLog = _Vanquisher_CreateCardHeader("LIVE LOG", 24, 608, 1070)
Global $StatusLabel = GUICtrlCreateEdit("", 38, 638, 1040, 80, BitOR($ES_READONLY, $ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))

Global $g_aPageMain[] = [$grpOverall, $hdrOverall, $lblOverallProgress, $progOverall, $lblOverallPct, $grpTitleProg, $hdrTitleProg, $lblProgProp, $progProp, $lblProgFac, $progFac, $lblProgNF, $progNF, $lblProgEotN, $progEotN, $lblProgTotal, $progTotal, $grpSession, $hdrSession, $lblRuntime, $lblZonesDone, $lblDeaths, $lblFails, $grpCharInfo, $hdrCharInfo, $lblCharName, $lblCharProf, $lblCharLevel, $lblCharTitle, $grpRoute, $hdrRoute, $edtRoutePreview, $grpCompleted, $chkDoneProp, $chkDoneFac, $chkDoneNF, $chkDoneEotN, $grpRecent, $hdrRecent, $lblRecentDone, $lblRecentSkip, $lblRecentFail, $grpVanquish, $hdrVanquish, $lblKilled, $lblMissing, $lblTotalMobs, $Tot_Killed, $Tot_Missing, $Tot_Total]
Global $g_aPageStats[] = [$grpSessionDetail, $hdrSessionDetail, $lblSessionRuntime, $lblSessionZones, $lblSessionDeaths, $lblSessionFails, $RUN, $hdrRuns, $lblTotalRuns, $gui_status_runs]
Global $g_aPageAreas[] = [$grpRoutes, $hdrRoutes, $lvRoutes]
Global $g_aPageOptions[] = [$GENERAL, $hdrGeneral, $Gui_HM_enable, $Gui_Legio, $Gui_Bu, $Gui_Conset, $Gui_OpenChests, $Gui_Donate, $Gui_AddHeroes, $Group2, $hdrHeroTeam, $COMBO_HERO1, $COMBO_HERO2, $COMBO_HERO3, $COMBO_HERO4, $COMBO_HERO5, $COMBO_HERO6, $COMBO_HERO7, $GUISaveHeroButton]
Global $g_aPageLogs[] = [$grpLogsTab, $hdrLogsTab, $edtSessionLog]
Global $g_sActivePage = "Main"

_Vanquisher_ApplyBlueTheme()
_Vanquisher_InitDashboardLabels()

GUISetOnEvent($GUI_EVENT_CLOSE, "gui_eventHandler")
GUIRegisterMsg($WM_NOTIFY, "_GUI_WM_NOTIFY")

GUICtrlSetState($Gui_HM_enable, $GUI_CHECKED)
GUICtrlSetState($Gui_Donate, $GUI_ENABLE)
GUICtrlSetState($chkOnTop, $GUI_CHECKED)
WinSetOnTop($Master_Vanquisher, "", $HWND_TOPMOST)
_Vanquisher_UpdateDonateCheckbox()
_Vanquisher_UpdateStatusBar()
_Vanquisher_ShowPage("Main")

GUISetState(@SW_SHOW)
Local $l_s_StartupNames = Gwen_GetCharNamesFromWindowsOnly()
If $l_s_StartupNames = "" Then $l_s_StartupNames = GetLoggedCharNames()
If $l_s_StartupNames <> "" Then
	_Vanquisher_SetCharacterCombo($l_s_StartupNames)
	CurrentAction("Characters: " & StringReplace($l_s_StartupNames, "|", ", "))
	_Vanquisher_SetConnectionStatus("READY")
ElseIf _Vanquisher_CountGWClients() > 0 Then
	CurrentAction("Guild Wars detected — click Refresh to load characters.")
Else
	CurrentAction("Start Guild Wars, log in, then click Refresh.")
EndIf
CurrentAction("Dashboard initialized.")
CurrentAction("Ready.")

#Region Theme and route helpers

Func _Vanquisher_StripCtrlTheme($hWnd)
	If Not IsHWnd($hWnd) Then Return
	DllCall("uxtheme.dll", "int", "SetWindowTheme", "hwnd", $hWnd, "wstr", "", "wstr", "")
EndFunc

Func _Vanquisher_StripCtrlThemeById($iCtrlID)
	If $iCtrlID = 0 Then Return
	Local $hWnd = GUICtrlGetHandle($iCtrlID)
	If $hWnd Then _Vanquisher_StripCtrlTheme($hWnd)
EndFunc

Func _Vanquisher_StyleLabel($a_i_Ctrl, $a_bMuted = False, $a_bPanelBg = False)
	_Vanquisher_StripCtrlThemeById($a_i_Ctrl)
	GUICtrlSetBkColor($a_i_Ctrl, $a_bPanelBg ? $GUI_CLR_PANEL : $GUI_CLR_BG)
	GUICtrlSetColor($a_i_Ctrl, $a_bMuted ? $GUI_CLR_MUTED : $GUI_CLR_TEXT)
EndFunc

Func _Vanquisher_StyleAccentLabel($a_i_Ctrl, $a_bPanelBg = False)
	_Vanquisher_StripCtrlThemeById($a_i_Ctrl)
	GUICtrlSetBkColor($a_i_Ctrl, $a_bPanelBg ? $GUI_CLR_PANEL : $GUI_CLR_BG)
	GUICtrlSetColor($a_i_Ctrl, $GUI_CLR_ACCENT)
EndFunc

Func _Vanquisher_StyleGroup($a_i_Ctrl)
	_Vanquisher_StripCtrlThemeById($a_i_Ctrl)
	GUICtrlSetBkColor($a_i_Ctrl, $GUI_CLR_PANEL)
	GUICtrlSetColor($a_i_Ctrl, $GUI_CLR_ACCENT)
EndFunc


Func _Vanquisher_CreateCardHeader($sText, $iX, $iY, $iW)
	Local $iCtrl = GUICtrlCreateLabel("  " & $sText, $iX + 10, $iY + 8, $iW - 20, 20)
	GUICtrlSetFont($iCtrl, 9, 700, 0, "Segoe UI")
	GUICtrlSetBkColor($iCtrl, $GUI_CLR_HEADER)
	GUICtrlSetColor($iCtrl, $GUI_CLR_TEXT)
	Return $iCtrl
EndFunc

Func _Vanquisher_StyleCardHeader($a_i_Ctrl)
	_Vanquisher_StripCtrlThemeById($a_i_Ctrl)
	GUICtrlSetBkColor($a_i_Ctrl, $GUI_CLR_HEADER)
	GUICtrlSetColor($a_i_Ctrl, $GUI_CLR_TEXT)
	GUICtrlSetFont($a_i_Ctrl, 9, 700, 0, "Segoe UI")
EndFunc

Func _Vanquisher_StyleInput($a_i_Ctrl)
	_Vanquisher_StripCtrlThemeById($a_i_Ctrl)
	GUICtrlSetBkColor($a_i_Ctrl, $GUI_CLR_INPUT)
	GUICtrlSetColor($a_i_Ctrl, $GUI_CLR_TEXT)
	GUICtrlSetFont($a_i_Ctrl, 9, 400, 0, "Segoe UI")
EndFunc

Func _Vanquisher_StyleButton($a_i_Ctrl)
	_Vanquisher_StripCtrlThemeById($a_i_Ctrl)
	GUICtrlSetBkColor($a_i_Ctrl, $GUI_CLR_INPUT)
	GUICtrlSetColor($a_i_Ctrl, $GUI_CLR_TEXT)
EndFunc

Func _Vanquisher_RGBToBGR($iRGB)
	Return BitOR(BitShift(BitAND($iRGB, 0x0000FF), -16), BitAND($iRGB, 0x00FF00), BitShift(BitAND($iRGB, 0xFF0000), 16))
EndFunc

Func _Vanquisher_StyleListView($iCtrlID)
	_Vanquisher_StripCtrlThemeById($iCtrlID)
	Local $hWnd = GUICtrlGetHandle($iCtrlID)
	If Not $hWnd Then Return
	GUICtrlSetBkColor($iCtrlID, $GUI_CLR_INPUT)
	GUICtrlSetColor($iCtrlID, $GUI_CLR_TEXT)
	; ListView UDF color messages use COLORREF (BGR), unlike normal GUICtrl colors.
	_GUICtrlListView_SetBkColor($hWnd, _Vanquisher_RGBToBGR($GUI_CLR_INPUT))
	_GUICtrlListView_SetTextBkColor($hWnd, _Vanquisher_RGBToBGR($GUI_CLR_INPUT))
	_GUICtrlListView_SetTextColor($hWnd, _Vanquisher_RGBToBGR($GUI_CLR_TEXT))
	_GUICtrlListView_SetOutlineColor($hWnd, _Vanquisher_RGBToBGR($GUI_CLR_BORDER))
	Local $hHeader = _GUICtrlListView_GetHeader($hWnd)
	If $hHeader Then _Vanquisher_StripCtrlTheme($hHeader)
EndFunc

Func _Vanquisher_ApplyBlueTheme()
	GUISetBkColor($GUI_CLR_BG, $Master_Vanquisher)

	; Paint every legacy/static control first so Windows does not leave
	; white default label rectangles behind the dashboard. Known inputs, groups,
	; buttons, and panels are styled again below.
	For $iCtrl = 1 To 1200
		GUICtrlSetBkColor($iCtrl, $GUI_CLR_BG)
		GUICtrlSetColor($iCtrl, $GUI_CLR_TEXT)
	Next

	Local $aAccent[] = [$lblHeader, $lblSubtitle, $lblStatusValue, $lblStatusTitle]
	For $i = 0 To UBound($aAccent) - 1
		_Vanquisher_StyleAccentLabel($aAccent[$i])
	Next
	_Vanquisher_StyleLabel($lblTagline, True)
	_Vanquisher_StyleLabel($lblVersion, True)
	_Vanquisher_StyleCardHeader($lblStatusBadge)

	Local $aLabels[] = [$lblStatusChar, $lblStatusCampaign, $lblStatusZone, $lblStatusQueue, _
		$lblOverallProgress, $lblOverallPct, $lblProgProp, $lblProgFac, $lblProgNF, $lblProgEotN, $lblProgTotal, _
		$lblRuntime, $lblZonesDone, $lblDeaths, $lblFails, $lblCharName, $lblCharProf, $lblCharLevel, $lblCharTitle, _
		$lblRecentDone, $lblRecentSkip, $lblRecentFail, $lblKilled, $lblMissing, $lblTotalMobs, $lblTotalRuns, $Tot_Killed, $Tot_Missing, $Tot_Total, _
		$lblSessionRuntime, $lblSessionZones, $lblSessionDeaths, $lblSessionFails, $gui_status_runs]
	For $i = 0 To UBound($aLabels) - 1
		_Vanquisher_StyleLabel($aLabels[$i], False, True)
		GUICtrlSetFont($aLabels[$i], 9, 400, 0, "Segoe UI")
	Next

	Local $aGroups[] = [$grpOverall, $grpTitleProg, $grpSession, $grpCharInfo, $grpRoute, $grpCompleted, $chkDoneProp, $chkDoneFac, $chkDoneNF, $chkDoneEotN, $grpRecent, $grpVanquish, _
		$grpSessionDetail, $RUN, $grpRoutes, $GENERAL, $Group2, $grpLogsTab, $grpLiveLog]
	For $i = 0 To UBound($aGroups) - 1
		_Vanquisher_StyleGroup($aGroups[$i])
	Next

	Local $aCardHeaders[] = [$hdrOverall, $hdrTitleProg, $hdrSession, $hdrCharInfo, $hdrRoute, $hdrCompleted, $hdrRecent, $hdrVanquish, $hdrSessionDetail, $hdrRuns, $hdrRoutes, $hdrGeneral, $hdrHeroTeam, $hdrLogsTab, $hdrLiveLog, $lblStatusBadge]
	For $i = 0 To UBound($aCardHeaders) - 1
		_Vanquisher_StyleCardHeader($aCardHeaders[$i])
	Next

	Local $aInputs[] = [$txtName, $edtRoutePreview, $StatusLabel, $edtSessionLog]
	For $i = 0 To UBound($aInputs) - 1
		_Vanquisher_StyleInput($aInputs[$i])
	Next

	Local $aButtons[] = [$btnRefreshChars, $btnAttach, $Start, $btnSaveQueue, $btnLoadQueue, $btnPause, $btnStop, $GUISaveHeroButton, _
		$btnPageMain, $btnPageStats, $btnPageAreas, $btnPageOptions, $btnPageLogs, $chkDoneProp, $chkDoneFac, $chkDoneNF, $chkDoneEotN, $chkOnTop, $chkDebug, $Gui_HM_enable, $Gui_Legio, $Gui_Bu, $Gui_Conset, $Gui_OpenChests, $Gui_Donate, $Gui_AddHeroes]
	For $i = 0 To UBound($aButtons) - 1
		_Vanquisher_StyleButton($aButtons[$i])
	Next

	Local $aCombos[] = [$COMBO_HERO1, $COMBO_HERO2, $COMBO_HERO3, $COMBO_HERO4, $COMBO_HERO5, $COMBO_HERO6, $COMBO_HERO7]
	For $i = 0 To UBound($aCombos) - 1
		_Vanquisher_StyleInput($aCombos[$i])
	Next

	Local $aProgress[] = [$progOverall, $progProp, $progFac, $progNF, $progEotN, $progTotal]
	For $i = 0 To UBound($aProgress) - 1
		_Vanquisher_StripCtrlThemeById($aProgress[$i])
		GUICtrlSetBkColor($aProgress[$i], $GUI_CLR_INPUT)
		GUICtrlSetColor($aProgress[$i], $GUI_CLR_ACCENT)
	Next

	_Vanquisher_StyleListView($lvRoutes)
	_Vanquisher_ShowPage("Main")
EndFunc

Func _Vanquisher_SetCtrlArrayState(ByRef $aCtrls, $iState)
	For $i = 0 To UBound($aCtrls) - 1
		If $aCtrls[$i] <> 0 Then GUICtrlSetState($aCtrls[$i], $iState)
	Next
EndFunc

Func _Vanquisher_ShowPage($sPage)
	_Vanquisher_SetCtrlArrayState($g_aPageMain, $GUI_HIDE)
	_Vanquisher_SetCtrlArrayState($g_aPageStats, $GUI_HIDE)
	_Vanquisher_SetCtrlArrayState($g_aPageAreas, $GUI_HIDE)
	_Vanquisher_SetCtrlArrayState($g_aPageOptions, $GUI_HIDE)
	_Vanquisher_SetCtrlArrayState($g_aPageLogs, $GUI_HIDE)

	Switch $sPage
		Case "Stats"
			_Vanquisher_SetCtrlArrayState($g_aPageStats, $GUI_SHOW)
		Case "Areas"
			_Vanquisher_SetCtrlArrayState($g_aPageAreas, $GUI_SHOW)
		Case "Options"
			_Vanquisher_SetCtrlArrayState($g_aPageOptions, $GUI_SHOW)
		Case "Logs"
			_Vanquisher_SetCtrlArrayState($g_aPageLogs, $GUI_SHOW)
		Case Else
			_Vanquisher_SetCtrlArrayState($g_aPageMain, $GUI_SHOW)
			$sPage = "Main"
	EndSwitch
	$g_sActivePage = $sPage
	GUICtrlSetBkColor($btnPageMain, ($sPage = "Main") ? $GUI_CLR_ACTIVE : $GUI_CLR_INPUT)
	GUICtrlSetBkColor($btnPageStats, ($sPage = "Stats") ? $GUI_CLR_ACTIVE : $GUI_CLR_INPUT)
	GUICtrlSetBkColor($btnPageAreas, ($sPage = "Areas") ? $GUI_CLR_ACTIVE : $GUI_CLR_INPUT)
	GUICtrlSetBkColor($btnPageOptions, ($sPage = "Options") ? $GUI_CLR_ACTIVE : $GUI_CLR_INPUT)
	GUICtrlSetBkColor($btnPageLogs, ($sPage = "Logs") ? $GUI_CLR_ACTIVE : $GUI_CLR_INPUT)
	GUICtrlSetColor($btnPageMain, $GUI_CLR_TEXT)
	GUICtrlSetColor($btnPageStats, $GUI_CLR_TEXT)
	GUICtrlSetColor($btnPageAreas, $GUI_CLR_TEXT)
	GUICtrlSetColor($btnPageOptions, $GUI_CLR_TEXT)
	GUICtrlSetColor($btnPageLogs, $GUI_CLR_TEXT)
EndFunc

Func _Vanquisher_TabClick()
	Switch @GUI_CtrlId
		Case $btnPageMain
			_Vanquisher_ShowPage("Main")
		Case $btnPageStats
			_Vanquisher_ShowPage("Stats")
		Case $btnPageAreas
			_Vanquisher_ShowPage("Areas")
		Case $btnPageOptions
			_Vanquisher_ShowPage("Options")
		Case $btnPageLogs
			_Vanquisher_ShowPage("Logs")
	EndSwitch
EndFunc

Func _Vanquisher_InitDashboardLabels()
	_Vanquisher_InitZones()
	Local $iTotal = $g_i_VanquisherZoneCount
	Local $iProp = _Vanquisher_CampaignZoneCount("Prophecies")
	Local $iFac = _Vanquisher_CampaignZoneCount("Factions")
	Local $iNF = _Vanquisher_CampaignZoneCount("Nightfall")
	Local $iEotN = _Vanquisher_CampaignZoneCount("EotN")
	GUICtrlSetData($lblOverallProgress, "0 / " & $iTotal & " Zones Completed")
	GUICtrlSetData($lblProgProp, "Prophecies: 0 / " & $iProp)
	GUICtrlSetData($lblProgFac, "Factions: 0 / " & $iFac)
	GUICtrlSetData($lblProgNF, "Nightfall: 0 / " & $iNF)
	GUICtrlSetData($lblProgEotN, "EotN: 0 / " & $iEotN)
	GUICtrlSetData($lblProgTotal, "Total: 0 / " & $iTotal)
EndFunc

Func _Vanquisher_PopulateRouteList()
	_Vanquisher_InitZones()
	_GUICtrlListView_BeginUpdate($lvRoutes)
	_GUICtrlListView_DeleteAllItems($lvRoutes)
	For $i = 0 To $g_i_VanquisherZoneCount - 1
		Local $iItem = _GUICtrlListView_AddItem($lvRoutes, _Vanquisher_ZoneCampaign($i), -1, $i + 1000)
		_GUICtrlListView_SetItem($lvRoutes, _Vanquisher_ZoneDisplay($i), $iItem, 1)
	Next
	_GUICtrlListView_SetColumnWidth($lvRoutes, 0, 120)
	_GUICtrlListView_SetColumnWidth($lvRoutes, 1, 780)
	_GUICtrlListView_EndUpdate($lvRoutes)
	_Vanquisher_StyleListView($lvRoutes)
EndFunc

Func _Vanquisher_ListViewZoneIndex($a_i_Item)
	Return _GUICtrlListView_GetItemParam($lvRoutes, $a_i_Item) - 1000
EndFunc

Func _Vanquisher_GetCheckedZoneIndexes()
	Local $aResult[0]
	Local $iCount = _GUICtrlListView_GetItemCount($lvRoutes)
	For $i = 0 To $iCount - 1
		If _GUICtrlListView_GetItemState($lvRoutes, $i, $LVIS_STATEIMAGEMASK) = 8192 Then
			_ArrayAdd($aResult, _Vanquisher_ListViewZoneIndex($i))
		EndIf
	Next
	Return $aResult
EndFunc

Func _Vanquisher_GetFirstCheckedZoneTitle()
	Local $aChecked = _Vanquisher_GetCheckedZoneIndexes()
	If UBound($aChecked) = 0 Then Return ""
	Return _Vanquisher_ZoneTitle($aChecked[0])
EndFunc

Func _Vanquisher_GetCheckedZoneCount()
	Return UBound(_Vanquisher_GetCheckedZoneIndexes())
EndFunc

Func _Vanquisher_IsFactionMapSelected()
	Local $aChecked = _Vanquisher_GetCheckedZoneIndexes()
	For $i = 0 To UBound($aChecked) - 1
		If _Vanquisher_ZoneIsFaction($aChecked[$i]) Then Return True
	Next
	Return False
EndFunc

Func _Vanquisher_UpdateDonateCheckbox()
	GUICtrlSetState($Gui_Donate, $GUI_ENABLE)
	If Not _Vanquisher_IsFactionMapSelected() Then
		GUICtrlSetState($Gui_Donate, $GUI_UNCHECKED)
	EndIf
EndFunc

Func _Vanquisher_UpdateStatusBar()
	Local $sChar = GUICtrlRead($txtName)
	If $sChar = "" Then $sChar = "None"
	GUICtrlSetData($lblStatusChar, $sChar)

	Local $iQueue = _Vanquisher_GetCheckedZoneCount()
	GUICtrlSetData($lblStatusQueue, $iQueue & " zone" & ($iQueue = 1 ? "" : "s"))

	Local $aChecked = _Vanquisher_GetCheckedZoneIndexes()
	If UBound($aChecked) > 0 Then
		Local $iIdx = $aChecked[0]
		GUICtrlSetData($lblStatusCampaign, _Vanquisher_ZoneCampaign($iIdx))
		GUICtrlSetData($lblStatusZone, _Vanquisher_ZoneDisplay($iIdx))
	Else
		GUICtrlSetData($lblStatusCampaign, "None")
		GUICtrlSetData($lblStatusZone, "None")
	EndIf
	_Vanquisher_UpdateRoutePreview()
EndFunc

Func _Vanquisher_UpdateRoutePreview()
	Local $aChecked = _Vanquisher_GetCheckedZoneIndexes()
	If UBound($aChecked) = 0 Then
		GUICtrlSetData($edtRoutePreview, "Select zones on the Routes tab." & @CRLF & "Route display is scrollable.")
		Return
	EndIf
	Local $sRoute = ""
	For $i = 0 To UBound($aChecked) - 1
		If $i > 0 Then $sRoute &= @CRLF
		$sRoute &= "-> " & _Vanquisher_ZoneDisplay($aChecked[$i])
	Next
	GUICtrlSetData($edtRoutePreview, $sRoute)
EndFunc

Func _Vanquisher_SetRoutesEnabled($a_bEnable)
	Local $iState = $a_bEnable ? $GUI_ENABLE : $GUI_DISABLE
	GUICtrlSetState($lvRoutes, $iState)
EndFunc

Func _GUI_WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	Local $tNMHDR = DllStructCreate("hwnd hWndFrom;uint_ptr IDFrom;int Code", $lParam)
	If DllStructGetData($tNMHDR, "hWndFrom") = GUICtrlGetHandle($lvRoutes) Then
		If DllStructGetData($tNMHDR, "Code") = $LVN_ITEMCHANGED Then
			_Vanquisher_UpdateDonateCheckbox()
			_Vanquisher_UpdateStatusBar()
		EndIf
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc

#EndRegion

Func gui_eventHandler()
	Switch @GUI_CtrlId
		Case $Gui_AddHeroes
			$Bool_AddHeroes = Not $Bool_AddHeroes
			GUICtrlSetState($COMBO_HERO1, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO2, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO3, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO4, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO5, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO6, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO7, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)

		Case $chkOnTop
			If BitAND(GUICtrlRead($chkOnTop), $GUI_CHECKED) = $GUI_CHECKED Then
				WinSetOnTop($Master_Vanquisher, "", $HWND_TOPMOST)
			Else
				WinSetOnTop($Master_Vanquisher, "", $HWND_NOTOPMOST)
			EndIf

		Case $GUI_EVENT_CLOSE
			Exit

		Case $Start
			$Title = _Vanquisher_GetFirstCheckedZoneTitle()
			If $Title = "" Then
				MsgBox(48, "Master Vanquisher Reforged", "No zone selected. Check at least one zone on the Routes tab.")
				Return
			EndIf

			If GUICtrlRead($txtName) = "" Then
				MsgBox(48, "Master Vanquisher Reforged", "Please select your character.")
				Return
			EndIf

			If _Vanquisher_IsAttached() = False Then
				If _Vanquisher_AttachToCharacter(GUICtrlRead($txtName)) = False Then
					MsgBox(48, "Master Vanquisher Reforged", "Can't find a Guild Wars client with that character name.")
					Return
				EndIf
			EndIf

			$Bool_Donate = False
			$Bool_HM = False
			$Bool_OpenChests = False
			$Bool_Conset = False
			$Bool_Bu = False
			$Bool_Stones = False
			If BitAND(GUICtrlRead($Gui_HM_enable), $GUI_CHECKED) = $GUI_CHECKED Then $Bool_HM = True
			If BitAND(GUICtrlRead($Gui_Donate), $GUI_CHECKED) = $GUI_CHECKED Then $Bool_Donate = True
			If BitAND(GUICtrlRead($Gui_OpenChests), $GUI_CHECKED) = $GUI_CHECKED Then $Bool_OpenChests = True
			If BitAND(GUICtrlRead($Gui_Conset), $GUI_CHECKED) = $GUI_CHECKED Then $Bool_Conset = True
			If BitAND(GUICtrlRead($Gui_Bu), $GUI_CHECKED) = $GUI_CHECKED Then $Bool_Bu = True
			If BitAND(GUICtrlRead($Gui_Legio), $GUI_CHECKED) = $GUI_CHECKED Then $Bool_Stones = True

			_Vanquisher_SetRoutesEnabled(False)
			GUICtrlSetState($Gui_HM_enable, $GUI_DISABLE)
			GUICtrlSetState($Gui_Donate, $GUI_DISABLE)
			GUICtrlSetState($Gui_Bu, $GUI_DISABLE)
			GUICtrlSetState($Gui_Conset, $GUI_DISABLE)
			GUICtrlSetState($Gui_Legio, $GUI_DISABLE)
			GUICtrlSetState($Start, $GUI_DISABLE)
			GUICtrlSetState($txtName, $GUI_DISABLE)

			_Vanquisher_SetConnectionStatus("RUNNING")
			GUICtrlSetData($lblCharName, "Name: " & GUICtrlRead($txtName))

			$NumberRun = 0
			$RunSuccess = 0
			$boolrun = True

			$sGW = "Guild Wars - " & GUICtrlRead($txtName)
			AdlibRegister("ReduceMemory", 20000)
			AdlibRegister("UpdateVanquish", 5000)
			AdlibRegister("CheckDeath", 1000)
	EndSwitch
EndFunc

Func _Vanquisher_SetCharacterCombo($a_s_Names, $a_s_Preferred = "")
	$a_s_Names = StringStripWS($a_s_Names, 3)
	GUICtrlSetData($txtName, $a_s_Names)

	Local $l_s_Select = StringStripWS($a_s_Preferred, 3)
	If $l_s_Select = "" Then $l_s_Select = _Vanquisher_LoadLastCharacter()
	If $l_s_Select <> "" And $a_s_Names <> "" Then
		Local $aParts = StringSplit($a_s_Names, "|")
		Local $l_b_Found = False
		For $i = 1 To $aParts[0]
			If StringCompare($aParts[$i], $l_s_Select, 0) = 0 Then
				$l_b_Found = True
				ExitLoop
			EndIf
		Next
		If Not $l_b_Found Then $l_s_Select = $aParts[1]
	ElseIf $a_s_Names <> "" Then
		Local $aParts = StringSplit($a_s_Names, "|")
		If $aParts[0] >= 1 Then $l_s_Select = $aParts[1]
	EndIf

	If $l_s_Select <> "" Then
		If Not ControlCommand($Master_Vanquisher, "", $txtName, "SelectString", $l_s_Select) Then
			ControlSetText($Master_Vanquisher, "", $txtName, $l_s_Select)
		EndIf
	EndIf

	_Vanquisher_UpdateStatusBar()
EndFunc

Func _Vanquisher_SetConnectionStatus($a_s_Status)
	GUICtrlSetData($lblStatusValue, $a_s_Status)
	Switch StringUpper($a_s_Status)
		Case "RUNNING"
			GUICtrlSetColor($lblStatusValue, $GUI_CLR_ACCENT)
		Case "ATTACHED", "READY"
			GUICtrlSetColor($lblStatusValue, $GUI_CLR_TEXT)
		Case Else
			GUICtrlSetColor($lblStatusValue, $GUI_CLR_MUTED)
	EndSwitch
EndFunc

Func AttachToGuildWars()
	Local $l_s_Char = GUICtrlRead($txtName)
	If $l_s_Char = "" Then
		MsgBox(48, "Master Vanquisher Reforged", "Select or type your character name first, then click Attach.")
		Return
	EndIf

	If _Vanquisher_AttachToCharacter($l_s_Char) Then
		_Vanquisher_SetConnectionStatus("ATTACHED")
		GUICtrlSetData($lblCharName, "Name: " & $l_s_Char)
		$sGW = "Guild Wars - " & $l_s_Char
		CurrentAction("Attached to " & $l_s_Char & ". Select zones on Routes, then click Start Vanquishing.")
		Return
	EndIf

	_Vanquisher_SetConnectionStatus("WAITING FOR ATTACH")
	Local $l_s_MemoryNames = _Vanquisher_GetMemoryCharNames()
	Local $l_s_Msg = "Could not attach to '" & $l_s_Char & "'."
	If $l_s_MemoryNames <> "" Then
		$l_s_Msg &= @CRLF & @CRLF & "Characters found in Guild Wars memory:" & @CRLF & StringReplace($l_s_MemoryNames, "|", @CRLF)
		$l_s_Msg &= @CRLF & @CRLF & "Select one of those names and click Attach again."
	Else
		$l_s_Msg &= @CRLF & @CRLF & "No character name could be read from memory." & @CRLF & "Log fully into a character in-game, click Refresh, then Attach."
	EndIf
	CurrentAction("Could not attach to '" & $l_s_Char & "'. See live log for details.")
	MsgBox(48, "Master Vanquisher Reforged", $l_s_Msg)
EndFunc

Func RefreshCharNames()
	Local $l_s_Names = GetLoggedCharNames()

	If $l_s_Names <> "" Then
		_Vanquisher_SetCharacterCombo($l_s_Names)
		CurrentAction("Characters: " & StringReplace($l_s_Names, "|", ", "))
		If Not _Vanquisher_IsAttached() Then _Vanquisher_SetConnectionStatus("READY")
		Return
	EndIf

	Local $l_i_GWCount = _Vanquisher_CountGWClients()

	If $l_i_GWCount = 0 Then
		_Vanquisher_SetCharacterCombo("")
		CurrentAction("No Guild Wars client found. Start Guild Wars, log in, then click Refresh.")
		Return
	EndIf

	_Vanquisher_SetCharacterCombo("")
	CurrentAction("Found " & $l_i_GWCount & " Guild Wars client(s), but could not read character names. Type the name manually, or reach character select / in-game and click Refresh. Window: " & _Vanquisher_GetGwWindowTitles())
EndFunc

Func UpdateVanquish()
	Local $l_i_Killed = GetFoesKilled()
	Local $l_i_Missing = GetFoesToKill()
	GUICtrlSetData($Tot_Killed, $l_i_Killed)
	If $l_i_Missing < 0 Then
		GUICtrlSetData($Tot_Missing, "?")
		GUICtrlSetData($Tot_Total, "?")
	ElseIf $l_i_Missing = 0 And GetAreaVanquished() Then
		GUICtrlSetData($Tot_Missing, "0")
		GUICtrlSetData($Tot_Total, $l_i_Killed)
	Else
		GUICtrlSetData($Tot_Missing, $l_i_Missing)
		GUICtrlSetData($Tot_Total, $l_i_Killed + $l_i_Missing)
	EndIf
EndFunc

Func ReduceMemory()
	$hWnd = WinGetHandle($sGW)
	If WinExists($hWnd) Then
		$pid = WinGetProcess($hWnd)
		$Pr_Handle = DllCall("kernel32.dll", "int", "OpenProcess", "int", 0x1F0FFF, "int", False, "int", $pid)
		DllCall("psapi.dll", "int", "EmptyWorkingSet", "long", $Pr_Handle[0])
		DllCall("kernel32.dll", "int", "CloseHandle", "int", $Pr_Handle[0])
	EndIf
EndFunc

Func _Vanquisher_SetHeaderStatus($sText)
	Local $sLower = StringLower($sText)
	Local $sBadge = "IDLE"
	If StringInStr($sLower, "fight") Or StringInStr($sLower, "combat") Then
		$sBadge = "COMBAT"
	ElseIf StringInStr($sLower, "load") Or StringInStr($sLower, "travel") Or StringInStr($sLower, "portal") Then
		$sBadge = "TRAVEL"
	ElseIf StringInStr($sLower, "vanquish") Or StringInStr($sLower, "route") Then
		$sBadge = "VANQUISH"
	ElseIf StringInStr($sLower, "ready") Or StringInStr($sLower, "waiting") Or StringInStr($sLower, "attach") Then
		$sBadge = "IDLE"
	EndIf
	GUICtrlSetData($lblStatusBadge, $sBadge)
EndFunc

Func CurrentAction($TEXT)
	_Vanquisher_SetHeaderStatus($TEXT)
	Local $TEXTLEN = StringLen($TEXT)
	Local $CONSOLELEN = _GUICtrlEdit_GetTextLen($StatusLabel)
	If $TEXTLEN + $CONSOLELEN > 30000 Then GUICtrlSetData($StatusLabel, StringRight(_GUICtrlEdit_GetText($StatusLabel), 30000 - $TEXTLEN - 1000))
	_GUICtrlEdit_AppendText($StatusLabel, @CRLF & "[" & @HOUR & ":" & @MIN & "] " & $TEXT)
	_GUICtrlEdit_Scroll($StatusLabel, 1)
	_GUICtrlEdit_AppendText($edtSessionLog, @CRLF & "[" & @HOUR & ":" & @MIN & "] " & $TEXT)
	_GUICtrlEdit_Scroll($edtSessionLog, 1)
EndFunc

Func WaitForLoad()
	CurrentAction("Loading zone")
	InitMapLoad()
	$deadlock = 0
	Sleep(100)
	Do
		Sleep(100)
		$deadlock += 100
		$load = GetMapLoading()
		$lMe = GetAgentByID(-2)
	Until $load = 2 And DllStructGetData($lMe, "X") = 0 And DllStructGetData($lMe, "Y") = 0 Or $deadlock > 1000

	$deadlock = 0
	Do
		Sleep(100)
		$deadlock += 100
		$deadlock += 100
		$load = GetMapLoading()
		$lMe = GetAgentByID(-2)
	Until $load <> 2 And DllStructGetData($lMe, "X") <> 0 And DllStructGetData($lMe, "Y") <> 0 Or $deadlock > 3000
	CurrentAction("Load complete")
	Sleep(1000)
EndFunc
