
Func GoOut()
	RndSleep(250)

	If GetGoldCharacter() < 100 AND GetGoldStorage() > 100 Then
		CurrentAction("Grabbing gold for shrine")
		RndSleep(250)
		WithdrawGold(100)
		RndSleep(250)
	EndIf

	CurrentAction("Going out")
	;Ascalon
	Do
		If $Bool_AddHeroes Then
			KickAllHeroes()
			Sleep(1000)

			CurrentAction("Setting up Party.")
			$PartySize = GetMaxPartySize(GetMapID())

			If $PartySize >= 4 Then
				$heroToAdd = GetHeroIdByName(GUICtrlRead($COMBO_HERO1))
				AddHero($heroToAdd)
				Sleep(500)

				$heroToAdd = GetHeroIdByName(GUICtrlRead($COMBO_HERO2))
				AddHero($heroToAdd)
				Sleep(500)

				$heroToAdd = GetHeroIdByName(GUICtrlRead($COMBO_HERO3))
				AddHero($heroToAdd)
				Sleep(500)
			EndIf

			If $PartySize >= 6 Then
				$heroToAdd = GetHeroIdByName(GUICtrlRead($COMBO_HERO4))
				AddHero($heroToAdd)
				Sleep(500)

				$heroToAdd = GetHeroIdByName(GUICtrlRead($COMBO_HERO5))
				AddHero($heroToAdd)
				Sleep(500)
			EndIf

			If $PartySize = 8 Then
				$heroToAdd = GetHeroIdByName(GUICtrlRead($COMBO_HERO6))
				AddHero($heroToAdd)
				Sleep(500)

				$heroToAdd = GetHeroIdByName(GUICtrlRead($COMBO_HERO7))
				AddHero($heroToAdd)
			EndIf

			CurrentAction("Party Setup")
		Else
			CurrentAction("Skipped Party Setup")
		EndIf


		Switch $Title
			Case "AscalonFoothills"
				TakeQuestDeldrimor()
				WaitForLoad()
				Case "DiessaLowlands"
					MoveTo(9342, 4942)
					Move(9240, 3985)
					WaitForLoad()
				Case "DragonsGullet"
					MoveTo(945, 14173)
					Move(2341, 13416)
					WaitForLoad()
				Case "EasternFrontier"
					MoveTo(-2300, -13836)
					Move(-1593, -13669)
					WaitForLoad()
				Case "FlameTempleCorridor"
					MoveTo(945, 14173)
					Move(2341, 13416)
					WaitForLoad()
				Case "OldAscalon"
					MoveTo(625, 1883)
					Move(-426, 1874)
					WaitForLoad()
				Case "PockmarkFlats"
					MoveTo(-6218, 22736)
					Move(-6197, 22280)
					WaitForLoad()
				Case "RegentValley"
					MoveTo(7936, -28412)
					MoveTo(7194, -31058)
					MoveTo(7208, -32163)
					Move(7208, -32863)
					WaitForLoad()
				Case "TheBreach"
					MoveTo(20252, 8439)
					MoveTo(20242, 7929)
					Move(20246, 7491)
					WaitForLoad()

		;NorthernShiverpeaks
				Case "AnvilRock"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "DeldrimorBowl"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "GriffonsMouth"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "IronHorseMine"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "TravelersVale"
					MoveTo(9303, 4208)
					Move(9275, 4000)
					WaitForLoad()
			;Maguuma
				Case "DryTop"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "EttinsBack"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "MamnoonLagoon"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "ReedBog"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "SageLands"
					MoveTo(3592, -9535)
					Move(3000, -9480)
					WaitForLoad()
				Case "Silverwood"
					MoveTo(1749, -2666)
					MoveTo(1749, -2666)
					Move(2000, -2122)
					WaitForLoad()
				Case "TangleRoot"
					MoveTo(4989.82, -6268.16)
					MoveTo(6803.63, -8648.35)
					MoveTo(6418.01, -10500.90)
					Move(6212.98, -10712.02)
					WaitForLoad()
				Case "TheFalls"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
			;CrystalDesert
				Case "DivinersAscent"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "ProphetsPath"
					MoveTo(-15651.02, -14838.13)
					Move(-14661 , -14372)
					WaitForLoad()
				Case "SaltFlats"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "SkywardReach"
					MoveTo(-15225.14, 1966.78)
					Move(-15233.08, 2352.49)
					WaitForLoad()
				Case "TheAridSea"
					MoveTo(-15225.14, 1966.78)
					Move(-15233.08, 2352.49)
					WaitForLoad()
				Case "TheScar"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "VultureDrifts"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
			;Kryta
				Case "CursedLands"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "KessexPeak"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "LionsGate"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "MajestysRest"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "NeboTerrace"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "NorthKrytaProvince"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "ScoundrelsRise"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "StingrayStrand"
					GoOutStingrayStrand()
				Case "TalmarkWilderness"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "TearsoftheFallen"
					GoOutTearsoftheFallen()
				Case "TheBlackCurtain"
					MoveTo(-5057.52, 17188.52)
					Move(-5205.00, 15562.00)
					WaitForLoad()
				Case "TwinSerpentLakes"
					MoveTo(-20183, 10506)
					MoveTo(-18896, 12390)
					MoveTo(-16812, 13585)
					Move(-16612, 13585)
					WaitForLoad()
				Case "WatchtowerCoast"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
			;SouthernShiverpeaks
				Case "DreadnoughtsDrift"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "FrozenForest"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "GrenthsFootprint"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "IceFloe"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "Icedome"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "LornarsPass"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "MineralSprings"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "SnakeDance"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "SpearheadPeak"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "TalusChute"
					Move(59.88, 10522.75)
					Sleep(250)
					Move(-25.37, 10672.75)
					WaitForLoad()
				Case "TascasDemise"
					MoveTo(-10522, 17976)
					Move(-9858, 18917)
					WaitForLoad()
				Case "WitmansFolly"
					MoveTo(4869, 3423)
					Move(5800, 1400)
					Sleep(5000)
					WaitForLoad()
			;RingOfFireIsland
				Case "PerditionRock"
					MoveTo(3603, -10090)
					Move(3800, -8600)
					Sleep(1000)
					WaitForLoad()
			;ShingJeaIsland
				Case "HaijuLagoon"
					MoveTo(18839, 13668)
					Move(19100, 14100)
					WaitForLoad()
				Case "JayaBluffs"
					MoveTo(18334, 11324)
					MoveTo(19140, 13382)
					MoveTo(18304, 14969)
					MoveTo(17377, 17188)
					Move(16800, 17550)
					WaitForLoad()
				Case "KinyaProvince"
					MoveTo(14956, 15878)
					Move(14800, 15000)
					WaitForLoad()
				Case "MinisterChosEstate"
					MoveTo(16642, 19493)
					Move(16995, 19739)
					WaitForLoad()
				Case "PanjiangPeninsula"
					MoveTo(-11001, -16229)
					Move(-11501, -17229)
					WaitForLoad()
				Case "SaoshangTrail"
					MoveTo(16589, 13096)
					Move(16200, 13500)
					WaitForLoad()
				Case "SunquaVale"
					MoveTo(-11086, 10149)
					MoveTo(-13860, 10410)
					Move(-15200, 11510)
					WaitForLoad()
				Case "ZenDaijun"
					MoveTo(19571.55, 9977.90)
					GoNearestNPCToCoords(20290.98, 9131.50)
					Sleep (1000)
					Dialog(0x7F)
					Dialog(0x800009)
					Dialog(0x80000B)
					Sleep(1000)
					WaitForLoad()
			;KainengCity
				Case "BukdekByway"
					MoveTo(16567.48, 19462.11)
					Move(16579.60, 19735.57)
					WaitForLoad()
				Case "NahpuiQuarter"
					MoveTo(7574, -16106)
					Move(7400, -17000)
					WaitForLoad()
				Case "PongmeiValley"
					MoveTo(-12095, 12430)
					MoveTo(-13340, 11692)
					Move(-13351, 11081)
					WaitForLoad()
				Case "RaisuPalace"
					MoveTo(-10609, -1451)
					MoveTo(-10472, 1289)
					MoveTo(-9653, 2457)
					Move(-9653, 2757)
					WaitForLoad()
				Case "ShadowsPassage"
					MoveTo(-12290, 7648)
					MoveTo(-12193, 8409)
					Move(-12182, 8800)
					WaitForLoad()
				Case "ShenzunTunnels"
					MoveTo(-14603, 14336)
					MoveTo(-16087, 16510)
					MoveTo(-17399, 16601)
					Move(-17699, 16601)
					WaitForLoad()
				Case "SunjiangDistrict"
					MoveTo(11102, -18577)
					MoveTo(11737, -19551)
					Move(11737, -20100)
					WaitForLoad()
				Case "TahnnakiTemple"
					MoveTo(2742.42, -16465.20)
					Move(2741.71, -16025.93)
					WaitForLoad()
				Case "WajjunBazaar"
					MoveTo(12772, 16449)
					MoveTo(11677, 15441)
					MoveTo(11626, 15390)
					Move(11526, 15290)
					WaitForLoad()
				Case "XaquangSkyway"
					MoveTo(6759, -13421)
					MoveTo(6425, -13162)
					Move(6250, -12900)
					WaitForLoad()
			;Echovald Forest
				Case "Arborstone"
					MoveTo(5521.22, 6597.16)
					Move(6026.74, 7250.39)
					WaitForLoad()
				Case "DrazachThicket"
					MoveTo(-4557, 13723)
					Move(-6300, 14400)
					Sleep(10000)
					WaitForLoad()
				Case "Ferndale"
					MoveTo(7810, -726)
					MoveTo(10042, -1173)
					Move(10446, -1147)
					WaitForLoad()
				Case "MelandrusHope"
					MoveTo(-6677.38, -10055.16)
					Move(-7009.95, -10688.53)
					WaitForLoad()
				Case "MorostavTrail"
					MoveTo(-9715, -3376)
					MoveTo(-11645, -5155)
					MoveTo(-12065, -7488)
					MoveTo(-13751.78, -7651.70)
					Move(-14045.97, -7854.88)
					WaitMapLoading()
				Case "MourningVeilFalls"
					MoveTo(-290.18, 275.96)
					MoveTo(-3076.34, 4103.19)
					MoveTo(-4380.62, 4251.05)
					Move(-4559.24, 4608.69)
					WaitForLoad()
				Case "TheEternalGrove"
					MoveTo(19629.66, 5725.48)
					MoveTo(18761, 2360)
					Move(18400, 2000)
					WaitForLoad()
				;TheJadeSea
				Case "Archipelagos"
					MoveTo(5419, -4307)
					MoveTo(5916, -6569)
					Move(6650, -7500)
					WaitForLoad()
				Case "BoreasSeabed"
					MoveTo(3476, 6599)
					Move(3510, 7400)
					WaitForLoad()
				Case "GyalaHatchery"
					MoveTo(9177, -20845)
					Move(8500, -19800)
					WaitForLoad()
				Case "MaishangHills"
					MoveTo(1059, 23549)
					MoveTo(2750, 24727)
					Move(4300, 25800)
					Sleep(3000)
					WaitForLoad()
				Case "MountQinkai"
					MoveTo(-5206, 13154)
					Move(-5600, 14000)
					WaitForLoad()
				Case "RheasCrater"
					MoveTo(-2623, 6965)
					MoveTo(-5921,6290)
					Move(-6600, 7700)
					WaitForLoad()
				Case "SilentSurf"
					MoveTo(8483, -25600)
					Move(9100, -26300)
					WaitForLoad()
				Case "UnwakingWaters"
					MoveTo(3355.47, 3054.54)
					Move(3355.47, 2300.54)
					WaitForLoad()
				;Istan
				Case "CliffsOfDohjok"
					MoveTo(2572, 1621)
					MoveTo(4300, 4564)
					Move(4400, 4590)
					WaitForLoad()
				Case "FahranurTheFirstCity"
					MoveTo(-3232, 3400)
					MoveTo(-4316, 4419)
					MoveTo(-4380, 4557)
					MoveTo(-4405, 4603)
					Move(-4505, 4803)
					WaitForLoad()
				Case "IssnurIsles"
					MoveTo(-16011, 11304)
					Move(-15700, 11304)
					WaitForLoad()
				Case "LahtendaBog"
					MoveTo(1873, -460)
					MoveTo(227, -3402)
					MoveTo(298, -4114)
					Move(298, -4500)
					WaitForLoad()
				Case "MehtaniKeys"
					MoveTo(303, -1560)
					MoveTo(3926, -3966)
					MoveTo(4286, -3765)
					Move(4500, -3765)
					WaitForLoad()
				Case "PlainsofJarin"
					MoveTo(-9259, 16725)
					Move(-9300, 17000)
					WaitForLoad()
				Case "ZehlonReach"
					MoveTo(3511, 1930)
					MoveTo(4225, 4510)
					MoveTo(4455, 4479)
					Move(4550, 4479)
					WaitForLoad()

				;Kourna
				Case "ArkjokWard"
					MoveTo(-470, -3677)
					MoveTo(2061, -3136)
					MoveTo(2522, 440)
					MoveTo(4316, 811)
					Move(4400, 837)
					WaitForLoad()
				Case "BahdokCaverns"
					MoveTo(-13756, -11190)
					GoNearestNPCToCoords(-13647, -10442)
					Sleep (1000)
					Dialog(0x00000081)
					Dialog(0x00000084)
					WaitForLoad()
				Case "BarbarousShore"
					MoveTo(-14174, 18358)
					Move(-13900, 18250)
					WaitForLoad()
				Case "DejarinEstate"
					MoveTo(3715, 2181)
					MoveTo(4451, 3557)
					Move(4550, 3710)
					WaitForLoad()
				Case "GandaraTheMoonFortress"
					MoveTo(3860, -1719)
					MoveTo(2706, -4708)
					Move(2580, -4950)
					WaitForLoad()
				Case "JahaiBluffs"
					MoveTo(-2596, 2279)
					MoveTo(-4807, 4228)
					Move(-4950, 4400)
					WaitForLoad()
				Case "MargaCoast"
					MoveTo(-3144, 4512)
					MoveTo(-4829, 4923)
					MoveTo(-4911, 4913)
					Move(-4950, 4913)
					WaitForLoad()
				Case "SunwardMarches"
					MoveTo(23271, 14344)
					Move(23000, 14100)
					WaitForLoad()
				Case "TheFloodplainOfMahnkelon"
					MoveTo(2369, 3332)
					MoveTo(4406, 4058)
					Move(4800, 4600)
					WaitForLoad()
				Case "TuraisProcession"
					MoveTo(26313, 16414)
					Move(26250, 16700)
					WaitForLoad()

				;Vabbi
				Case "ForumHighlands"
					MoveTo(4572, -4533)
					Move(4772, -4533)
					WaitForLoad()
				Case "GardenOfSeborhin"
					MoveTo(-1896, 14429)
					MoveTo(-2029, 14479)
					Move(-2100, 14479)
					WaitForLoad()
				Case "HoldingsOfChokhin"
					MoveTo(4, 2715)
					MoveTo(-386, 4527)
					Move(-450, 4530)
					WaitForLoad()
				Case "ResplendentMakuun"
					MoveTo(-16849, 15501)
					MoveTo(-18803, 14777)
					MoveTo(-18745, 13593)
					Move(-18700, 13593)
					WaitForLoad()
				Case "TheHiddenCityOfAhdashim"
					MoveTo(1387, -20884)
					GoNearestNPCToCoords(1339, -20418)
					Sleep (1000)
					Dialog(0x00000081)
					Dialog(0x00000084)
					Sleep(1000)
					WaitForLoad()
				Case "TheMirrorOfLyss"
					MoveTo(-3336, 1102)
					MoveTo(-891, 4438)
					MoveTo(-884, 4509)
					Move(-883.08, 4698.31)
					WaitForLoad()
				Case "VehjinMines"
					MoveTo(-2259, -78)
					MoveTo(-4384, -2575)
					MoveTo(-4544, -2571)
					Move(-4684, -2571)
					WaitForLoad()
				Case "VehtendiValley"
					MoveTo(-1564, -2064)
					MoveTo(2447, -2438)
					MoveTo(2520, -4458)
					MoveTo(4337, -4834)
					Move(4550, -4834)
					WaitForLoad()
				Case "WildernessOfBahdza"
					MoveTo(4537, 1365)
					MoveTo(4783, 1220)
					Move(4983, 1220)
					WaitForLoad()
				Case "YatendiCanyons"
					MoveTo(-1846, 920)
					MoveTo(-4616, -1382)
					Move(-4850, -1388)
					WaitForLoad()

			;TheDesolation
				Case "CrystalOverlook"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "JokosDomain"
					MoveTo(-644.45 1389.03)
					Move(1170.35, 4705.75)
					WaitForLoad()
				Case "PoisonedOutcrops"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "TheAlkaliPan"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "TheRupturedHeart"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "TheShatteredRavines"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "TheSulfurousWastes"
					MoveTo(903, 345)
					MoveTo(-3659, 3475)
					MoveTo(-4758, 4639)
					Move(-4858, 4639)
					WaitForLoad()

			;CharrHomelands
				Case "DaladaUplands"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "GrothmarWardowns"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "SacnothValley"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
			;FarShiverpeaks
				Case "BjoraMarches"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "DrakkarLake"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "IceCliffChasms"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "JagaMoraine"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "NorrhartDomains"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "VarajarFells"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				;TarnishedCoast
				Case "ArborBay"
					MoveTo(16129.67, 14160.49)
					Move(15545.26, 12675.66)
					RndSleep(2000)
					WaitForLoad()
				Case "AlcaziaTangle"
					MoveTo(20665.88, -11510.13)
					RndSleep(250)
					Move(19218.17, -10843.86)
					RndSleep(3000)
					WaitForLoad()
				Case "MagusStones"
					MoveTo(16448.44, 14224.86)
					RndSleep(500)
					Move(16183.18, 13655.50)
					RndSleep(3000)
					WaitForLoad()
				Case "RivenEarth"
					MoveTo(19623, 16850)
					Move(20300, 16850)
					WaitForLoad()
				Case "SparkflySwamp"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
				Case "VerdantCascades"
					MoveTo(1683, -1594)
					Move(4600, -27863)
					WaitForLoad()
			EndSwitch
			Sleep(2000)
		Until GetMapID() = $Map_To_Farm
	EndFunc

	Func InitSave()
	;@ScriptDir & "\Build_Team"
    Local $ini_file, $workingdir
	Switch (@GUI_CtrlId)
		Case $GUISaveHeroButton
    $workingdir = @WorkingDir
    $ini_file = FileSaveDialog('Save', @ScriptDir & "\Build_Team", 'Ini (*.ini)|All (*.*)', 10, 'Hero.ini', $Master_Vanquisher)
    If @error Or $ini_file == '' Then
        FileChangeDir($workingdir)
        Return SetError(1, 0, '')
    EndIf
			IniWrite($ini_file, "Use Hero:", "1", GUICtrlRead($COMBO_HERO1))
			IniWrite($ini_file, "Use Hero:", "2", GUICtrlRead($COMBO_HERO2))
			IniWrite($ini_file, "Use Hero:", "3", GUICtrlRead($COMBO_HERO3))
			IniWrite($ini_file, "Use Hero:", "4", GUICtrlRead($COMBO_HERO4))
			IniWrite($ini_file, "Use Hero:", "5", GUICtrlRead($COMBO_HERO5))
			IniWrite($ini_file, "Use Hero:", "6", GUICtrlRead($COMBO_HERO6))
			IniWrite($ini_file, "Use Hero:", "7", GUICtrlRead($COMBO_HERO7))
		FileChangeDir($workingdir)
	EndSwitch
EndFunc

