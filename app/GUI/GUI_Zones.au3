#include-once
Global $g_a_VanquisherZones[1][4]
Global $g_i_VanquisherZoneCount = 0

Func _Vanquisher_InitZones()
    Static $bDone = False
    If $bDone Then Return
    $bDone = True
    Global $g_a_VanquisherZones, $g_i_VanquisherZoneCount
    ; Zone order follows Core/Linker.au3 / Maps folder order: Prophecies, Factions, Nightfall, EotN.
    Local $sData = _
        "AscalonFoothills|ASCALON FOOTHILLS|Prophecies|0" & @CRLF & _
        "DiessaLowlands|DIESSA LOWLANDS|Prophecies|0" & @CRLF & _
        "DragonsGullet|DRAGON''S GULLET|Prophecies|0" & @CRLF & _
        "EasternFrontier|EASTERN FRONTIER|Prophecies|0" & @CRLF & _
        "FlameTempleCorridor|FLAME TEMPLE CORRIDOR|Prophecies|0" & @CRLF & _
        "OldAscalon|OLD ASCALON|Prophecies|0" & @CRLF & _
        "PockmarkFlats|POCKMARK FLATS|Prophecies|0" & @CRLF & _
        "RegentValley|REGENT VALLEY|Prophecies|0" & @CRLF & _
        "TheBreach|THE BREACH|Prophecies|0" & @CRLF & _
        "AnvilRock|ANVIL ROCK|Prophecies|0" & @CRLF & _
        "DeldrimorBowl|DELDRIMOR BOWL|Prophecies|0" & @CRLF & _
        "GriffonsMouth|GRIFFON''S MOUTH|Prophecies|0" & @CRLF & _
        "IronHorseMine|IRON HORSE MINE|Prophecies|0" & @CRLF & _
        "TravelersVale|TRAVELER''S VALE|Prophecies|0" & @CRLF & _
        "DryTop|DRY TOP|Prophecies|0" & @CRLF & _
        "EttinsBack|ETTIN''S BACK|Prophecies|0" & @CRLF & _
        "MamnoonLagoon|MAMNOON LAGOON|Prophecies|0" & @CRLF & _
        "ReedBog|REED BOG|Prophecies|0" & @CRLF & _
        "SageLands|SAGE LANDS|Prophecies|0" & @CRLF & _
        "Silverwood|SILVERWOOD|Prophecies|0" & @CRLF & _
        "TangleRoot|TANGLE ROOT|Prophecies|0" & @CRLF & _
        "TheFalls|THE FALLS|Prophecies|0" & @CRLF & _
        "DivinersAscent|DIVINER''S ASCENT|Prophecies|0" & @CRLF & _
        "ProphetsPath|PROPHET PATH|Prophecies|0" & @CRLF & _
        "SaltFlats|SALT FLATS|Prophecies|0" & @CRLF & _
        "SkywardReach|SKYWARD REACH|Prophecies|0" & @CRLF & _
        "TheAridSea|THE ARID SEA|Prophecies|0" & @CRLF & _
        "TheScar|THE SCAR|Prophecies|0" & @CRLF & _
        "VultureDrifts|VULTURE DRIFTS|Prophecies|0" & @CRLF & _
        "CursedLands|CURSED LANDS|Prophecies|0" & @CRLF & _
        "KessexPeak|KESSEX PEAK|Prophecies|0" & @CRLF & _
        "MajestysRest|MAJESTY''S REST|Prophecies|0" & @CRLF & _
        "NeboTerrace|NEBO TERRACE|Prophecies|0" & @CRLF & _
        "NorthKrytaProvince|NORTH KRYTA PROVINCE|Prophecies|0" & @CRLF & _
        "ScoundrelsRise|SCOUNDREL''S RISE|Prophecies|0" & @CRLF & _
        "StingrayStrand|STINGRAY STRAND|Prophecies|0" & @CRLF & _
        "TalmarkWilderness|TALMARK WILDERNESS|Prophecies|0" & @CRLF & _
        "TearsoftheFallen|TEARS OF THE FALLEN|Prophecies|0" & @CRLF & _
        "TheBlackCurtain|THE BLACK CURTAIN|Prophecies|0" & @CRLF & _
        "TwinSerpentLakes|TWIN SERPENT LAKES|Prophecies|0" & @CRLF & _
        "WatchtowerCoast|WATCHTOWER COAST|Prophecies|0" & @CRLF & _
        "DreadnoughtsDrift|DREADNOUGHT''S DRIFTS|Prophecies|0" & @CRLF & _
        "FrozenForest|FROZEN FOREST|Prophecies|0" & @CRLF & _
        "GrenthsFootprint|GRENTH''S FOOTPRINT|Prophecies|0" & @CRLF & _
        "IceFloe|ICE FLOE|Prophecies|0" & @CRLF & _
        "IceDome|ICEDOME|Prophecies|0" & @CRLF & _
        "LornarsPass|LORNAR''S PASS|Prophecies|0" & @CRLF & _
        "MineralSprings|MINERAL SPRINGS|Prophecies|0" & @CRLF & _
        "SnakeDance|SNAKE DANCE|Prophecies|0" & @CRLF & _
        "SpearheadPeak|SPEARHEAD PEAK|Prophecies|0" & @CRLF & _
        "TalusChute|TALUS CHUTE|Prophecies|0" & @CRLF & _
        "TascasDemise|TASCA DEMISE|Prophecies|0" & @CRLF & _
        "WitmansFolly|WITMAN''S FOLLY|Prophecies|0" & @CRLF & _
        "PerditionRock|PERDITION ROCK|Prophecies|0" & @CRLF & _
        "HaijuLagoon|HAIJU LAGOON|Factions|0" & @CRLF & _
        "JayaBluffs|JAYA BLUFFS|Factions|0" & @CRLF & _
        "KinyaProvince|KINYA PROVINCE|Factions|0" & @CRLF & _
        "MinisterChosEstate|MINISTER''S CHO ESTATE|Factions|0" & @CRLF & _
        "PanjiangPeninsula|PANJIANG PENINSULA|Factions|0" & @CRLF & _
        "SaoshangTrail|SAOSHANG TRAIL|Factions|0" & @CRLF & _
        "SunquaVale|SUNQUA VALE|Factions|0" & @CRLF & _
        "ZenDaijun|ZEN DAIJUN|Factions|0" & @CRLF & _
        "BukdekByway|BUKDEK BYWAY|Factions|0" & @CRLF & _
        "NahpuiQuarter|NAHPUI QUARTER|Factions|0" & @CRLF & _
        "PongmeiValley|PONGMEI VALLEY|Factions|0" & @CRLF & _
        "RaisuPalace|RAISU PALACE|Factions|0" & @CRLF & _
        "ShadowsPassage|SHADOW''S PASSAGE|Factions|0" & @CRLF & _
        "ShenzunTunnels|SHENZUN TUNNEL|Factions|0" & @CRLF & _
        "SunjiangDistrict|SUNJIANG DISTRICT|Factions|0" & @CRLF & _
        "TahnnakiTemple|TAHNNAKAI TEMPLE|Factions|0" & @CRLF & _
        "WajjunBazaar|WAJJUN BAZAAR|Factions|0" & @CRLF & _
        "XaquangSkyway|XAQUANG SKYWAY|Factions|0" & @CRLF & _
        "Arborstone|ARBORSTONE|Factions|1" & @CRLF & _
        "DrazachThicket|DRAZACH THICKET|Factions|1" & @CRLF & _
        "Ferndale|FERNDALE|Factions|1" & @CRLF & _
        "MelandrusHope|MELANDRU''S HOPE|Factions|1" & @CRLF & _
        "MorostavTrail|MOROSTAV TRAIL|Factions|1" & @CRLF & _
        "MourningVeilFalls|MOURNING VEIL FALLS|Factions|1" & @CRLF & _
        "TheEternalGrove|THE ETERNAL GROVE|Factions|1" & @CRLF & _
        "Archipelagos|ARCHIPELAGOS|Factions|1" & @CRLF & _
        "BoreasSeabed|BOREAS SEABED|Factions|1" & @CRLF & _
        "GyalaHatchery|GYALA HATCHERY|Factions|1" & @CRLF & _
        "MaishangHills|MAISHANG HILLS|Factions|1" & @CRLF & _
        "MountQinkai|MOUNT QINKAI|Factions|1" & @CRLF & _
        "RheasCrater|RHEA''S CRATER|Factions|1" & @CRLF & _
        "SilentSurf|SILENT SURF|Factions|1" & @CRLF & _
        "UnwakingWaters|UNWAKING WATER|Factions|1" & @CRLF & _
        "CliffsOfDohjok|CLIFFS OF DOHJOK|Nightfall|0" & @CRLF & _
        "FahranurTheFirstCity|FAHRANUR, THE FIRST CITY|Nightfall|0" & @CRLF & _
        "IssnurIsles|ISSNUR ISLES|Nightfall|0" & @CRLF & _
        "LahtendaBog|LAHTENDA BOG|Nightfall|0" & @CRLF & _
        "MehtaniKeys|MEHTANI KEYS|Nightfall|0" & @CRLF & _
        "PlainsofJarin|PLAINS OF JARIN|Nightfall|0" & @CRLF & _
        "ZehlonReach|ZEHLON REACH|Nightfall|0" & @CRLF & _
        "ArkjokWard|ARKJOK WARD|Nightfall|0" & @CRLF & _
        "BahdokCaverns|BAHDOK CAVERNS|Nightfall|0" & @CRLF & _
        "BarbarousShore|BARBAROUS SHORE|Nightfall|0" & @CRLF & _
        "DejarinEstate|DEJARIN ESTATE|Nightfall|0" & @CRLF & _
        "GandaraTheMoonFortress|GANDARA THE MOON FORTRESS|Nightfall|0" & @CRLF & _
        "JahaiBluffs|JAHAI BLUFFS|Nightfall|0" & @CRLF & _
        "MargaCoast|MARGA COAST|Nightfall|0" & @CRLF & _
        "SunwardMarches|SUNWARD MARCHES|Nightfall|0" & @CRLF & _
        "TheFloodplainOfMahnkelon|THE FLOODPLAIN OF MAHNKELON|Nightfall|0" & @CRLF & _
        "TuraisProcession|TURAI''S PROCESSION|Nightfall|0" & @CRLF & _
        "ForumHighlands|FORUM HIGHLANDS|Nightfall|0" & @CRLF & _
        "GardenOfSeborhin|GARDEN OF SEBORHIN|Nightfall|0" & @CRLF & _
        "HoldingsOfChokhin|HOLDINGS OF CHOKHIN|Nightfall|0" & @CRLF & _
        "ResplendentMakuun|RESPLENDENT MAKUUN|Nightfall|0" & @CRLF & _
        "TheHiddenCityOfAhdashim|THE HIDDEN CITY OF AHDASHIM|Nightfall|0" & @CRLF & _
        "TheMirrorOfLyss|THE MIRROR OF LYSS|Nightfall|0" & @CRLF & _
        "VehjinMines|VEHJIN MINES|Nightfall|0" & @CRLF & _
        "VehtendiValley|VEHTENDI VALLEY|Nightfall|0" & @CRLF & _
        "WildernessOfBahdza|WILDERNESS OF BAHZDA|Nightfall|0" & @CRLF & _
        "YatendiCanyons|YATENDI CANYONS|Nightfall|0" & @CRLF & _
        "CrystalOverlook|CRYSTAL OVERLOOK|Nightfall|0" & @CRLF & _
        "JokosDomain|JOKO''S DOMAIN|Nightfall|0" & @CRLF & _
        "PoisonedOutcrops|POISONED OUTCROPS|Nightfall|0" & @CRLF & _
        "TheAlkaliPan|THE ALKALI PAN|Nightfall|0" & @CRLF & _
        "TheRupturedHeart|THE RUPTURED HEART|Nightfall|0" & @CRLF & _
        "TheShatteredRavines|THE SHATTERED RAVINES|Nightfall|0" & @CRLF & _
        "TheSulfurousWastes|THE SULFUROUS WASTES|Nightfall|0" & @CRLF & _
        "DaladaUplands|DALADA UPLANDS|EotN|0" & @CRLF & _
        "GrothmarWardowns|GROTHMAR WARDOWNS|EotN|0" & @CRLF & _
        "SacnothValley|SACNOTH VALLEY|EotN|0" & @CRLF & _
        "BjoraMarches|BJORA MARCHES|EotN|0" & @CRLF & _
        "DrakkarLake|DRAKKAR LAKE|EotN|0" & @CRLF & _
        "IceCliffChasms|ICE CLIFF CHASM|EotN|0" & @CRLF & _
        "JagaMoraine|JAGA MORAINE|EotN|0" & @CRLF & _
        "NorrhartDomains|NORRHART DOMAINS|EotN|0" & @CRLF & _
        "VarajarFells|VARAJAR FELLS|EotN|0" & @CRLF & _
        "ArborBay|ARBOR BAY|EotN|0" & @CRLF & _
        "AlcaziaTangle|ALCAZIA TANGLE|EotN|0" & @CRLF & _
        "MagusStones|MAGUS STONE|EotN|0" & @CRLF & _
        "RivenEarth|RIVEN EARTH|EotN|0" & @CRLF & _
        "SparkflySwamp|SPARKFLY SWAMP|EotN|0" & @CRLF & _
        "VerdantCascades|VERDANT CASCADES|EotN|0"
    Local $aLines = StringSplit(StringStripWS($sData, 3), @CRLF, 1)
    Local $iCount = 0
    For $i = 1 To $aLines[0]
        If StringStripWS($aLines[$i], 3) <> "" Then $iCount += 1
    Next
    $g_i_VanquisherZoneCount = $iCount
    ReDim $g_a_VanquisherZones[$g_i_VanquisherZoneCount][4]
    Local $iZone = 0
    For $i = 1 To $aLines[0]
        If StringStripWS($aLines[$i], 3) = "" Then ContinueLoop
        Local $aP = StringSplit($aLines[$i], "|", 2)
        $g_a_VanquisherZones[$iZone][0] = $aP[0]
        $g_a_VanquisherZones[$iZone][1] = $aP[1]
        $g_a_VanquisherZones[$iZone][2] = $aP[2]
        $g_a_VanquisherZones[$iZone][3] = Number($aP[3])
        $iZone += 1
    Next
EndFunc

Func _Vanquisher_ZoneTitle($a_i_Index)
    _Vanquisher_InitZones()
    If $a_i_Index < 0 Or $a_i_Index >= $g_i_VanquisherZoneCount Then Return ""
    Return $g_a_VanquisherZones[$a_i_Index][0]
EndFunc

Func _Vanquisher_ZoneDisplay($a_i_Index)
    _Vanquisher_InitZones()
    If $a_i_Index < 0 Or $a_i_Index >= $g_i_VanquisherZoneCount Then Return ""
    Return $g_a_VanquisherZones[$a_i_Index][1]
EndFunc

Func _Vanquisher_ZoneCampaign($a_i_Index)
    _Vanquisher_InitZones()
    If $a_i_Index < 0 Or $a_i_Index >= $g_i_VanquisherZoneCount Then Return ""
    Return $g_a_VanquisherZones[$a_i_Index][2]
EndFunc

Func _Vanquisher_ZoneIsFaction($a_i_Index)
    _Vanquisher_InitZones()
    If $a_i_Index < 0 Or $a_i_Index >= $g_i_VanquisherZoneCount Then Return False
    Return $g_a_VanquisherZones[$a_i_Index][3] = 1
EndFunc

Func _Vanquisher_CampaignZoneCount($a_s_Campaign)
    _Vanquisher_InitZones()
    Local $n = 0
    For $i = 0 To $g_i_VanquisherZoneCount - 1
        If $g_a_VanquisherZones[$i][2] = $a_s_Campaign Then $n += 1
    Next
    Return $n
EndFunc

