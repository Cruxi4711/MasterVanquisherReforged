#RequireAdmin
#NoTrayIcon
#include "app\Core\Linker.au3"

global $DeadOnTheRun = 0
Global $GWA_CONST_UnyieldingAura=268
Global $SS_begin, $LB_begin, $Asura_begin, $Deldrimor_begin, $Norn_begin, $Vanguard_begin, $Kurzick_begin, $Luxon_begin
Global $Map_To_Zone, $Map_To_Farm
Global $PartySize = 0
Global $what_we_donate = 0
Global $Abandonquest = False


While 1
	If $boolrun = true Then
		If $NumberRun = 0 Then ;first run
			AdlibRegister("status", 1000)
			$TimerTotal = TimerInit()
			$SS_begin = GetSunspearTitle()
			$LB_begin = GetLightbringerTitle()
			$Asura_begin = GetAsuraTitle()
			$Deldrimor_begin = GetDeldrimorTitle()
			$Norn_begin = GetNornTitle()
			$Vanguard_begin = GetVanguardTitle()
			$Kurzick_begin =  GetKurzickFaction()
			$Luxon_begin = GetLuxonFaction()

			Switch $Title
				Case "AscalonFoothills"
					$Map_To_Zone = $AscalonFoothills_Outpost
					$Map_To_Farm = $AscalonFoothills_Map
				Case "DiessaLowlands"
					$Map_To_Zone = $DiessaLowlands_Outpost
					$Map_To_Farm = $DiessaLowlands_Map
				Case "DragonsGullet"
					$Map_To_Zone = $DragonsGullet_Outpost
					$Map_To_Farm = $DragonsGullet_Map
				Case "EasternFrontier"
					$Map_To_Zone = $EasternFrontier_Outpost
					$Map_To_Farm = $EasternFrontier_Map
				Case "FlameTempleCorridor"
					$Map_To_Zone = $FlameTempleCorridor_Outpost
					$Map_To_Farm = $FlameTempleCorridor_Map
				Case "OldAscalon"
					$Map_To_Zone = $OldAscalon_Outpost
					$Map_To_Farm = $OldAscalon_Map
				Case "PockmarkFlats"
					$Map_To_Zone = $PockmarkFlats_Outpost
					$Map_To_Farm = $PockmarkFlats_Map
				Case "RegentValley"
					$Map_To_Zone = $RegentValley_Outpost
					$Map_To_Farm = $RegentValley_Map
				Case "TheBreach"
					$Map_To_Zone = $TheBreach_Outpost
					$Map_To_Farm = $TheBreach_Map
				Case "AnvilRock"
					$Map_To_Zone = $AnvilRock_Outpost
					$Map_To_Farm = $AnvilRock_Map
				Case "DeldrimorBowl"
					$Map_To_Zone = $DeldrimorBowl_Outpost
					$Map_To_Farm = $DeldrimorBowl_Map
				Case "GriffonsMouth"
					$Map_To_Zone = $GriffonsMouth_Outpost
					$Map_To_Farm = $GriffonsMouth_Map
				Case "IronHorseMine"
					$Map_To_Zone = $IronHorseMine_Outpost
					$Map_To_Farm = $IronHorseMine_Map
				Case "TravelersVale"
					$Map_To_Zone = $TravelersVale_Outpost
					$Map_To_Farm = $TravelersVale_Map
				Case "DryTop"
					$Map_To_Zone = $DryTop_Outpost
					$Map_To_Farm = $DryTop_Map
				Case "EttinsBack"
					$Map_To_Zone = $EttinsBack_Outpost
					$Map_To_Farm = $EttinsBack_Map
				Case "MamnoonLagoon"
					$Map_To_Zone = $MamnoonLagoon_Outpost
					$Map_To_Farm = $MamnoonLagoon_Map
				Case "ReedBog"
					$Map_To_Zone = $ReedBog_Outpost
					$Map_To_Farm = $ReedBog_Map
				Case "SageLands"
					$Map_To_Zone = $SageLands_Outpost
					$Map_To_Farm = $SageLands_Map
				Case "Silverwood"
					$Map_To_Zone = $Silverwood_Outpost
					$Map_To_Farm = $Silverwood_Map
				Case "TangleRoot"
					$Map_To_Zone = $TangleRoot_Outpost
					$Map_To_Farm = $TangleRoot_Map
				Case "TheFalls"
					$Map_To_Zone = $TheFalls_Outpost
					$Map_To_Farm = $TheFalls_Map
				Case "DivinersAscent"
					$Map_To_Zone = $DivinersAscent_Outpost
					$Map_To_Farm = $DivinersAscent_Map
				Case "ProphetsPath"
					$Map_To_Zone = $ProphetsPath_Outpost
					$Map_To_Farm = $ProphetsPath_Map
				Case "SaltFlats"
					$Map_To_Zone = $SaltFlats_Outpost
					$Map_To_Farm = $SaltFlats_Map
				Case "SkywardReach"
					$Map_To_Zone = $SkywardReach_Outpost
					$Map_To_Farm = $SkywardReach_Map
				Case "TheAridSea"
					$Map_To_Zone = $SkywardReach_Outpost
					$Map_To_Farm = $SkywardReach_Map
				Case "TheScar"
					$Map_To_Zone = $TheScar_Outpost
					$Map_To_Farm = $TheScar_Map
				Case "VultureDrifts"
					$Map_To_Zone = $VultureDrifts_Outpost
					$Map_To_Farm = $VultureDrifts_Map
				Case "CursedLands"
					$Map_To_Zone = $CursedLands_Outpost
					$Map_To_Farm = $CursedLands_Map
				Case "KessexPeak"
					$Map_To_Zone = $KessexPeak_Outpost
					$Map_To_Farm = $KessexPeak_Map
				Case "MajestysRest"
					$Map_To_Zone = $MajestysRest_Outpost
					$Map_To_Farm = $MajestysRest_Map
				Case "NeboTerrace"
					$Map_To_Zone = $NeboTerrace_Outpost
					$Map_To_Farm = $NeboTerrace_Map
				Case "NorthKrytaProvince"
					$Map_To_Zone = $NorthKrytaProvince_Outpost
					$Map_To_Farm = $NorthKrytaProvince_Map
				Case "ScoundrelsRise"
					$Map_To_Zone = $ScoundrelsRise_Outpost
					$Map_To_Farm = $ScoundrelsRise_Map
				Case "StingrayStrand"
					$Map_To_Zone = $StingrayStrand_Outpost
					$Map_To_Farm = $StingrayStrand_Map
				Case "TalmarkWilderness"
					$Map_To_Zone = $TalmarkWilderness_Outpost
					$Map_To_Farm = $TalmarkWilderness_Map
				Case "TearsoftheFallen"
					$Map_To_Zone = $TearsoftheFallen_Outpost
					$Map_To_Farm = $TearsoftheFallen_Map
				Case "TheBlackCurtain"
					$Map_To_Zone = $TheBlackCurtain_Outpost
					$Map_To_Farm = $TheBlackCurtain_Map
				Case "TwinSerpentLakes"
					$Map_To_Zone = $TwinSerpentLakes_Outpost
					$Map_To_Farm = $TwinSerpentLakes_Map
				Case "WatchtowerCoast"
					$Map_To_Zone = $WatchtowerCoast_Outpost
					$Map_To_Farm = $WatchtowerCoast_Map
				Case "DreadnoughtsDrift"
					$Map_To_Zone = $DreadnoughtsDrift_Outpost
					$Map_To_Farm = $DreadnoughtsDrift_Map
				Case "FrozenForest"
					$Map_To_Zone = $FrozenForest_Outpost
					$Map_To_Farm = $FrozenForest_Map
				Case "GrenthsFootprint"
					$Map_To_Zone = $GrenthsFootprint_Outpost
					$Map_To_Farm = $GrenthsFootprint_Map
				Case "IceFloe"
					$Map_To_Zone = $IceFloe_Outpost
					$Map_To_Farm = $IceFloe_Map
				Case "Icedome"
					$Map_To_Zone = $Icedome_Outpost
					$Map_To_Farm = $Icedome_Map
				Case "LornarsPass"
					$Map_To_Zone = $LornarsPass_Outpost
					$Map_To_Farm = $LornarsPass_Map
				Case "MineralSprings"
					$Map_To_Zone = $MineralSprings_Outpost
					$Map_To_Farm = $MineralSprings_Map
				Case "SnakeDance"
					$Map_To_Zone = $SnakeDance_Outpost
					$Map_To_Farm = $SnakeDance_Map
				Case "SpearheadPeak"
					$Map_To_Zone = $SpearheadPeak_Outpost
					$Map_To_Farm = $SpearheadPeak_Map
				Case "TalusChute"
					$Map_To_Zone = $TalusChute_Outpost
					$Map_To_Farm = $TalusChute_Map
				Case "TascasDemise"
					$Map_To_Zone = $TascasDemise_Outpost
					$Map_To_Farm = $TascasDemise_Map
				Case "WitmansFolly"
					$Map_To_Zone = $WitmansFolly_Outpost
					$Map_To_Farm = $WitmansFolly_Map
				Case "HaijuLagoon"
					$Map_To_Zone = $HaijuLagoon_Outpost
					$Map_To_Farm = $HaijuLagoon_Map
				Case "JayaBluffs"
					$Map_To_Zone = $JayaBluffs_Outpost
					$Map_To_Farm = $JayaBluffs_Map
				Case "KinyaProvince"
					$Map_To_Zone = $KinyaProvince_Outpost
					$Map_To_Farm = $KinyaProvince_Map
				Case "MinisterChosEstate"
					$Map_To_Zone = $RanMusuGardens_OutPost
					$Map_To_Farm = $MinisterChosEstate_Map
				Case "PanjiangPeninsula"
					$Map_To_Zone = $PanjiangPeninsula_Outpost
					$Map_To_Farm = $PanjiangPeninsula_Map
				Case "SaoshangTrail"
					$Map_To_Zone = $SaoshangTrail_Outpost
					$Map_To_Farm = $SaoshangTrail_Map
				Case "SunquaVale"
					$Map_To_Zone = $SunquaVale_Outpost
					$Map_To_Farm = $SunquaVale_Map
				Case "ZenDaijun"
					$Map_To_Zone = $ZenDaijun_Outpost
					$Map_To_Farm = $ZenDaijun_Map
				Case "BukdekByway"
					$Map_To_Zone = $BukdekByway_Outpost
					$Map_To_Farm = $BukdekByway_Map
				Case "NahpuiQuarter"
					$Map_To_Zone = $NahpuiQuarter_Outpost
					$Map_To_Farm = $NahpuiQuarter_Map
				Case "PongmeiValley"
					$Map_To_Zone = $PongmeiValley_Outpost
					$Map_To_Farm = $PongmeiValley_Map
				Case "RaisuPalace"
					$Map_To_Zone = $RaisuPalace_Outpost
					$Map_To_Farm = $RaisuPalace_Map
				Case "ShadowsPassage"
					$Map_To_Zone = $ShadowsPassage_Outpost
					$Map_To_Farm = $ShadowsPassage_Map
				Case "ShenzunTunnels"
					$Map_To_Zone = $ShenzunTunnels_Outpost
					$Map_To_Farm = $ShenzunTunnels_Map
				Case "SunjiangDistrict"
					$Map_To_Zone = $SunjiangDistrict_Outpost
					$Map_To_Farm = $SunjiangDistrict_Map
				Case "TahnnakiTemple"
					$Map_To_Zone = $TahnnakiTemple_Outpost
					$Map_To_Farm = $TahnnakiTemple_Map
				Case "WajjunBazaar"
					$Map_To_Zone = $WajjunBazaar_Outpost
					$Map_To_Farm = $WajjunBazaar_Map
				Case "XaquangSkyway"
					$Map_To_Zone = $XaquangSkyway_Outpost
					$Map_To_Farm = $XaquangSkyway_Map
				Case "Arborstone"
					$Map_To_Zone = $Arborstone_Outpost
					$Map_To_Farm = $Arborstone_Map
				Case "DrazachThicket"
					$Map_To_Zone = $DrazachThicket_Outpost
					$Map_To_Farm = $DrazachThicket_Map
				Case "Ferndale"
					$Map_To_Zone = $Ferndale_Outpost
					$Map_To_Farm = $Ferndale_Map
				Case "MelandrusHope"
					$Map_To_Zone = $MelandrusHope_Outpost
					$Map_To_Farm = $MelandrusHope_Map
				Case "MorostavTrail"
					$Map_To_Zone = $MorostavTrail_Outpost
					$Map_To_Farm = $MorostavTrail_Map
				Case "MourningVeilFalls"
					$Map_To_Zone = $MourningVeilFalls_Outpost
					$Map_To_Farm = $MourningVeilFalls_Map
				Case "TheEternalGrove"
					$Map_To_Zone = $TheEternalGrove_Outpost
					$Map_To_Farm = $TheEternalGrove_Map
				Case "Archipelagos"
					$Map_To_Zone = $Archipelagos_Outpost
					$Map_To_Farm = $Archipelagos_Map
				Case "BoreasSeabed"
					$Map_To_Zone = $BoreasSeabed_Outpost
					$Map_To_Farm = $BoreasSeabed_Map
				Case "GyalaHatchery"
					$Map_To_Zone = $GyalaHatchery_Outpost
					$Map_To_Farm = $GyalaHatchery_Map
				Case "MaishangHills"
					$Map_To_Zone = $MaishangHills_Outpost
					$Map_To_Farm = $MaishangHills_Map
				Case "MountQinkai"
					$Map_To_Zone = $MountQinkai_Outpost
					$Map_To_Farm = $MountQinkai_Map
				Case "RheasCrater"
					$Map_To_Zone = $RheasCrater_Outpost
					$Map_To_Farm = $RheasCrater_Map
				Case "SilentSurf"
					$Map_To_Zone = $SilentSurf_Outpost
					$Map_To_Farm = $SilentSurf_Map
				Case "UnwakingWaters"
					$Map_To_Zone = $UnwakingWaters_Outpost
					$Map_To_Farm = $UnwakingWaters_Map
				Case "CliffsOfDohjok"
					$Map_To_Zone = $CliffsOfDohjok_Outpost
					$Map_To_Farm = $CliffsOfDohjok_Map
				Case "FahranurTheFirstCity"
					$Map_To_Zone = $FahranurTheFirstCity_Outpost
					$Map_To_Farm = $FahranurTheFirstCity_Map
				Case "IssnurIsles"
					$Map_To_Zone = $IssnurIsles_Outpost
					$Map_To_Farm = $IssnurIsles_Map
				Case "LahtendaBog"
					$Map_To_Zone = $LahtendaBog_Outpost
					$Map_To_Farm = $LahtendaBog_Map
				Case "MehtaniKeys"
					$Map_To_Zone = $MehtaniKeys_Outpost
					$Map_To_Farm = $MehtaniKeys_Map
				Case "PlainsofJarin"
					$Map_To_Zone = $PlainsofJarin_Outpost
					$Map_To_Farm = $PlainsofJarin_Map
				Case "ZehlonReach"
					$Map_To_Zone = $ZehlonReach_Outpost
					$Map_To_Farm = $ZehlonReach_Map
				Case "ArkjokWard"
					$Map_To_Zone = $ArkjokWard_Outpost
					$Map_To_Farm = $ArkjokWard_Map
				Case "BahdokCaverns"
					$Map_To_Zone = $BahdokCaverns_Outpost
					$Map_To_Farm = $BahdokCaverns_Map
				Case "BarbarousShore"
					$Map_To_Zone = $BarbarousShore_Outpost
					$Map_To_Farm = $BarbarousShore_Map
				Case "DejarinEstate"
					$Map_To_Zone = $DejarinEstate_Outpost
					$Map_To_Farm = $DejarinEstate_Map
				Case "GandaraTheMoonFortress"
					$Map_To_Zone = $GandaraTheMoonFortress_Outpost
					$Map_To_Farm = $GandaraTheMoonFortress_Map
				Case "JahaiBluffs"
					$Map_To_Zone = $JahaiBluffs_Outpost
					$Map_To_Farm = $JahaiBluffs_Map
				Case "MargaCoast"
					$Map_To_Zone = $MargaCoast_Outpost
					$Map_To_Farm = $MargaCoast_Map
				Case "SunwardMarches"
					$Map_To_Zone = $SunwardMarches_Outpost
					$Map_To_Farm = $SunwardMarches_Map
				Case "TheFloodplainOfMahnkelon"
					$Map_To_Zone = $TheFloodplainOfMahnkelon_Outpost
					$Map_To_Farm = $TheFloodplainOfMahnkelon_Map
				Case "TuraisProcession"
					$Map_To_Zone = $TuraisProcession_Outpost
					$Map_To_Farm = $TuraisProcession_Map
				Case "ForumHighlands"
					$Map_To_Zone = $ForumHighlands_Outpost
					$Map_To_Farm = $ForumHighlands_Map
				Case "GardenOfSeborhin"
					$Map_To_Zone = $GardenOfSeborhin_Outpost
					$Map_To_Farm = $GardenOfSeborhin_Map
				Case "HoldingsOfChokhin"
					$Map_To_Zone = $HoldingsOfChokhin_Outpost
					$Map_To_Farm = $HoldingsOfChokhin_Map
				Case "ResplendentMakuun"
					$Map_To_Zone = $ResplendentMakuun_Outpost
					$Map_To_Farm = $ResplendentMakuun_Map
				Case "TheHiddenCityOfAhdashim"
					$Map_To_Zone = $TheHiddenCityOfAhdashim_Outpost
					$Map_To_Farm = $TheHiddenCityOfAhdashim_Map
				Case "TheMirrorOfLyss"
					$Map_To_Zone = $TheMirrorOfLyss_Outpost
					$Map_To_Farm = $TheMirrorOfLyss_Map
				Case "VehjinMines"
					$Map_To_Zone = $VehjinMines_Outpost
					$Map_To_Farm = $VehjinMines_Map
				Case "VehtendiValley"
					$Map_To_Zone = $VehtendiValley_Outpost
					$Map_To_Farm = $VehtendiValley_Map
				Case "WildernessOfBahdza"
					$Map_To_Zone = $WildernessOfBahdza_Outpost
					$Map_To_Farm = $WildernessOfBahdza_Map
				Case "YatendiCanyons"
					$Map_To_Zone = $YatendiCanyons_Outpost
					$Map_To_Farm = $YatendiCanyons_Map
				Case "CrystalOverlook"
					$Map_To_Zone = $CrystalOverlook_Outpost
					$Map_To_Farm = $CrystalOverlook_Map
				Case "JokosDomain"
					$Map_To_Zone = $JokosDomain_Outpost
					$Map_To_Farm = $JokosDomain_Map
				Case "PoisonedOutcrops"
					$Map_To_Zone = $PoisonedOutcrops_Outpost
					$Map_To_Farm = $PoisonedOutcrops_Map
				Case "TheAlkaliPan"
					$Map_To_Zone = $TheAlkaliPan_Outpost
					$Map_To_Farm = $TheAlkaliPan_Map
				Case "TheRupturedHeart"
					$Map_To_Zone = $TheRupturedHeart_Outpost
					$Map_To_Farm = $TheRupturedHeart_Map
				Case "TheShatteredRavines"
					$Map_To_Zone = $TheShatteredRavines_Outpost
					$Map_To_Farm = $TheShatteredRavines_Map
				Case "TheSulfurousWastes"
					$Map_To_Zone = $TheSulfurousWastes_Outpost
					$Map_To_Farm = $TheSulfurousWastes_Map
				Case "DaladaUplands"
					$Map_To_Zone = $DaladaUplands_Outpost
					$Map_To_Farm = $DaladaUplands_Map
				Case "GrothmarWardowns"
					$Map_To_Zone = $GrothmarWardowns_Outpost
					$Map_To_Farm = $GrothmarWardowns_Map
				Case "SacnothValley"
					$Map_To_Zone = $SacnothValley_Outpost
					$Map_To_Farm = $SacnothValley_Map
				Case "BjoraMarches"
					$Map_To_Zone = $BjoraMarches_Outpost
					$Map_To_Farm = $BjoraMarches_Map
				Case "DrakkarLake"
					$Map_To_Zone = $DrakkarLake_Outpost
					$Map_To_Farm = $DrakkarLake_Map
				Case "IceCliffChasms"
					$Map_To_Zone = $IceCliffChasms_Outpost
					$Map_To_Farm = $IceCliffChasms_Map
				Case "JagaMoraine"
					$Map_To_Zone = $JagaMoraine_Outpost
					$Map_To_Farm = $JagaMoraine_Map
				Case "NorrhartDomains"
					$Map_To_Zone = $NorrhartDomains_Outpost
					$Map_To_Farm = $NorrhartDomains_Map
				Case "VarajarFells"
					$Map_To_Zone = $VarajarFells_Outpost
					$Map_To_Farm = $VarajarFells_Map
				Case "ArborBay"
					$Map_To_Zone = $ArborBay_Outpost
					$Map_To_Farm = $ArborBay_Map
				Case "AlcaziaTangle"
					$Map_To_Zone = $AlcaziaTangle_Outpost
					$Map_To_Farm = $AlcaziaTangle_Map
				Case "MagusStones"
					$Map_To_Zone = $MagusStones_Outpost
					$Map_To_Farm = $MagusStones_Map
				Case "RivenEarth"
					$Map_To_Zone = $RivenEarth_Outpost
					$Map_To_Farm = $RivenEarth_Map
				Case "SparkflySwamp"
					$Map_To_Zone = $SparkflySwamp_Outpost
					$Map_To_Farm = $SparkflySwamp_Map
				Case "VerdantCascades"
					$Map_To_Zone = $VerdantCascades_Outpost
					$Map_To_Farm = $VerdantCascades_Map
				Case "PerditionRock"
					$Map_To_Zone = $PerditionRock_Outpost
					$Map_To_Farm = $PerditionRock_Map
			EndSwitch

			;KURZICK AND LUXON DONATION
			Switch $Title
				Case "Archipelagos", "BoreasSeabed", "GyalaHatchery", "MaishangHills", "MountQinkai", "RheasCrater", "SilentSurf", "UnwakingWaters"
					If $Bool_Donate Then MsgBox(48, "Warning", "You tick donate button, be sure you are in a Luxon guild and you are also able to speak to the merchant in the outpost.")
				Case "Arborstone", "DrazachThicket", "Ferndale", "MelandrusHope", "MorostavTrail", "MourningVeilFalls", "TheEternalGrove"
					If $Bool_Donate Then MsgBox(48, "Warning", "You tick donate button, be sure you are in a Kurzick guild and you are also able to speak to the merchant in the outpost.")
			EndSwitch

		EndIf ; first-run setup ($NumberRun = 0)

		CurrentAction("Begin run number " & $NumberRun)

			If GetMapID() == $Map_To_Farm Then
				If Death() = 1 Or GetIsDead(-2) Then
					CurrentAction("In farm map while dead — evaluating wipe state.")
					CheckDeath()
					If Death() = 1 Or GetIsDead(-2) Then CurrentAction("Recoverable death state — waiting for revive/shrine.")
				Else
					CurrentAction("Already in Map, starting Vanquish.")
				EndIf
			ElseIf GetMapID() == $Map_To_Zone Then
				CurrentAction("Already in Outpost, heading out.")
				_Vanquisher_ApplyDifficulty()
				GoOut()
			Else
				CurrentAction("Zoning to Outpost")
				local $out = 0
				Do
					RndTravel($Map_To_Zone)
					WaitForLoad()
					$out = $out + 1
				Until GetMapID() = $Map_To_Zone or $out = 6
				_Vanquisher_ApplyDifficulty()
				GoOut()
			EndIf

			If GetMapID() = $Map_To_Farm Then
				_Vanquisher_RefreshVanquishBaseline()
				_Vanquisher_ApplyConsumables(True)
			Else
				Sleep(3000)
			EndIf
			UpdateVanquish()

			Switch $Title
				Case "Arborstone"
					If FactionCheckKurzick() Then TurnInFactionKurzick()
				Case "DrazachThicket"
					If FactionCheckKurzick() Then TurnInFactionKurzick()
				Case "Ferndale"
					If FactionCheckKurzick() Then TurnInFactionKurzick()
				Case "MelandrusHope"
					If FactionCheckKurzick() Then TurnInFactionKurzick()
				Case "MorostavTrail"
					If FactionCheckKurzick() Then TurnInFactionKurzick()
				Case "MourningVeilFalls"
					If FactionCheckKurzick() Then TurnInFactionKurzick()
				Case "TheEternalGrove"
					If FactionCheckKurzick() Then TurnInFactionKurzick()
				Case "Archipelagos"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
				Case "BoreasSeabed"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
				Case "GyalaHatchery"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
				Case "MaishangHills"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
				Case "MountQinkai"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
				Case "RheasCrater"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
				Case "SilentSurf"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
				Case "UnwakingWaters"
					If FactionCheckLuxon() Then TurnInFactionLuxon()
			EndSwitch

			If GetMapID() = $Map_To_Farm Or GetMapID() = $Map_To_Zone Then
				If _Vanquisher_ShouldRunRoute() Then
					VQ()
				Else
					CurrentAction("Vanquish complete — skipping route.")
				EndIf
			Else
				CurrentAction("Wrong map (id " & GetMapID() & ", need farm " & $Map_To_Farm & " or outpost " & $Map_To_Zone & ").")
			EndIf
			UpdateVanquish()
			If $g_b_Vanquisher_RunFinished Then
				CurrentAction("Vanquish already finished this run.")
			ElseIf GetAreaVanquished() Then
				_Vanquisher_FinishRun()
			ElseIf _Vanquisher_IsVanquishIncomplete() And GetMapID() = $Map_To_Farm Then
				CurrentAction("Vanquish incomplete — " & GetFoesKilled() & " killed, " & GetFoesToKill() & " remaining. Returning to outpost to retry.")
				_Vanquisher_ReturnToOutpost()
			ElseIf GetMapID() = $Map_To_Farm Then
				CurrentAction("Run finished — " & GetFoesKilled() & " killed, " & GetFoesToKill() & " remaining.")
			EndIf

			$NumberRun = $NumberRun +1

		Sleep(50)

	EndIf
WEnd

Func FactionCheckKurzick()
	CurrentAction("Checking faction")
	RndSleep(250)
	If $Bool_Donate Then
		Return GetKurzickFaction() >= $VANQUISHER_FACTION_DONATE_MIN
	EndIf
	If GetKurzickFaction() > GetMaxKurzickFaction() - 20000 Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func TurnInFactionKurzick()
	RndTravel(77)
	WaitForLoad()
	CurrentAction("Turning in faction")
	GoNearestNPCToCoords(5390, 1524)

	$beforedone = GetKurzickFaction()

	If $Bool_Donate Then
		Do
			CurrentAction("Donate")
			DonateFaction("kurzick")
			RndSleep(500)
		Until GetKurzickFaction() < $VANQUISHER_FACTION_DONATE_CHUNK
	Else
		CurrentAction("Donating Kurzick Faction for Guild")
		Dialog(131)
		RndSleep(550)
		$temp = Floor(GetKurzickFaction() / 5000)
		$id = 8388609 + ($temp * 256)
		Dialog($id)
        RndSleep(550)
	EndIf

	$after_donate = GetKurzickFaction()
	$what_we_donate = $beforedone - $after_donate + $what_we_donate
	RndSleep(500)
EndFunc

Func FactionCheckLuxon()
	CurrentAction("Check Luxon point atm")
	RndSleep(250)
	If $Bool_Donate Then
		Return GetLuxonFaction() >= $VANQUISHER_FACTION_DONATE_MIN
	EndIf
	If GetLuxonFaction() > GetMaxLuxonFaction() - 20000 Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func TurnInFactionLuxon()
	RndTravel(193)
	WaitForLoad()
	CurrentAction("grabing")
	GoNearestNPCToCoords(9076, -1111)

	$beforedone = GetLuxonFaction()

	If $Bool_Donate Then
		Do
			CurrentAction("Donate")
			DonateFaction("luxon")
			RndSleep(250)
		Until GetLuxonFaction() < $VANQUISHER_FACTION_DONATE_CHUNK
	Else
		CurrentAction("Grabbing Jade Shards")
		Dialog(131)
		RndSleep(500)
		$temp = Floor(GetLuxonFaction() / 5000)
		$id = 8388609 + ($temp * 256)
		Dialog($id)
	EndIf
	RndSleep(500)
	$after_donate = GetLuxonFaction()
	$what_we_donate = $beforedone - $after_donate + $what_we_donate
	RndSleep(500)
	RndTravel(389)
	WaitForLoad()
EndFunc

Func status()
	$time = TimerDiff($TimerTotal)
	$string = StringFormat("min: %03u  sec: %02u ", $time/1000/60, Mod($time/1000,60))
	;GUICtrlSetData($label_stat, $string)
EndFunc    ;==>status

Func _Vanquisher_BoolText($a_b_Value)
	Return ($a_b_Value) ? "True" : "False"
EndFunc

Func _Vanquisher_GetCurrentDeathPenalty()
	Local $l_i_Morale = Party_GetMoraleInfo(-2, "Morale")
	If $l_i_Morale >= 0 Then Return 0
	Return Abs(Int($l_i_Morale))
EndFunc

Func _Vanquisher_HasRevivePathAlive()
	Return Not GetPartyDead()
EndFunc

Func _Vanquisher_EvaluateWipeState(ByRef $isPlayerDead, ByRef $isPartyWiped, ByRef $isShrineRespawn, ByRef $currentDeathPenalty, ByRef $canRecover)
	Local $l_b_IsExplorable = Map_GetInstanceInfo("IsExplorable")
	Local $l_b_RevivePathAlive = _Vanquisher_HasRevivePathAlive()

	$isPlayerDead = (Death() = 1 Or GetIsDead(-2))
	$isPartyWiped = ($isPlayerDead And Not $l_b_RevivePathAlive)
	$isShrineRespawn = ($l_b_IsExplorable And $g_b_Vanquisher_LastPlayerDead And Not $isPlayerDead)
	$currentDeathPenalty = _Vanquisher_GetCurrentDeathPenalty()
	$canRecover = ($l_b_RevivePathAlive Or $isShrineRespawn Or $g_b_Vanquisher_ShrineRecoveryActive Or ($isPlayerDead And $currentDeathPenalty < 60))
EndFunc

Func CheckDeath()
	If Map_GetInstanceInfo("IsLoading") Then Return

	Local $isPlayerDead = False
	Local $isPartyWiped = False
	Local $isShrineRespawn = False
	Local $currentDeathPenalty = 0
	Local $canRecover = False
	_Vanquisher_EvaluateWipeState($isPlayerDead, $isPartyWiped, $isShrineRespawn, $currentDeathPenalty, $canRecover)

	If $g_i_Vanquisher_LastDeathPenalty < 0 Then
		CurrentAction("DP snapshot: " & $currentDeathPenalty & "%")
	ElseIf $currentDeathPenalty <> $g_i_Vanquisher_LastDeathPenalty Then
		CurrentAction("DP update: " & $g_i_Vanquisher_LastDeathPenalty & "% -> " & $currentDeathPenalty & "%")
	EndIf
	$g_i_Vanquisher_LastDeathPenalty = $currentDeathPenalty

	If $isShrineRespawn Then
		CurrentAction("Shrine respawn detected.")
	EndIf

	If Not Map_GetInstanceInfo("IsExplorable") Then
		$g_b_Vanquisher_DeathResignPending = False
		$g_b_Vanquisher_LastPlayerDead = False
		Return
	EndIf

	If Not $isPlayerDead Then
		$g_b_Vanquisher_DeathResignPending = False
		$g_b_Vanquisher_LastPlayerDead = False
		Return
	EndIf

	Local $l_b_NewDeath = Not $g_b_Vanquisher_LastPlayerDead
	If $l_b_NewDeath Then
		CurrentAction("Death detected | isPlayerDead=" & _Vanquisher_BoolText($isPlayerDead) & " | DP=" & $currentDeathPenalty & "%")
		CurrentAction("Wipe evaluation | isPartyWiped=" & _Vanquisher_BoolText($isPartyWiped) & " | isShrineRespawn=" & _Vanquisher_BoolText($isShrineRespawn) & " | canRecover=" & _Vanquisher_BoolText($canRecover))
	EndIf

	If $g_b_Vanquisher_DeathResignPending Then
		$g_b_Vanquisher_LastPlayerDead = True
		Return
	EndIf

	Local $l_b_Unrecoverable = GetPartyDefeated() Or ($isPartyWiped And $currentDeathPenalty >= 60 And Not $canRecover)
	If $l_b_Unrecoverable Then
		Local $l_s_ResignReason = "DP >= 60 and no recovery path."
		If GetPartyDefeated() Then $l_s_ResignReason = "Party defeated flag set."
		CurrentAction("Resign reason: " & $l_s_ResignReason)
		$g_b_Vanquisher_DeathResignPending = True
		_Vanquisher_ResignToOutpost()
		$g_b_Vanquisher_DeathResignPending = False
	ElseIf $l_b_NewDeath Then
		CurrentAction("Resign skipped: recoverable death state.")
	EndIf

	$g_b_Vanquisher_LastPlayerDead = $isPlayerDead
EndFunc   ;==>CheckDeath

Func CheckPartyDead()
	$DeadParty = 0
	For $i =1 to GetHeroCount()
		If GetIsDead(GetHeroID($i)) = True Then
			$DeadParty +=1
		EndIf
		If $DeadParty >= 5 Then
			$DeadOnTheRun = 1
		EndIf
	Next
EndFunc

;ARRIVATO QUA
Func VQ()

	$DeadOnTheRun = 0
	_Vanquisher_ApplyConsumables(True)
	ReDim $OpenedChestAgentIDs[1]
	$OpenedChestAgentIDs[0] = 0

		;Ascalon VQ
		Switch $Title
			Case "AscalonFoothills"
				AdlibRegister("CheckPartyDead", 2000)
				VQAscalonFoothills()
				AdlibUnRegister("CheckPartyDead")
			Case "DiessaLowlands"
				AdlibRegister("CheckPartyDead", 2000)
				VQDiessaLowlands()
				AdlibUnRegister("CheckPartyDead")
			Case "DragonsGullet"
				AdlibRegister("CheckPartyDead", 2000)
				VQDragonsGullet()
				AdlibUnRegister("CheckPartyDead")
			Case "EasternFrontier"
				AdlibRegister("CheckPartyDead", 2000)
				VQEasternFrontier()
				AdlibUnRegister("CheckPartyDead")
			Case "FlameTempleCorridor"
				AdlibRegister("CheckPartyDead", 2000)
				VQFlameTempleCorridor()
				AdlibUnRegister("CheckPartyDead")
			Case "OldAscalon"
				AdlibRegister("CheckPartyDead", 2000)
				VQOldAscalon()
				AdlibUnRegister("CheckPartyDead")
			Case "PockmarkFlats"
				AdlibRegister("CheckPartyDead", 2000)
				VQPockmarkFlats()
				AdlibUnRegister("CheckPartyDead")
			Case "RegentValley"
				AdlibRegister("CheckPartyDead", 2000)
				VQRegentValley()
				AdlibUnRegister("CheckPartyDead")
			Case "TheBreach"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheBreach()
				AdlibUnRegister("CheckPartyDead")
			;Northern Shiverpeaks VQ
			Case "AnvilRock"
				AdlibRegister("CheckPartyDead", 2000)
				VQAnvilRock()
				AdlibUnRegister("CheckPartyDead")
			Case "DeldrimorBowl"
				AdlibRegister("CheckPartyDead", 2000)
				VQDeldrimorBowl()
				AdlibUnRegister("CheckPartyDead")
			Case "GriffonsMouth"
				AdlibRegister("CheckPartyDead", 2000)
				VQGriffonsMouth()
				AdlibUnRegister("CheckPartyDead")
			Case "IronHorseMine"
				AdlibRegister("CheckPartyDead", 2000)
				VQIronHorseMine()
				AdlibUnRegister("CheckPartyDead")
			Case "TravelersVale"
				AdlibRegister("CheckPartyDead", 2000)
				VQTravelersVale()
				AdlibUnRegister("CheckPartyDead")
			;Maguuma VQ
			Case "DryTop"
				AdlibRegister("CheckPartyDead", 2000)
				VQDryTop()
				AdlibUnRegister("CheckPartyDead")
			Case "EttinsBack"
				AdlibRegister("CheckPartyDead", 2000)
				VQEttinsBack()
				AdlibUnRegister("CheckPartyDead")
			Case "MamnoonLagoon"
				AdlibRegister("CheckPartyDead", 2000)
				VQMamnoonLagoon()
				AdlibUnRegister("CheckPartyDead")
			Case "ReedBog"
				AdlibRegister("CheckPartyDead", 2000)
				VQReedBog()
				AdlibUnRegister("CheckPartyDead")
			Case "SageLands"
				AdlibRegister("CheckPartyDead", 2000)
				VQSageLands()
				AdlibUnRegister("CheckPartyDead")
			Case "Silverwood"
				AdlibRegister("CheckPartyDead", 2000)
				VQSilverwood()
				AdlibUnRegister("CheckPartyDead")
			Case "TangleRoot"
				AdlibRegister("CheckPartyDead", 2000)
				VQTangleRoot()
				AdlibUnRegister("CheckPartyDead")
			Case "TheFalls"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheFalls()
				AdlibUnRegister("CheckPartyDead")
			;Maguuma VQ
			Case "DryTop"
				AdlibRegister("CheckPartyDead", 2000)
				VQDryTop()
				AdlibUnRegister("CheckPartyDead")
			Case "EttinsBack"
				AdlibRegister("CheckPartyDead", 2000)
				VQEttinsBack()
				AdlibUnRegister("CheckPartyDead")
			Case "MamnoonLagoon"
				AdlibRegister("CheckPartyDead", 2000)
				VQMamnoonLagoon()
				AdlibUnRegister("CheckPartyDead")
			Case "ReedBog"
				AdlibRegister("CheckPartyDead", 2000)
				VQReedBog()
				AdlibUnRegister("CheckPartyDead")
			Case "SageLands"
				AdlibRegister("CheckPartyDead", 2000)
				VQSageLands()
				AdlibUnRegister("CheckPartyDead")
			Case "Silverwood"
				AdlibRegister("CheckPartyDead", 2000)
				VQSilverwood()
				AdlibUnRegister("CheckPartyDead")
			Case "TangleRoot"
				AdlibRegister("CheckPartyDead", 2000)
				VQTangleRoot()
				AdlibUnRegister("CheckPartyDead")
			Case "TheFalls"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheFalls()
				AdlibUnRegister("CheckPartyDead")
			;Crystal Desert VQ
			Case "DivinersAscent"
				AdlibRegister("CheckPartyDead", 2000)
				VQDivinersAscent()
				AdlibUnRegister("CheckPartyDead")
			Case "ProphetsPath"
				AdlibRegister("CheckPartyDead", 2000)
				VQProphetsPath()
				AdlibUnRegister("CheckPartyDead")
			Case "SaltFlats"
				AdlibRegister("CheckPartyDead", 2000)
				VQSaltFlats()
				AdlibUnRegister("CheckPartyDead")
			Case "SkywardReach"
				AdlibRegister("CheckPartyDead", 2000)
				VQSkywardReach()
				AdlibUnRegister("CheckPartyDead")
			Case "TheAridSea"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheAridSea()
				AdlibUnRegister("CheckPartyDead")
			Case "TheScar"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheScar()
				AdlibUnRegister("CheckPartyDead")
			Case "VultureDrifts"
				AdlibRegister("CheckPartyDead", 2000)
				VQVultureDrifts()
				AdlibUnRegister("CheckPartyDead")
			;Kryta VQ
			Case "CursedLands"
				AdlibRegister("CheckPartyDead", 2000)
				VQCursedLands()
				AdlibUnRegister("CheckPartyDead")
			Case "KessexPeak"
				AdlibRegister("CheckPartyDead", 2000)
				VQKessexPeak()
				AdlibUnRegister("CheckPartyDead")
			Case "MajestysRest"
				AdlibRegister("CheckPartyDead", 2000)
				VQMajestysRest()
				AdlibUnRegister("CheckPartyDead")
			Case "NeboTerrace"
				AdlibRegister("CheckPartyDead", 2000)
				VQNeboTerrace()
				AdlibUnRegister("CheckPartyDead")
			Case "NorthKrytaProvince"
				AdlibRegister("CheckPartyDead", 2000)
				VQNorthKrytaProvince()
				AdlibUnRegister("CheckPartyDead")
			Case "ScoundrelsRise"
				AdlibRegister("CheckPartyDead", 2000)
				VQScoundrelsRise()
				AdlibUnRegister("CheckPartyDead")
			Case "StingrayStrand"
				AdlibRegister("CheckPartyDead", 2000)
				VQStingrayStrand()
				AdlibUnRegister("CheckPartyDead")
			Case "TalmarkWilderness"
				AdlibRegister("CheckPartyDead", 2000)
				VQTalmarkWilderness()
				AdlibUnRegister("CheckPartyDead")
			Case "TearsoftheFallen"
				AdlibRegister("CheckPartyDead", 2000)
				VQTearsoftheFallen()
				AdlibUnRegister("CheckPartyDead")
			Case "TheBlackCurtain"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheBlackCurtain()
				AdlibUnRegister("CheckPartyDead")
			Case "TwinSerpentLakes"
				AdlibRegister("CheckPartyDead", 2000)
				VQTwinSerpentLakes()
				AdlibUnRegister("CheckPartyDead")
			Case "WatchtowerCoast"
				AdlibRegister("CheckPartyDead", 2000)
				VQWatchtowerCoast()
				AdlibUnRegister("CheckPartyDead")
			;Southern Shiverpeaks VQ
			Case "DreadnoughtsDrift"
				AdlibRegister("CheckPartyDead", 2000)
				VQDreadnoughtsDrift()
				AdlibUnRegister("CheckPartyDead")
			Case "FrozenForest"
				AdlibRegister("CheckPartyDead", 2000)
				VQFrozenForest()
				AdlibUnRegister("CheckPartyDead")
			Case "GrenthsFootprint"
				AdlibRegister("CheckPartyDead", 2000)
				VQGrenthsFootprint()
				AdlibUnRegister("CheckPartyDead")
			Case "IceFloe"
				AdlibRegister("CheckPartyDead", 2000)
				VQIceFloe()
				AdlibUnRegister("CheckPartyDead")
			Case "Icedome"
				AdlibRegister("CheckPartyDead", 2000)
				VQIcedome()
				AdlibUnRegister("CheckPartyDead")
			Case "LornarsPass"
				AdlibRegister("CheckPartyDead", 2000)
				VQLornarsPass()
				AdlibUnRegister("CheckPartyDead")
			Case "MineralSprings"
				AdlibRegister("CheckPartyDead", 2000)
				VQMineralSprings()
				AdlibUnRegister("CheckPartyDead")
			Case "SnakeDance"
				AdlibRegister("CheckPartyDead", 2000)
				VQSnakeDance()
				AdlibUnRegister("CheckPartyDead")
			Case "SpearheadPeak"
				AdlibRegister("CheckPartyDead", 2000)
				VQSpearheadPeak()
				AdlibUnRegister("CheckPartyDead")
			Case "TalusChute"
				AdlibRegister("CheckPartyDead", 2000)
				VQTalusChute()
				AdlibUnRegister("CheckPartyDead")
			Case "TascasDemise"
				AdlibRegister("CheckPartyDead", 2000)
				VQTascasDemise()
				AdlibUnRegister("CheckPartyDead")
			Case "WitmansFolly"
				AdlibRegister("CheckPartyDead", 2000)
				VQWitmansFolly()
				AdlibUnRegister("CheckPartyDead")
			;Ring of Fire Island VQ
			Case "PerditionRock"
				AdlibRegister("CheckPartyDead", 2000)
				VQPerditionRock()
				AdlibUnRegister("CheckPartyDead")
			;Shing Jea Island VQ
			Case "HaijuLagoon"
				AdlibRegister("CheckPartyDead", 2000)
				VQHaijuLagoon()
				AdlibUnRegister("CheckPartyDead")
			Case "JayaBluffs"
				AdlibRegister("CheckPartyDead", 2000)
				VQJayaBluffs()
				AdlibUnRegister("CheckPartyDead")
			Case "KinyaProvince"
				AdlibRegister("CheckPartyDead", 2000)
				VQKinyaProvince()
				AdlibUnRegister("CheckPartyDead")
			Case "MinisterChosEstate"
				AdlibRegister("CheckPartyDead", 2000)
				VQMinisterChosEstate()
				AdlibUnRegister("CheckPartyDead")
			Case "PanjiangPeninsula"
				AdlibRegister("CheckPartyDead", 2000)
				VQPanjiangPeninsula()
				AdlibUnRegister("CheckPartyDead")
			Case "SaoshangTrail"
				AdlibRegister("CheckPartyDead", 2000)
				VQSaoshangTrail()
				AdlibUnRegister("CheckPartyDead")
			Case "SunquaVale"
				AdlibRegister("CheckPartyDead", 2000)
				VQSunquaVale()
				AdlibUnRegister("CheckPartyDead")
			Case "ZenDaijun"
				AdlibRegister("CheckPartyDead", 2000)
				VQZenDaijun()
				AdlibUnRegister("CheckPartyDead")
			;Kaineng City VQ
			Case "BukdekByway"
				AdlibRegister("CheckPartyDead", 2000)
				VQBukdekByway()
				AdlibUnRegister("CheckPartyDead")
			Case "NahpuiQuarter"
				AdlibRegister("CheckPartyDead", 2000)
				VQNahpuiQuarter()
				AdlibUnRegister("CheckPartyDead")
			Case "PongmeiValley"
				AdlibRegister("CheckPartyDead", 2000)
				VQPongmeiValley()
				AdlibUnRegister("CheckPartyDead")
			Case "RaisuPalace"
				AdlibRegister("CheckPartyDead", 2000)
				VQRaisuPalace()
				AdlibUnRegister("CheckPartyDead")
			Case "ShadowsPassage"
				AdlibRegister("CheckPartyDead", 2000)
				VQShadowsPassage()
				AdlibUnRegister("CheckPartyDead")
			Case "ShenzunTunnels"
				AdlibRegister("CheckPartyDead", 2000)
				VQShenzunTunnels()
				AdlibUnRegister("CheckPartyDead")
			Case "SunjiangDistrict"
				AdlibRegister("CheckPartyDead", 2000)
				VQSunjiangDistrict()
				AdlibUnRegister("CheckPartyDead")
			Case "TahnnakiTemple"
				AdlibRegister("CheckPartyDead", 2000)
				VQTahnnakiTemple()
				AdlibUnRegister("CheckPartyDead")
			Case "WajjunBazaar"
				AdlibRegister("CheckPartyDead", 2000)
				VQWajjunBazaar()
				AdlibUnRegister("CheckPartyDead")
			Case "XaquangSkyway"
				AdlibRegister("CheckPartyDead", 2000)
				VQXaquangSkyway()
				AdlibUnRegister("CheckPartyDead")
			;Echovald Forest VQ
			Case "Arborstone"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Kurzickpoint", 5000)
				VQArborstone()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Kurzickpoint")
			Case "DrazachThicket"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Kurzickpoint", 5000)
				VQDrazachThicket()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Kurzickpoint")
			Case "Ferndale"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Kurzickpoint", 5000)
				VQFerndale()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Kurzickpoint")
			Case "MelandrusHope"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Kurzickpoint", 5000)
				VQMelandrusHope()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Kurzickpoint")
			Case "MorostavTrail"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Kurzickpoint", 5000)
				VQMorostavTrail()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Kurzickpoint")
			Case "MourningVeilFalls"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Kurzickpoint", 5000)
				VQMourningVeilFalls()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Kurzickpoint")
			Case "TheEternalGrove"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Kurzickpoint", 5000)
				VQTheEternalGrove()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Kurzickpoint")
			;The Jade Sea VQ
			Case "Archipelagos"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQArchipelagos()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			Case "BoreasSeabed"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQBoreasSeabed()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			Case "GyalaHatchery"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQGyalaHatchery()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			Case "MaishangHills"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQMaishangHills()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			Case "MountQinkai"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQMountQinkai()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			Case "RheasCrater"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQRheasCrater()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			Case "SilentSurf"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQSilentSurf()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			Case "UnwakingWaters"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Luxonpoint", 5000)
				VQUnwakingWaters()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Luxonpoint")
			;Istan VQ
			Case "CliffsOfDohjok"
				AdlibRegister("CheckPartyDead", 2000)
				VQCliffsOfDohjok()
				AdlibUnRegister("CheckPartyDead")
			Case "FahranurTheFirstCity"
				AdlibRegister("CheckPartyDead", 2000)
				VQFahranurTheFirstCity()
				AdlibUnRegister("CheckPartyDead")
			Case "IssnurIsles"
				AdlibRegister("CheckPartyDead", 2000)
				VQIssnurIsles()
				AdlibUnRegister("CheckPartyDead")
			Case "LahtendaBog"
				AdlibRegister("CheckPartyDead", 2000)
				VQLahtendaBog()
				AdlibUnRegister("CheckPartyDead")
			Case "MehtaniKeys"
				AdlibRegister("CheckPartyDead", 2000)
				VQMehtaniKeys()
				AdlibUnRegister("CheckPartyDead")
			Case "PlainsofJarin"
				AdlibRegister("CheckPartyDead", 2000)
				VQPlainsofJarin()
				AdlibUnRegister("CheckPartyDead")
			Case "ZehlonReach"
				AdlibRegister("CheckPartyDead", 2000)
				VQZehlonReach()
				AdlibUnRegister("CheckPartyDead")
			;Kourna VQ
			Case "ArkjokWard"
				AdlibRegister("CheckPartyDead", 2000)
				VQArkjokWard()
				AdlibUnRegister("CheckPartyDead")
			Case "BahdokCaverns"
				AdlibRegister("CheckPartyDead", 2000)
				VQBahdokCaverns()
				AdlibUnRegister("CheckPartyDead")
			Case "BarbarousShore"
				AdlibRegister("CheckPartyDead", 2000)
				VQBarbarousShore()
				AdlibUnRegister("CheckPartyDead")
			Case "DejarinEstate"
				AdlibRegister("CheckPartyDead", 2000)
				VQDejarinEstate()
				AdlibUnRegister("CheckPartyDead")
			Case "GandaraTheMoonFortress"
				AdlibRegister("CheckPartyDead", 2000)
				VQGandaraTheMoonFortress()
				AdlibUnRegister("CheckPartyDead")
			Case "JahaiBluffs"
				AdlibRegister("CheckPartyDead", 2000)
				VQJahaiBluffs()
				AdlibUnRegister("CheckPartyDead")
			Case "MargaCoast"
				AdlibRegister("CheckPartyDead", 2000)
				VQMargaCoast()
				AdlibUnRegister("CheckPartyDead")
			Case "SunwardMarches"
				AdlibRegister("CheckPartyDead", 2000)
				VQSunwardMarches()
				AdlibUnRegister("CheckPartyDead")
			Case "TheFloodplainOfMahnkelon"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheFloodplainOfMahnkelon()
				AdlibUnRegister("CheckPartyDead")
			Case "TuraisProcession"
				AdlibRegister("CheckPartyDead", 2000)
				VQTuraisProcession()
				AdlibUnRegister("CheckPartyDead")
			;Vabbi VQ
			Case "ForumHighlands"
				AdlibRegister("CheckPartyDead", 2000)
				VQForumHighlands()
				AdlibUnRegister("CheckPartyDead")
			Case "GardenOfSeborhin"
				AdlibRegister("CheckPartyDead", 2000)
				VQGardenOfSeborhin()
				AdlibUnRegister("CheckPartyDead")
			Case "HoldingsOfChokhin"
				AdlibRegister("CheckPartyDead", 2000)
				VQHoldingsOfChokhin()
				AdlibUnRegister("CheckPartyDead")
			Case "ResplendentMakuun"
				AdlibRegister("CheckPartyDead", 2000)
				VQResplendentMakuun()
				AdlibUnRegister("CheckPartyDead")
			Case "TheHiddenCityOfAhdashim"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheHiddenCityOfAhdashim()
				AdlibUnRegister("CheckPartyDead")
			Case "TheMirrorOfLyss"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheMirrorOfLyss()
				AdlibUnRegister("CheckPartyDead")
			Case "VehjinMines"
				AdlibRegister("CheckPartyDead", 2000)
				VQVehjinMines()
				AdlibUnRegister("CheckPartyDead")
			Case "VehtendiValley"
				AdlibRegister("CheckPartyDead", 2000)
				VQVehtendiValley()
				AdlibUnRegister("CheckPartyDead")
			Case "WildernessOfBahdza"
				AdlibRegister("CheckPartyDead", 2000)
				VQWildernessOfBahdza()
				AdlibUnRegister("CheckPartyDead")
			Case "YatendiCanyons"
				AdlibRegister("CheckPartyDead", 2000)
				VQYatendiCanyons()
				AdlibUnRegister("CheckPartyDead")
			;The Desolation VQ
			Case "CrystalOverlook"
				AdlibRegister("CheckPartyDead", 2000)
				VQCrystalOverlook()
				AdlibUnRegister("CheckPartyDead")
			Case "JokosDomain"
				AdlibRegister("CheckPartyDead", 2000)
				VQJokosDomain()
				AdlibUnRegister("CheckPartyDead")
			Case "PoisonedOutcrops"
				AdlibRegister("CheckPartyDead", 2000)
				VQPoisonedOutcrops()
				AdlibUnRegister("CheckPartyDead")
			Case "TheAlkaliPan"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheAlkaliPan()
				AdlibUnRegister("CheckPartyDead")
			Case "TheRupturedHeart"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheRupturedHeart()
				AdlibUnRegister("CheckPartyDead")
			Case "TheShatteredRavines"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheShatteredRavines()
				AdlibUnRegister("CheckPartyDead")
			Case "TheSulfurousWastes"
				AdlibRegister("CheckPartyDead", 2000)
				VQTheSulfurousWastes()
				AdlibUnRegister("CheckPartyDead")
			;Charr Homelands VQ
			Case "DaladaUplands"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Vanguardpoint", 5000)
				VQDaladaUplands()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Vanguardpoint")
			Case "GrothmarWardowns"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Vanguardpoint", 5000)
				VQGrothmarWardowns()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Vanguardpoint")
			Case "SacnothValley"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Vanguardpoint", 5000)
				VQSacnothValley()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Vanguardpoint")
			;Far Shiverpeaks VQ
			Case "BjoraMarches"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Nornpoint", 5000)
				VQBjoraMarches()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Nornpoint")
			Case "DrakkarLake"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Nornpoint", 5000)
				VQDrakkarLake()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Nornpoint")
			Case "IceCliffChasms"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Nornpoint", 5000)
				VQIceCliffChasms()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Nornpoint")
			Case "JagaMoraine"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Nornpoint", 5000)
				VQJagaMoraine()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Nornpoint")
			Case "NorrhartDomains"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Nornpoint", 5000)
				VQNorrhartDomains()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Nornpoint")
			Case "VarajarFells"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("Nornpoint", 5000)
				VQVarajarFells()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("Nornpoint")
			;Tarnished Coast VQ
			Case "ArborBay"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("AsuraPoint", 5000)
				VQArborBay()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("AsuraPoint")
			Case "AlcaziaTangle"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("AsuraPoint", 5000)
				VQAlcaziaTangle()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("AsuraPoint")
			Case "MagusStones"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("AsuraPoint", 5000)
				VQMagusStones()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("AsuraPoint")
			Case "RivenEarth"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("AsuraPoint", 5000)
				VQRivenEarth()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("AsuraPoint")
			Case "SparkflySwamp"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("AsuraPoint", 5000)
				VQSparkflySwamp()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("AsuraPoint")
			Case "VerdantCascades"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("AsuraPoint", 5000)
				VQVerdantCascades()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("AsuraPoint")
			;Dungeons
			Case "OozePit"
				AdlibRegister("CheckPartyDead", 2000)
				AdlibRegister("DeldrimorPoint", 5000)
				OozePit()
				AdlibUnRegister("CheckPartyDead")
				AdlibUnRegister("DeldrimorPoint")
		EndSwitch

	UpdateVanquish()
	If _Vanquisher_IsVanquishComplete() Then
		_Vanquisher_OnVanquishComplete(" (run)")
	EndIf

EndFunc

Func AsuraPoint()
	$Temp = GetAsuraTitle()
;	$point_earn = $Temp - $Asura_begin
;	GUICtrlSetData($Pt_Asura, $point_earn)
EndFunc

Func DeldrimorPoint()
	$Temp = GetDeldrimorTitle()
	$point_earn = $Temp - $Deldrimor_begin
	GUICtrlSetData($Pt_Deldrimor, $point_earn)
EndFunc

Func Vanguardpoint()
	$Temp = GetVanguardTitle()
	$point_earn = $Temp - $Vanguard_begin
	GUICtrlSetData($Pt_Vanguard, $point_earn)
EndFunc

Func Nornpoint()
	$Temp = GetNornTitle()
	$point_earn = $Temp - $Norn_begin
	GUICtrlSetData($Pt_Norn, $point_earn)
EndFunc

Func Kurzickpoint()
	$Temp = GetKurzickFaction()
;	$point_earn = $Temp - $Kurzick_begin + $what_we_donate
;	GUICtrlSetData($Pt_Kurzick, $point_earn)
EndFunc

Func Luxonpoint()
	$Temp = GetLuxonFaction()
;	$point_earn = $Temp - $Luxon_begin + $what_we_donate
;	GUICtrlSetData($Pt_Luxon, $point_earn)
EndFunc

Func SSLBpoint()
	$Temp = GetSunspearTitle()
	$point_earn = $Temp - $SS_begin
	GUICtrlSetData($Pt_SS, $point_earn)
	$Temp = GetLightbringerTitle()
	$point_earn = $Temp - $LB_begin
	GUICtrlSetData($Pt_LB, $point_earn)
EndFunc

Func SSpoint()
	$Temp = GetSunspearTitle()
	$point_earn = $Temp - $SS_begin
	GUICtrlSetData($Pt_SS, $point_earn)
EndFunc
