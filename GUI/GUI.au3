
Global $strName = ""
Global $NumberRun = 0
global $boolrun = False
Global $coords[2]
Global $Title, $sGW
Global $Bool_Donate = False, $Bool_HM = False, $Bool_AddHeroes = False, $Bool_Bu = False, $Bool_Stones = False
Global $Bool_OpenChests = False, $Bool_Conset = False
Global $File = @ScriptDir & "\Trace\Tra a du " & @MDAY & "-" & @MON & " a " & @HOUR & "h et " & @MIN & "minutes.txt"
If Not FileExists(@ScriptDir & "\Trace") Then DirCreate(@ScriptDir & "\Trace")
$g_s_LogFile = $File
Global $iniHero = @ScriptDir&"\Hero.ini"

Opt("GUIOnEventMode", 1)

#Region ### START Koda GUI section ### Form=c:\users\matte\desktop\gw\koda_1.7.3.0\definitive bible.kxf

$Master_Vanquisher = GUICreate("Master Vanquisher Reforged", 1315, 685, 63, 117)

;START
$Start = GUICtrlCreateButton("START VANQUISHING", 1140, 414, 155, 73)

;ASCALON AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_AscalonFoothills = GUICtrlCreateRadio("ASCALON FOOTHILS", 13, 25, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DiessaLowlands = GUICtrlCreateRadio("DIESSA LOWLANDS", 13, 41, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DragonsGullet = GUICtrlCreateRadio("DRAGON'S GULLET", 13, 57, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_EasternFrontier = GUICtrlCreateRadio("EASTERN FRONTIER", 13, 73, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_FlameTempleCorridor = GUICtrlCreateRadio("FLAME TEMPLE CORRIDOR", 13, 89, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_OldAscalon = GUICtrlCreateRadio("OLD ASCALON", 13, 105, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_PockmarkFlats = GUICtrlCreateRadio("POCKMARK FLATS", 13, 121, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_RegentValley = GUICtrlCreateRadio("REGENT VALLEY", 13, 137, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheBreach = GUICtrlCreateRadio("THE BREACH", 13, 153, 145, 17)
;NORTHERN SHIVERPEAKS AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_AnvilRock = GUICtrlCreateRadio("ANVIL ROCK", 13, 201, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DeldrimorBowl = GUICtrlCreateRadio("DELDRIMOR BOWL", 13, 217, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_GriffonsMouth = GUICtrlCreateRadio("GRIFFON'S MOUTH", 13, 233, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_IronHorseMine = GUICtrlCreateRadio("IRON HORSE MINE", 13, 249, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TravelersVale = GUICtrlCreateRadio("TRAVELER'S VALE", 13, 265, 141, 17)
;MAGUUMA AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DryTop = GUICtrlCreateRadio("DRY TOP", 13, 313, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_EttinsBack = GUICtrlCreateRadio("ETTIN'S BACK", 13, 329, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MamnoonLagoon = GUICtrlCreateRadio("MAMNOON LAGOON", 13, 345, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ReedBog = GUICtrlCreateRadio("REED BOG", 13, 361, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_Silverwood = GUICtrlCreateRadio("SILVERWOOD", 13, 377, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SageLands = GUICtrlCreateRadio("SAGE LANDS", 13, 393, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TangleRoot = GUICtrlCreateRadio("TANGLE ROOT", 13, 409, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheFalls = GUICtrlCreateRadio("THE FALLS", 13, 425, 145, 17)
;CRYSTAL DESERT AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DivinersAscent = GUICtrlCreateRadio("DIVINER'S ASCENT", 13, 489, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ProphetsPath = GUICtrlCreateRadio("PROPHET PATH", 13, 505, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SaltFlats = GUICtrlCreateRadio("SALT FLATS", 13, 521, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SkywardReach = GUICtrlCreateRadio("SKYWARD REACH", 13, 537, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheAridSea = GUICtrlCreateRadio("THE ARID SEA", 13, 553, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheScar = GUICtrlCreateRadio("THE SCAR", 13, 569, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_VultureDrifts = GUICtrlCreateRadio("VULTURE DRIFTS", 13, 585, 141, 17)
;KRYTA AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_CursedLands = GUICtrlCreateRadio("CURSED LANDS", 176, 25, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_KessexPeak = GUICtrlCreateRadio("KESSEX PEAK", 176, 41, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MajestysRest = GUICtrlCreateRadio("MAJESTY'S REST", 176, 57, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_NeboTerrace = GUICtrlCreateRadio("NEBO TERRACE", 176, 73, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_NorthKrytaProvince = GUICtrlCreateRadio("NORTH KRYTA PROVINCE", 176, 89, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ScoundrelsRise = GUICtrlCreateRadio("SCOUNDREL'S RISE", 176, 105, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_StingrayStrand = GUICtrlCreateRadio("STINGRAY STRAND", 176, 121, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TalmarkWilderness = GUICtrlCreateRadio("TALMARK WILDERNESS", 176, 137, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TearsoftheFallen = GUICtrlCreateRadio("TEARS OF THE FALLEN", 176, 153, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheBlackCurtain = GUICtrlCreateRadio("THE BLACK CURTAIN", 176, 169, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TwinSerpentLakes = GUICtrlCreateRadio("TWIN SERPENT LAKES", 176, 185, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_WatchtowerCoast = GUICtrlCreateRadio("WATCHTOWER COAST", 176, 201, 145, 17)
;SOUTHERN SHIVERPEAKS AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DreadnoughtsDrift = GUICtrlCreateRadio("DREADNOUGHT'S DRIFTS", 176, 249, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_FrozenForest = GUICtrlCreateRadio("FROZEN FOREST", 176, 265, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_GrenthsFootprint = GUICtrlCreateRadio("GRENTH'S FOOTPRINT", 176, 281, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_IceFloe = GUICtrlCreateRadio("ICE FLOE", 176, 297, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_Icedome = GUICtrlCreateRadio("ICEDOME", 176, 313, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_LornarsPass = GUICtrlCreateRadio("LORNAR'S PASS", 176, 329, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MineralSprings = GUICtrlCreateRadio("MINERAL SPRINGS", 176, 345, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SnakeDance = GUICtrlCreateRadio("SNAKE DANCE", 176, 361, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SpearheadPeak = GUICtrlCreateRadio("SPEARHEAD PEAK", 176, 377, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TalusChute = GUICtrlCreateRadio("TALUS CHUTE", 176, 393, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TascasDemise = GUICtrlCreateRadio("TASCA DEMISE", 176, 409, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_WitmansFolly = GUICtrlCreateRadio("WITMAN'S FOLLY", 176, 425, 145, 17)
;RING OF FIRE AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_PerditionRock = GUICtrlCreateRadio("PERDITION ROCK", 176, 473, 145, 17)
;SHING JEA AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_HaijuLagoon = GUICtrlCreateRadio("HAIJU LAGOON", 340, 25, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_JayaBluffs = GUICtrlCreateRadio("JAYA BUFFS", 340, 41, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_KinyaProvince = GUICtrlCreateRadio("KINYA PROVINCE", 340, 57, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MinisterChosEstate = GUICtrlCreateRadio("MINISTER'S CHO ESTATE", 340, 73, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_PanjiangPeninsula = GUICtrlCreateRadio("PANJIANG PENINSULA", 340, 89, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SaoshangTrail = GUICtrlCreateRadio("SAOSHANG TRAIL", 340, 105, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SunquaVale = GUICtrlCreateRadio("SUNQUA VALE", 340, 121, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ZenDaijun = GUICtrlCreateRadio("ZEN DAIJUN", 340, 137, 141, 17)
;KAINENG CITY AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_BukdekByway = GUICtrlCreateRadio("BUKDEK BYWAY", 340, 190, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_NahpuiQuarter = GUICtrlCreateRadio("NAHPUI QUARTER", 340, 206, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_PongmeiValley = GUICtrlCreateRadio("PONGMEI VALLEY", 340, 222, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_RaisuPalace = GUICtrlCreateRadio("RAISU PALACE", 340, 238, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ShadowsPassage = GUICtrlCreateRadio("SHADOW'S PASSAGE", 340, 254, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ShenzunTunnels = GUICtrlCreateRadio("SHENZUN TUNNEL", 340, 270, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SunjiangDistrict = GUICtrlCreateRadio("SUNJIANG DISTRICT", 340, 286, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TahnnakiTemple = GUICtrlCreateRadio("TAHNNAKAI TEMPLE", 340, 302, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_WajjunBazaar = GUICtrlCreateRadio("WAJJUN BAZAAR", 340, 318, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_XaquangSkyway = GUICtrlCreateRadio("XAQUANG SKYWAY", 340, 334, 141, 17)
;ECHOVALD FOREST AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_Arborstone = GUICtrlCreateRadio("ARBORSTONE", 340, 377, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DrazachThicket = GUICtrlCreateRadio("DRAZACH TICKET", 340, 393, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_Ferndale = GUICtrlCreateRadio("FERNDALE", 340, 409, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MelandrusHope = GUICtrlCreateRadio("MELANDRU'S HOPE", 340, 425, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MorostavTrail = GUICtrlCreateRadio("MOROSTAV TRAIL", 340, 441, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MourningVeilFalls = GUICtrlCreateRadio("MOURNING VEIL FALLS", 340, 457, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheEternalGrove = GUICtrlCreateRadio("THE ETERNAL GROVE", 340, 473, 141, 17)
;THE JADE SEA AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_Archipelagos = GUICtrlCreateRadio("ARCHIPELAGOS", 340, 521, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_BoreasSeabed = GUICtrlCreateRadio("BOREAS SEABED", 340, 537, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_GyalaHatchery = GUICtrlCreateRadio("GYALA HATCHERY", 340, 553, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MaishangHills = GUICtrlCreateRadio("MAISHANG HILLS", 340, 569, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MountQinkai = GUICtrlCreateRadio("MOUNT QINKAI", 340, 585, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_RheasCrater = GUICtrlCreateRadio("RHEA'S CRATER", 340, 601, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SilentSurf = GUICtrlCreateRadio("SILENT SURF", 340, 617, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_UnwakingWaters = GUICtrlCreateRadio("UNWAKING WATER", 340, 633, 141, 17)
;ISTAN AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_CliffsOfDohjok = GUICtrlCreateRadio("CLIFFS OF DOHJOK", 502, 26, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_FahranurTheFirstCity = GUICtrlCreateRadio("FAHRANUR, THE FIRST CITY", 502, 42, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_IssnurIsles = GUICtrlCreateRadio("ISSNUR ISLES", 502, 58, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_LahtendaBog = GUICtrlCreateRadio("LAHTENDA BOG", 502, 74, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MehtaniKeys = GUICtrlCreateRadio("MEHTANI KEYS", 502, 90, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_PlainsofJarin = GUICtrlCreateRadio("PLAINS OF JARIN", 502, 106, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ZehlonReach = GUICtrlCreateRadio("ZEHLON REACH", 502, 122, 255, 17)
;KOURNA AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ArkjokWard = GUICtrlCreateRadio("ARKJOK WARD", 502, 170, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_BahdokCaverns = GUICtrlCreateRadio("BAHDOK CAVERNS", 502, 186, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_BarbarousShore = GUICtrlCreateRadio("BARBAROUS SHORE", 502, 202, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DejarinEstate = GUICtrlCreateRadio("DEJARIN ESTATE", 502, 218, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_GandaraTheMoonFortress = GUICtrlCreateRadio("GANDARA THE MOON FORTRESS", 502, 234, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_JahaiBluffs = GUICtrlCreateRadio("JAHAI BLUFFS", 502, 250, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MargaCoast = GUICtrlCreateRadio("MARGA COAST", 502, 266, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SunwardMarches = GUICtrlCreateRadio("SUNWARD MARCHES", 502, 282, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheFloodplainOfMahnkelon = GUICtrlCreateRadio("THE FLOODPLAIN OF MAHNKELON", 502, 298, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TuraisProcession = GUICtrlCreateRadio("TURAI'S PROCESSION", 502, 314, 255, 17)
;VABBI AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ForumHighlands = GUICtrlCreateRadio("FORUM HIGHLANDS", 502, 362, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_GardenOfSeborhin = GUICtrlCreateRadio("GARDEN OF SEBORHIN", 502, 378, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_HoldingsOfChokhin = GUICtrlCreateRadio("HOLDINGS OF CHOKHIN", 502, 394, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ResplendentMakuun = GUICtrlCreateRadio("RESPLENDENT MAKUUN", 502, 410, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheHiddenCityOfAhdashim = GUICtrlCreateRadio("THE HIDDEN CITY OF AHDASHIM", 502, 426, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheMirrorOfLyss = GUICtrlCreateRadio("THE MIRROR OF LYSS", 502, 442, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_VehjinMines = GUICtrlCreateRadio("VEHJIN MINES", 502, 458, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_VehtendiValley = GUICtrlCreateRadio("VEHTENDI VALLEY", 502, 474, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_WildernessOfBahdza = GUICtrlCreateRadio("WILDERNESS OF BAHZDA", 502, 490, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_YatendiCanyons = GUICtrlCreateRadio("YATENDI CANYONS", 502, 506, 255, 17)
;THE DESOLATION AREAS
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_CrystalOverlook = GUICtrlCreateRadio("CRYSTAL OVERLOOK", 502, 550, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_JokosDomain = GUICtrlCreateRadio("JOKO'S DOMAIN", 502, 566, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_PoisonedOutcrops = GUICtrlCreateRadio("POISONED OUTCROPS", 502, 582, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheAlkaliPan = GUICtrlCreateRadio("THE ALKALI PAN", 502, 598, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheRupturedHeart = GUICtrlCreateRadio("THE RUPTURED HEART", 502, 614, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheShatteredRavines = GUICtrlCreateRadio("THE SHATTERED RAVINES", 502, 630, 255, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_TheSulfurousWastes = GUICtrlCreateRadio("THE SULFUROUS WASTES", 502, 646, 255, 17)
;CHARR HOMELANDS AREAS VANGUARD
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DaladaUplands = GUICtrlCreateRadio("DALADA UPLANDS", 787, 26, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_GrothmarWardowns = GUICtrlCreateRadio("GROTHMAR WARDOWNS", 787, 42, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SacnothValley = GUICtrlCreateRadio("SACNOTH VALLEY", 787, 58, 145, 17)
;FAR SHIVERPEAKS AREAS NORN
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_BjoraMarches = GUICtrlCreateRadio("BJORA MARCHES", 785, 101, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_DrakkarLake = GUICtrlCreateRadio("DRAKKAR LAKE", 785, 117, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_IceCliffChasms = GUICtrlCreateRadio("ICE CLIFF CHASM", 785, 133, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_JagaMoraine = GUICtrlCreateRadio("JAGA MORAINE", 785, 149, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_NorrhartDomains = GUICtrlCreateRadio("NORRHART DOMAINS", 785, 165, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_VarajarFells = GUICtrlCreateRadio("VARAJAR FELLS", 785, 181, 141, 17)
;TARNISHED COAST AREAS ASURA
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_AlcaziaTangle = GUICtrlCreateRadio("ALCAZIA TANGLE", 785, 221, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_ArborBay = GUICtrlCreateRadio("ARBOR BAY", 785, 237, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_MagusStones = GUICtrlCreateRadio("MAGUS STONE", 785, 253, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_RivenEarth = GUICtrlCreateRadio("RIVEN EARTH", 785, 269, 141, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_SparkflySwamp = GUICtrlCreateRadio("SPARKFLY SWAMP", 785, 285, 145, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Radio_VerdantCascades = GUICtrlCreateRadio("VERDANT CASCADES", 785, 301, 141, 17)

;AreaGroups
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$ASCALON = GUICtrlCreateGroup("ASCALON", 8, 8, 150, 169)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$NORTHERN = GUICtrlCreateGroup("NORTHERN SHIVERPEAKS", 8, 184, 150, 105)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$SOUTHERN = GUICtrlCreateGroup("SOUTHERN SHIVERPEAKS", 171, 232, 150, 217)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$KRYTA = GUICtrlCreateGroup("KRYTA", 171, 8, 150, 217)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$MAGUUMA = GUICtrlCreateGroup("MAGUUMA JUNGLE", 8, 296, 150, 169)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$CRYSTAL = GUICtrlCreateGroup("CRYSTAL DESERT", 8, 472, 150, 137)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$RING = GUICtrlCreateGroup("RING OF FIRE ISLAND", 171, 456, 150, 49)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$SHINGJEA = GUICtrlCreateGroup("SHING JEA ISLAND", 334, 8, 150, 161)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$KAINENG = GUICtrlCreateGroup("KAINENG CITY", 334, 173, 150, 185)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$ECHOVALDFOREST = GUICtrlCreateGroup("ECHOVALD FOREST", 335, 360, 150, 137)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$THEJADESEA = GUICtrlCreateGroup("THE JADE SEA", 334, 504, 150, 153)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$ISTAN = GUICtrlCreateGroup("ISTAN", 497, 9, 264, 137)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$KOURNA = GUICtrlCreateGroup("KOURNA", 497, 153, 264, 185)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$VABBI = GUICtrlCreateGroup("VABBI", 497, 345, 264, 185)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$DESOLATION = GUICtrlCreateGroup("THE DESOLATION", 497, 533, 264, 137)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$CHARR = GUICtrlCreateGroup("CHARR HOMELANDS", 780, 9, 150, 73)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$COAST = GUICtrlCreateGroup("TARNISHED COAST", 778, 204, 150, 121)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$FARSHIVERPEAKS = GUICtrlCreateGroup("FAR SHIVERPEAKS", 778, 84, 150, 121)

;GENERAL OPTIONS
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$GENERAL = GUICtrlCreateGroup("GENERAL CONFIGURATOR", 1125, 10, 185, 200)
$Gui_HM_enable = GUICtrlCreateCheckbox("HM", 1141, 34, 49, 17)
$Gui_Legio = GUICtrlCreateCheckbox("USE STONES", 1141, 58, 153, 17)
$Gui_Bu = GUICtrlCreateCheckbox("USE BU", 1141, 82, 97, 17)
$Gui_Conset = GUICtrlCreateCheckbox("USE CONSET", 1141, 106, 97, 17)
$Gui_UseSkills = GUICtrlCreateCheckbox("USE SKILLS", 1141, 130, 97, 17)
$Gui_OpenChests = GUICtrlCreateCheckbox("OPEN CHESTS", 1141, 154, 97, 17)

;VANQUISH INFO
$VANQUISH = GUICtrlCreateGroup("VANQUISH", 1125, 301, 185, 81)
$Killed = GUICtrlCreateLabel("KILLED", 1141, 325, 47, 17)
$Missing = GUICtrlCreateLabel("MISSING", 1141, 341, 80, 17)
$Total = GUICtrlCreateLabel("TOTAL MOBS", 1141, 357, 82, 17)
$Tot_Killed = GUICtrlCreateLabel("0", 1245, 325, 40, 17, $SS_RIGHT)
$Tot_Missing = GUICtrlCreateLabel("0", 1245, 341, 40, 17, $SS_RIGHT)
$Tot_Total = GUICtrlCreateLabel("0", 1245, 357, 40, 17, $SS_RIGHT)

;CHARACTER NAME
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateLabel("CHARACTER", 1125, 372, 185, 17, $SS_CENTER)
Global Const $txtName = GUICtrlCreateCombo("", 1125, 388, 158, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
Global $btnRefreshChars = GUICtrlCreateButton("R", 1289, 388, 21, 25)
GUICtrlSetTip(-1, "Refresh Guild Wars client list")
GUICtrlSetOnEvent(-1, "RefreshCharNames")

;RUN INFO AND TIMER
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateLabel("CURRENT ACTION", 1124, 506, 185, 17, $SS_CENTER)
$StatusLabel = GUICtrlCreateEdit("", 1125, 528, 185, 130, 2097220)

;$STATUS = GUICtrlCreateLabel("SCRIPT NOT STARTED YET", 1168, 528, 188, 33, $SS_CENTER)
;$label_stat = GUICtrlCreateLabel("MIN: 000  SEC: 00", 1168, 548, 182, 25, $SS_CENTER)

$Gui_AddHeroes = GUICtrlCreateCheckbox("ADD HEROES", 952, 9, 97, 17)
GUICtrlSetOnEvent(-1, "gui_eventHandler")

;HERO TEAMS
;HERO TEAMS
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
$Group2 = GUICtrlCreateGroup("ADD HEROES", 952, 32, 150, 201)
Global $Hero1 = IniRead($iniHero, "Use Hero:", "1", "")
Global $COMBO_HERO1 = GUICtrlCreateCombo($Hero1, 960, 56, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero2 = IniRead($iniHero, "Use Hero:", "2", "")
Global $COMBO_HERO2 = GUICtrlCreateCombo($Hero2, 960, 80, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero3 = IniRead($iniHero, "Use Hero:", "3", "")
Global $COMBO_HERO3 = GUICtrlCreateCombo($Hero3, 960, 104, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero4 = IniRead($iniHero, "Use Hero:", "4", "")
Global $COMBO_HERO4 = GUICtrlCreateCombo($Hero4, 960, 128, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero5 = IniRead($iniHero, "Use Hero:", "5", "")
Global $COMBO_HERO5 = GUICtrlCreateCombo($Hero5, 960, 152, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero6 = IniRead($iniHero, "Use Hero:", "6", "")
Global $COMBO_HERO6 = GUICtrlCreateCombo($Hero6, 960, 176, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")
Global $Hero7 = IniRead($iniHero, "Use Hero:", "7", "")
Global $COMBO_HERO7 = GUICtrlCreateCombo($Hero7, 960, 200, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "TAHLKORA|DUNKORO|OGDEN STONEHEALER|MASTER OF WHISPERS|OLIAS|LIVIA|NORGU|GWEN|ACOLYTE SOUSUKE|ZHED SHADOWHOOF|VEKK|ZENMAI|ANTON|MIKU|XANDRA|ZEI REI|HAYDA|GENERAL MORGAHN|M.O.X|MELONNI|KAHMU|RAZAH|MERCENARY HERO: 1|MERCENARY HERO: 2|MERCENARY HERO: 3|MERCENARY HERO: 4|MERCENARY HERO: 5|MERCENARY HERO: 6|MERCENARY HERO: 7|MERCENARY HERO: 8")

GUICtrlSetState($COMBO_HERO1, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO2, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO3, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO4, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO5, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO6, $GUI_DISABLE)
GUICtrlSetState($COMBO_HERO7, $GUI_DISABLE)

Global $GUISaveHeroButton = GUICtrlCreateButton("SAVE HEROES", 1003, 494, 97, 25)
GUICtrlSetOnEvent($GUISaveHeroButton, "InitSave")
$RUN = GUICtrlCreateGroup("RUNS", 952, 528, 150, 49)
GUICtrlCreateLabel("TOTAL RUNS", 960, 549, 80, 17)
$gui_status_runs = GUICtrlCreateLabel("0", 1119, 552, 10, 17, $SS_RIGHT)


GUISetOnEvent($GUI_EVENT_CLOSE, "gui_eventHandler")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Gui_Donate = GUICtrlCreateCheckbox("DONATE FACTION", 1141, 178, 121, 17)
GUICtrlSetTip($Gui_Donate, "Donate Luxon/Kurzick faction to your guild. Only used on Echovald Forest and Jade Sea maps.")
GUICtrlSetState($Gui_HM_enable, $GUI_CHECKED)
GUICtrlSetState($Gui_UseSkills, $GUI_CHECKED)
GUICtrlSetState($Gui_Donate, $GUI_ENABLE)
_Vanquisher_UpdateDonateCheckbox()
GUISetState(@SW_SHOW)
Local $l_s_StartupNames = Gwen_GetCharNamesFromWindowsOnly()
If $l_s_StartupNames <> "" Then
	GUICtrlSetData($txtName, $l_s_StartupNames)
	CurrentAction("Characters: " & StringReplace($l_s_StartupNames, "|", ", "))
ElseIf _Vanquisher_CountGWClients() > 0 Then
	CurrentAction("Guild Wars detected — click R to load characters." & _Vanquisher_PrefixHint())
Else
	CurrentAction("Start Guild Wars, log in, then click R." & _Vanquisher_PrefixHint())
EndIf

#EndRegion ### END Koda GUI section ###

Func _Vanquisher_IsFactionMapSelected()
	Return BitAND(GUICtrlRead($Radio_Arborstone), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_DrazachThicket), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_Ferndale), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_MelandrusHope), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_MorostavTrail), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_MourningVeilFalls), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_TheEternalGrove), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_Archipelagos), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_BoreasSeabed), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_GyalaHatchery), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_MaishangHills), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_MountQinkai), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_RheasCrater), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_SilentSurf), $GUI_CHECKED) = $GUI_CHECKED _
		Or BitAND(GUICtrlRead($Radio_UnwakingWaters), $GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func _Vanquisher_UpdateDonateCheckbox()
	GUICtrlSetState($Gui_Donate, $GUI_ENABLE)
	If Not _Vanquisher_IsFactionMapSelected() Then
		GUICtrlSetState($Gui_Donate, $GUI_UNCHECKED)
	EndIf
EndFunc

func gui_eventHandler()
	switch (@GUI_CtrlId)

		Case $Gui_AddHeroes
			$Bool_AddHeroes = Not $Bool_AddHeroes
			GUICtrlSetState($COMBO_HERO1, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO2, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO3, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO4, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO5, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO6, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
			GUICtrlSetState($COMBO_HERO7, $Bool_AddHeroes ? $GUI_ENABLE : $GUI_DISABLE)
		Case $Radio_AscalonFoothills To $Radio_VerdantCascades
			_Vanquisher_UpdateDonateCheckbox()

		Case $GUI_EVENT_CLOSE
			exit
		case $Start
			If BitAND(GUICtrlRead($Radio_AscalonFoothills), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "AscalonFoothills"
			ElseIf BitAND(GUICtrlRead($Radio_DiessaLowlands), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DiessaLowlands"
			ElseIf BitAND(GUICtrlRead($Radio_DragonsGullet), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DragonsGullet"
			ElseIf BitAND(GUICtrlRead($Radio_EasternFrontier), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "EasternFrontier"
			ElseIf BitAND(GUICtrlRead($Radio_FlameTempleCorridor), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "FlameTempleCorridor"
			ElseIf BitAND(GUICtrlRead($Radio_OldAscalon), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "OldAscalon"
			ElseIf BitAND(GUICtrlRead($Radio_PockmarkFlats), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "PockmarkFlats"
			ElseIf BitAND(GUICtrlRead($Radio_RegentValley), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "RegentValley"
			ElseIf BitAND(GUICtrlRead($Radio_TheBreach), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheBreach"
			ElseIf BitAND(GUICtrlRead($Radio_AnvilRock), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "AnvilRock"
			ElseIf BitAND(GUICtrlRead($Radio_DeldrimorBowl), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DeldrimorBowl"
			ElseIf BitAND(GUICtrlRead($Radio_GriffonsMouth), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "GriffonsMouth"
			ElseIf BitAND(GUICtrlRead($Radio_IronHorseMine), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "IronHorseMine"
			ElseIf BitAND(GUICtrlRead($Radio_TravelersVale), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TravelersVale"
			ElseIf BitAND(GUICtrlRead($Radio_DryTop), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DryTop"
			ElseIf BitAND(GUICtrlRead($Radio_EttinsBack), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "EttinsBack"
			ElseIf BitAND(GUICtrlRead($Radio_MamnoonLagoon), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MamnoonLagoon"
			ElseIf BitAND(GUICtrlRead($Radio_ReedBog), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ReedBog"
			ElseIf BitAND(GUICtrlRead($Radio_SageLands), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SageLands"
			ElseIf BitAND(GUICtrlRead($Radio_Silverwood), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "Silverwood"
			ElseIf BitAND(GUICtrlRead($Radio_TangleRoot), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TangleRoot"
			ElseIf BitAND(GUICtrlRead($Radio_TheFalls), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheFalls"
			ElseIf BitAND(GUICtrlRead($Radio_DivinersAscent), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DivinersAscent"
			ElseIf BitAND(GUICtrlRead($Radio_ProphetsPath), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ProphetsPath"
			ElseIf BitAND(GUICtrlRead($Radio_SaltFlats), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SaltFlats"
			ElseIf BitAND(GUICtrlRead($Radio_SkywardReach), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SkywardReach"
			ElseIf BitAND(GUICtrlRead($Radio_TheAridSea), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheAridSea"
			ElseIf BitAND(GUICtrlRead($Radio_TheScar), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheScar"
			ElseIf BitAND(GUICtrlRead($Radio_VultureDrifts), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "VultureDrifts"
			ElseIf BitAND(GUICtrlRead($Radio_CursedLands), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "CursedLands"
			ElseIf BitAND(GUICtrlRead($Radio_KessexPeak), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "KessexPeak"
			ElseIf BitAND(GUICtrlRead($Radio_MajestysRest), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MajestysRest"
			ElseIf BitAND(GUICtrlRead($Radio_NeboTerrace), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "NeboTerrace"
			ElseIf BitAND(GUICtrlRead($Radio_NorthKrytaProvince), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "NorthKrytaProvince"
			ElseIf BitAND(GUICtrlRead($Radio_ScoundrelsRise), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ScoundrelsRise"
			ElseIf BitAND(GUICtrlRead($Radio_StingrayStrand), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "StingrayStrand"
			ElseIf BitAND(GUICtrlRead($Radio_TalmarkWilderness), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TalmarkWilderness"
			ElseIf BitAND(GUICtrlRead($Radio_TearsoftheFallen), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TearsoftheFallen"
			ElseIf BitAND(GUICtrlRead($Radio_TheBlackCurtain), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheBlackCurtain"
			ElseIf BitAND(GUICtrlRead($Radio_TwinSerpentLakes), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TwinSerpentLakes"
			ElseIf BitAND(GUICtrlRead($Radio_WatchtowerCoast), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "WatchtowerCoast"
			ElseIf BitAND(GUICtrlRead($Radio_DreadnoughtsDrift), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DreadnoughtsDrift"
			ElseIf BitAND(GUICtrlRead($Radio_FrozenForest), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "FrozenForest"
			ElseIf BitAND(GUICtrlRead($Radio_GrenthsFootprint), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "GrenthsFootprint"
			ElseIf BitAND(GUICtrlRead($Radio_IceFloe), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "IceFloe"
			ElseIf BitAND(GUICtrlRead($Radio_Icedome), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "Icedome"
			ElseIf BitAND(GUICtrlRead($Radio_LornarsPass), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "LornarsPass"
			ElseIf BitAND(GUICtrlRead($Radio_MineralSprings), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MineralSprings"
			ElseIf BitAND(GUICtrlRead($Radio_SnakeDance), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SnakeDance"
			ElseIf BitAND(GUICtrlRead($Radio_SpearheadPeak), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SpearheadPeak"
			ElseIf BitAND(GUICtrlRead($Radio_TalusChute), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TalusChute"
			ElseIf BitAND(GUICtrlRead($Radio_TascasDemise), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TascasDemise"
			ElseIf BitAND(GUICtrlRead($Radio_WitmansFolly), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "WitmansFolly"
			ElseIf BitAND(GUICtrlRead($Radio_HaijuLagoon), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "HaijuLagoon"
			ElseIf BitAND(GUICtrlRead($Radio_JayaBluffs), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "JayaBluffs"
			ElseIf BitAND(GUICtrlRead($Radio_KinyaProvince), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "KinyaProvince"
			ElseIf BitAND(GUICtrlRead($Radio_MinisterChosEstate), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MinisterChosEstate"
			ElseIf BitAND(GUICtrlRead($Radio_PanjiangPeninsula), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "PanjiangPeninsula"
			ElseIf BitAND(GUICtrlRead($Radio_SaoshangTrail), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SaoshangTrail"
			ElseIf BitAND(GUICtrlRead($Radio_SunquaVale), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SunquaVale"
			ElseIf BitAND(GUICtrlRead($Radio_ZenDaijun), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ZenDaijun"
			ElseIf BitAND(GUICtrlRead($Radio_BukdekByway), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "BukdekByway"
			ElseIf BitAND(GUICtrlRead($Radio_NahpuiQuarter), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "NahpuiQuarter"
			ElseIf BitAND(GUICtrlRead($Radio_PongmeiValley), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "PongmeiValley"
			ElseIf BitAND(GUICtrlRead($Radio_RaisuPalace), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "RaisuPalace"
			ElseIf BitAND(GUICtrlRead($Radio_ShadowsPassage), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ShadowsPassage"
			ElseIf BitAND(GUICtrlRead($Radio_ShenzunTunnels), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ShenzunTunnels"
			ElseIf BitAND(GUICtrlRead($Radio_SunjiangDistrict), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SunjiangDistrict"
			ElseIf BitAND(GUICtrlRead($Radio_TahnnakiTemple), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TahnnakiTemple"
			ElseIf BitAND(GUICtrlRead($Radio_WajjunBazaar), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "WajjunBazaar"
			ElseIf BitAND(GUICtrlRead($Radio_XaquangSkyway), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "XaquangSkyway"
			ElseIf BitAND(GUICtrlRead($Radio_Arborstone), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "Arborstone"
			ElseIf BitAND(GUICtrlRead($Radio_DrazachThicket), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DrazachThicket"
			ElseIf BitAND(GUICtrlRead($Radio_Ferndale), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "Ferndale"
			ElseIf BitAND(GUICtrlRead($Radio_MelandrusHope), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MelandrusHope"
			ElseIf BitAND(GUICtrlRead($Radio_MorostavTrail), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MorostavTrail"
			ElseIf BitAND(GUICtrlRead($Radio_MourningVeilFalls), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MourningVeilFalls"
			ElseIf BitAND(GUICtrlRead($Radio_TheEternalGrove), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheEternalGrove"
			ElseIf BitAND(GUICtrlRead($Radio_Archipelagos), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "Archipelagos"
			ElseIf BitAND(GUICtrlRead($Radio_BoreasSeabed), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "BoreasSeabed"
			ElseIf BitAND(GUICtrlRead($Radio_GyalaHatchery), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "GyalaHatchery"
			ElseIf BitAND(GUICtrlRead($Radio_MaishangHills), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MaishangHills"
			ElseIf BitAND(GUICtrlRead($Radio_MountQinkai), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MountQinkai"
			ElseIf BitAND(GUICtrlRead($Radio_RheasCrater), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "RheasCrater"
			ElseIf BitAND(GUICtrlRead($Radio_SilentSurf), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SilentSurf"
			ElseIf BitAND(GUICtrlRead($Radio_UnwakingWaters), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "UnwakingWaters"
			ElseIf BitAND(GUICtrlRead($Radio_CliffsOfDohjok), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "CliffsOfDohjok"
			ElseIf BitAND(GUICtrlRead($Radio_FahranurTheFirstCity), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "FahranurTheFirstCity"
			ElseIf BitAND(GUICtrlRead($Radio_IssnurIsles), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "IssnurIsles"
			ElseIf BitAND(GUICtrlRead($Radio_LahtendaBog), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "LahtendaBog"
			ElseIf BitAND(GUICtrlRead($Radio_MehtaniKeys), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MehtaniKeys"
			ElseIf BitAND(GUICtrlRead($Radio_PlainsofJarin), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "PlainsofJarin"
			ElseIf BitAND(GUICtrlRead($Radio_ZehlonReach), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ZehlonReach"
			ElseIf BitAND(GUICtrlRead($Radio_ArkjokWard), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ArkjokWard"
			ElseIf BitAND(GUICtrlRead($Radio_BahdokCaverns), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "BahdokCaverns"
			ElseIf BitAND(GUICtrlRead($Radio_BarbarousShore), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "BarbarousShore"
			ElseIf BitAND(GUICtrlRead($Radio_DejarinEstate), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DejarinEstate"
			ElseIf BitAND(GUICtrlRead($Radio_GandaraTheMoonFortress), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "GandaraTheMoonFortress"
			ElseIf BitAND(GUICtrlRead($Radio_JahaiBluffs), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "JahaiBluffs"
			ElseIf BitAND(GUICtrlRead($Radio_MargaCoast), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MargaCoast"
			ElseIf BitAND(GUICtrlRead($Radio_SunwardMarches), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SunwardMarches"
			ElseIf BitAND(GUICtrlRead($Radio_TheFloodplainOfMahnkelon), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheFloodplainOfMahnkelon"
			ElseIf BitAND(GUICtrlRead($Radio_TuraisProcession), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TuraisProcession"
			ElseIf BitAND(GUICtrlRead($Radio_ForumHighlands), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ForumHighlands"
			ElseIf BitAND(GUICtrlRead($Radio_GardenOfSeborhin), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "GardenOfSeborhin"
			ElseIf BitAND(GUICtrlRead($Radio_HoldingsOfChokhin), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "HoldingsOfChokhin"
			ElseIf BitAND(GUICtrlRead($Radio_ResplendentMakuun), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ResplendentMakuun"
			ElseIf BitAND(GUICtrlRead($Radio_TheHiddenCityOfAhdashim), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheHiddenCityOfAhdashim"
			ElseIf BitAND(GUICtrlRead($Radio_TheMirrorOfLyss), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheMirrorOfLyss"
			ElseIf BitAND(GUICtrlRead($Radio_VehjinMines), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "VehjinMines"
			ElseIf BitAND(GUICtrlRead($Radio_VehtendiValley), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "VehtendiValley"
			ElseIf BitAND(GUICtrlRead($Radio_WildernessOfBahdza), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "WildernessOfBahdza"
			ElseIf BitAND(GUICtrlRead($Radio_YatendiCanyons), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "YatendiCanyons"
			ElseIf BitAND(GUICtrlRead($Radio_CrystalOverlook), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "CrystalOverlook"
			ElseIf BitAND(GUICtrlRead($Radio_JokosDomain), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "JokosDomain"
			ElseIf BitAND(GUICtrlRead($Radio_PoisonedOutcrops), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "PoisonedOutcrops"
			ElseIf BitAND(GUICtrlRead($Radio_TheAlkaliPan), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheAlkaliPan"
			ElseIf BitAND(GUICtrlRead($Radio_TheRupturedHeart), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheRupturedHeart"
			ElseIf BitAND(GUICtrlRead($Radio_TheShatteredRavines), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheShatteredRavines"
			ElseIf BitAND(GUICtrlRead($Radio_TheSulfurousWastes), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "TheSulfurousWastes"
			ElseIf BitAND(GUICtrlRead($Radio_DaladaUplands), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DaladaUplands"
			ElseIf BitAND(GUICtrlRead($Radio_GrothmarWardowns), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "GrothmarWardowns"
			ElseIf BitAND(GUICtrlRead($Radio_SacnothValley), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SacnothValley"
			ElseIf BitAND(GUICtrlRead($Radio_BjoraMarches), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "BjoraMarches"
			ElseIf BitAND(GUICtrlRead($Radio_DrakkarLake), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "DrakkarLake"
			ElseIf BitAND(GUICtrlRead($Radio_IceCliffChasms), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "IceCliffChasms"
			ElseIf BitAND(GUICtrlRead($Radio_JagaMoraine), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "JagaMoraine"
			ElseIf BitAND(GUICtrlRead($Radio_NorrhartDomains), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "NorrhartDomains"
			ElseIf BitAND(GUICtrlRead($Radio_VarajarFells), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "VarajarFells"
			ElseIf BitAND(GUICtrlRead($Radio_ArborBay), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "ArborBay"
			ElseIf BitAND(GUICtrlRead($Radio_AlcaziaTangle), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "AlcaziaTangle"
			ElseIf BitAND(GUICtrlRead($Radio_MagusStones), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "MagusStones"
			ElseIf BitAND(GUICtrlRead($Radio_RivenEarth), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "RivenEarth"
			ElseIf BitAND(GUICtrlRead($Radio_SparkflySwamp), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "SparkflySwamp"
			ElseIf BitAND(GUICtrlRead($Radio_VerdantCascades), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title = "VerdantCascades"
			ElseIf BitAND(GUICtrlRead($Radio_PerditionRock), $GUI_CHECKED) = $GUI_CHECKED Then
				$Title= "PerditionRock"
			Else
				MsgBox(0, "Error", "No Map Selected.")
				Return
			EndIf

			If GUICtrlRead($txtName) = "" Then
				MsgBox(0, "Error", "Please select your character.")
				Return
			Else
				If Initialize(GUICtrlRead($txtName), True) = False Then
					MsgBox(0, "Error", "Can't find a Guild Wars client with that character name.")
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

			GUICtrlSetState($Radio_AscalonFoothills, $GUI_DISABLE)
			GUICtrlSetState($Radio_DiessaLowlands, $GUI_DISABLE)
			GUICtrlSetState($Radio_DragonsGullet, $GUI_DISABLE)
			GUICtrlSetState($Radio_EasternFrontier, $GUI_DISABLE)
			GUICtrlSetState($Radio_FlameTempleCorridor, $GUI_DISABLE)
			GUICtrlSetState($Radio_OldAscalon, $GUI_DISABLE)
			GUICtrlSetState($Radio_PockmarkFlats, $GUI_DISABLE)
			GUICtrlSetState($Radio_RegentValley, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheBreach, $GUI_DISABLE)
			GUICtrlSetState($Radio_AnvilRock, $GUI_DISABLE)
			GUICtrlSetState($Radio_DeldrimorBowl, $GUI_DISABLE)
			GUICtrlSetState($Radio_GriffonsMouth, $GUI_DISABLE)
			GUICtrlSetState($Radio_IronHorseMine, $GUI_DISABLE)
			GUICtrlSetState($Radio_TravelersVale, $GUI_DISABLE)
			GUICtrlSetState($Radio_DryTop, $GUI_DISABLE)
			GUICtrlSetState($Radio_EttinsBack, $GUI_DISABLE)
			GUICtrlSetState($Radio_MamnoonLagoon, $GUI_DISABLE)
			GUICtrlSetState($Radio_ReedBog, $GUI_DISABLE)
			GUICtrlSetState($Radio_SageLands, $GUI_DISABLE)
			GUICtrlSetState($Radio_Silverwood, $GUI_DISABLE)
			GUICtrlSetState($Radio_TangleRoot, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheFalls, $GUI_DISABLE)
			GUICtrlSetState($Radio_DivinersAscent, $GUI_DISABLE)
			GUICtrlSetState($Radio_ProphetsPath, $GUI_DISABLE)
			GUICtrlSetState($Radio_SaltFlats, $GUI_DISABLE)
			GUICtrlSetState($Radio_SkywardReach, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheAridSea, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheScar, $GUI_DISABLE)
			GUICtrlSetState($Radio_VultureDrifts, $GUI_DISABLE)
			GUICtrlSetState($Radio_CursedLands, $GUI_DISABLE)
			GUICtrlSetState($Radio_KessexPeak, $GUI_DISABLE)
			GUICtrlSetState($Radio_MajestysRest, $GUI_DISABLE)
			GUICtrlSetState($Radio_NeboTerrace, $GUI_DISABLE)
			GUICtrlSetState($Radio_NorthKrytaProvince, $GUI_DISABLE)
			GUICtrlSetState($Radio_ScoundrelsRise, $GUI_DISABLE)
			GUICtrlSetState($Radio_StingrayStrand, $GUI_DISABLE)
			GUICtrlSetState($Radio_TalmarkWilderness, $GUI_DISABLE)
			GUICtrlSetState($Radio_TearsoftheFallen, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheBlackCurtain, $GUI_DISABLE)
			GUICtrlSetState($Radio_TwinSerpentLakes, $GUI_DISABLE)
			GUICtrlSetState($Radio_WatchtowerCoast, $GUI_DISABLE)
			GUICtrlSetState($Radio_DreadnoughtsDrift, $GUI_DISABLE)
			GUICtrlSetState($Radio_FrozenForest, $GUI_DISABLE)
			GUICtrlSetState($Radio_GrenthsFootprint, $GUI_DISABLE)
			GUICtrlSetState($Radio_IceFloe, $GUI_DISABLE)
			GUICtrlSetState($Radio_Icedome, $GUI_DISABLE)
			GUICtrlSetState($Radio_LornarsPass, $GUI_DISABLE)
			GUICtrlSetState($Radio_MineralSprings, $GUI_DISABLE)
			GUICtrlSetState($Radio_SnakeDance, $GUI_DISABLE)
			GUICtrlSetState($Radio_SpearheadPeak, $GUI_DISABLE)
			GUICtrlSetState($Radio_TalusChute, $GUI_DISABLE)
			GUICtrlSetState($Radio_TascasDemise, $GUI_DISABLE)
			GUICtrlSetState($Radio_WitmansFolly, $GUI_DISABLE)
			GUICtrlSetState($Radio_PerditionRock, $GUI_DISABLE)
			GUICtrlSetState($Radio_HaijuLagoon, $GUI_DISABLE)
			GUICtrlSetState($Radio_JayaBluffs, $GUI_DISABLE)
			GUICtrlSetState($Radio_KinyaProvince, $GUI_DISABLE)
			GUICtrlSetState($Radio_MinisterChosEstate, $GUI_DISABLE)
			GUICtrlSetState($Radio_PanjiangPeninsula, $GUI_DISABLE)
			GUICtrlSetState($Radio_SaoshangTrail, $GUI_DISABLE)
			GUICtrlSetState($Radio_SunquaVale, $GUI_DISABLE)
			GUICtrlSetState($Radio_ZenDaijun, $GUI_DISABLE)
			GUICtrlSetState($Radio_BukdekByway, $GUI_DISABLE)
			GUICtrlSetState($Radio_NahpuiQuarter, $GUI_DISABLE)
			GUICtrlSetState($Radio_PongmeiValley, $GUI_DISABLE)
			GUICtrlSetState($Radio_RaisuPalace, $GUI_DISABLE)
			GUICtrlSetState($Radio_ShadowsPassage, $GUI_DISABLE)
			GUICtrlSetState($Radio_ShenzunTunnels, $GUI_DISABLE)
			GUICtrlSetState($Radio_SunjiangDistrict, $GUI_DISABLE)
			GUICtrlSetState($Radio_TahnnakiTemple, $GUI_DISABLE)
			GUICtrlSetState($Radio_WajjunBazaar, $GUI_DISABLE)
			GUICtrlSetState($Radio_XaquangSkyway, $GUI_DISABLE)
			GUICtrlSetState($Radio_Arborstone, $GUI_DISABLE)
			GUICtrlSetState($Radio_DrazachThicket, $GUI_DISABLE)
			GUICtrlSetState($Radio_Ferndale, $GUI_DISABLE)
			GUICtrlSetState($Radio_MelandrusHope, $GUI_DISABLE)
			GUICtrlSetState($Radio_MorostavTrail, $GUI_DISABLE)
			GUICtrlSetState($Radio_MourningVeilFalls, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheEternalGrove, $GUI_DISABLE)
			GUICtrlSetState($Radio_Archipelagos, $GUI_DISABLE)
			GUICtrlSetState($Radio_BoreasSeabed, $GUI_DISABLE)
			GUICtrlSetState($Radio_GyalaHatchery, $GUI_DISABLE)
			GUICtrlSetState($Radio_MaishangHills, $GUI_DISABLE)
			GUICtrlSetState($Radio_MountQinkai, $GUI_DISABLE)
			GUICtrlSetState($Radio_RheasCrater, $GUI_DISABLE)
			GUICtrlSetState($Radio_SilentSurf, $GUI_DISABLE)
			GUICtrlSetState($Radio_UnwakingWaters, $GUI_DISABLE)
			GUICtrlSetState($Radio_CliffsOfDohjok, $GUI_DISABLE)
			GUICtrlSetState($Radio_FahranurTheFirstCity, $GUI_DISABLE)
			GUICtrlSetState($Radio_IssnurIsles, $GUI_DISABLE)
			GUICtrlSetState($Radio_LahtendaBog, $GUI_DISABLE)
			GUICtrlSetState($Radio_MehtaniKeys, $GUI_DISABLE)
			GUICtrlSetState($Radio_PlainsofJarin, $GUI_DISABLE)
			GUICtrlSetState($Radio_ZehlonReach, $GUI_DISABLE)
			GUICtrlSetState($Radio_ArkjokWard, $GUI_DISABLE)
			GUICtrlSetState($Radio_BahdokCaverns, $GUI_DISABLE)
			GUICtrlSetState($Radio_BarbarousShore, $GUI_DISABLE)
			GUICtrlSetState($Radio_DejarinEstate, $GUI_DISABLE)
			GUICtrlSetState($Radio_GandaraTheMoonFortress, $GUI_DISABLE)
			GUICtrlSetState($Radio_JahaiBluffs, $GUI_DISABLE)
			GUICtrlSetState($Radio_MargaCoast, $GUI_DISABLE)
			GUICtrlSetState($Radio_SunwardMarches, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheFloodplainOfMahnkelon, $GUI_DISABLE)
			GUICtrlSetState($Radio_TuraisProcession, $GUI_DISABLE)
			GUICtrlSetState($Radio_ForumHighlands, $GUI_DISABLE)
			GUICtrlSetState($Radio_GardenOfSeborhin, $GUI_DISABLE)
			GUICtrlSetState($Radio_HoldingsOfChokhin, $GUI_DISABLE)
			GUICtrlSetState($Radio_ResplendentMakuun, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheHiddenCityOfAhdashim, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheMirrorOfLyss, $GUI_DISABLE)
			GUICtrlSetState($Radio_VehjinMines, $GUI_DISABLE)
			GUICtrlSetState($Radio_VehtendiValley, $GUI_DISABLE)
			GUICtrlSetState($Radio_WildernessOfBahdza, $GUI_DISABLE)
			GUICtrlSetState($Radio_YatendiCanyons, $GUI_DISABLE)
			GUICtrlSetState($Radio_CrystalOverlook, $GUI_DISABLE)
			GUICtrlSetState($Radio_JokosDomain, $GUI_DISABLE)
			GUICtrlSetState($Radio_PoisonedOutcrops, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheAlkaliPan, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheRupturedHeart, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheShatteredRavines, $GUI_DISABLE)
			GUICtrlSetState($Radio_TheSulfurousWastes, $GUI_DISABLE)
			GUICtrlSetState($Radio_DaladaUplands, $GUI_DISABLE)
			GUICtrlSetState($Radio_GrothmarWardowns, $GUI_DISABLE)
			GUICtrlSetState($Radio_SacnothValley, $GUI_DISABLE)
			GUICtrlSetState($Radio_BjoraMarches, $GUI_DISABLE)
			GUICtrlSetState($Radio_DrakkarLake, $GUI_DISABLE)
			GUICtrlSetState($Radio_IceCliffChasms, $GUI_DISABLE)
			GUICtrlSetState($Radio_JagaMoraine, $GUI_DISABLE)
			GUICtrlSetState($Radio_NorrhartDomains, $GUI_DISABLE)
			GUICtrlSetState($Radio_VarajarFells, $GUI_DISABLE)
			GUICtrlSetState($Radio_ArborBay, $GUI_DISABLE)
			GUICtrlSetState($Radio_AlcaziaTangle, $GUI_DISABLE)
			GUICtrlSetState($Radio_MagusStones, $GUI_DISABLE)
			GUICtrlSetState($Radio_RivenEarth, $GUI_DISABLE)
			GUICtrlSetState($Radio_SparkflySwamp, $GUI_DISABLE)
			GUICtrlSetState($Radio_VerdantCascades, $GUI_DISABLE)
			GUICtrlSetState($Gui_HM_enable, $GUI_DISABLE)
			GUICtrlSetState($Gui_Donate, $GUI_DISABLE)
			GUICtrlSetState($Gui_Bu, $GUI_DISABLE)
			GUICtrlSetState($Gui_Conset, $GUI_DISABLE)
			GUICtrlSetState($Gui_Legio, $GUI_DISABLE)
			GUICtrlSetState($Start, $GUI_DISABLE)
			GUICtrlSetState($txtName, $GUI_DISABLE)

			$NumberRun = 0
			$RunSuccess = 0
			$boolrun = True

			$sGW = "Guild Wars - " & GUICtrlRead($txtName)
			AdlibRegister("ReduceMemory", 20000)
			AdlibRegister("UpdateVanquish", 5000)
			AdlibRegister("CheckDeath", 1000)
	endswitch
endfunc

Func RefreshCharNames()
	Local $l_s_Hint = _Vanquisher_PrefixHint()
	Local $l_s_Names = GetLoggedCharNames()

	If $l_s_Names <> "" Then
		GUICtrlSetData($txtName, "")
		GUICtrlSetData($txtName, $l_s_Names)
		CurrentAction("Characters: " & StringReplace($l_s_Names, "|", ", "))
		Return
	EndIf

	Local $l_i_GWCount = _Vanquisher_CountGWClients()

	If $l_i_GWCount = 0 Then
		GUICtrlSetData($txtName, "")
		CurrentAction("No Guild Wars client found. Use the Master Vanquisher desktop icon (gw4)." & $l_s_Hint)
		Return
	EndIf

	GUICtrlSetData($txtName, "")
	CurrentAction("Found " & $l_i_GWCount & " Guild Wars client(s), but could not read character names. Log in fully, then click R." & $l_s_Hint)
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
		$Pr_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $pid)
		DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $Pr_Handle[0])
		DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $Pr_Handle[0])
	EndIf
EndFunc

Func CurrentAction($TEXT)
	Local $TEXTLEN = StringLen($TEXT)
	Local $CONSOLELEN = _GUICtrlEdit_GetTextLen($StatusLabel)
	If $TEXTLEN + $CONSOLELEN > 30000 Then GUICtrlSetData($StatusLabel, StringRight(_GUICtrlEdit_GetText($StatusLabel), 30000 - $TEXTLEN - 1000))
	_GUICtrlEdit_AppendText($StatusLabel, @CRLF & "[" & @HOUR & ":" & @MIN & "] " & $TEXT)
	_GUICtrlEdit_Scroll($StatusLabel, 1)
EndFunc   ;==>CurrentAction

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

	Until $load = 2 And DllStructGetData($lMe, 'X') = 0 And DllStructGetData($lMe, 'Y') = 0 Or $deadlock > 1000

	$deadlock = 0
	Do
		Sleep(100)
		$deadlock += 100

		$deadlock += 100
		$load = GetMapLoading()
		$lMe = GetAgentByID(-2)

	Until $load <> 2 And DllStructGetData($lMe, 'X') <> 0 And DllStructGetData($lMe, 'Y') <> 0 Or $deadlock > 3000
	CurrentAction("Load complete")
	Sleep(1000)
EndFunc   ;==>WaitForLoad

;Func CheckArea($AX, $AY)
;	Local $RET = False
;	Local $PX = DllStructGetData(GetAgentByID(-2), "X")
;	Local $PY = DllStructGetData(GetAgentByID(-2), "Y")
;	If ($PX < $AX + 500) And ($PX > $AX - 500) And ($PY < $AY + 500) And ($PY > $AY - 500) Then
;		$RET = True
;	EndIf
;	Return $RET
;EndFunc   ;==>CHECKAREA




