#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aCursedLandsOutpostPath[2][2] = [ _
	[-5057.52, 17188.52], _
	[-5205, 15562] _
]

Local $aCursedLandsTransitPath[10][2] = [ _
	[-5205, 15562], _
	[-2349, 13986], _
	[59, 15027], _
	[352, 16720], _
	[9269, 19160], _
	[15029, 16947], _
	[16343, 15691], _
	[17767, 15777], _
	[19161, 18064], _
	[20018, 18317] _
]

Func _Vanquisher_ResetCursedLandsRouteProgress()
	$g_i_CursedLandsRoute_LastMapHandled = -1
EndFunc

Func GoOutCursedLands()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $CursedLands_Map Then Return

	If $l_i_Map = $CursedLands_Outpost Then
		If $g_i_CursedLandsRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Temple of the Ages -> The Black Curtain (portal 1).")
		_Vanquisher_RunAggroPortalPath($aCursedLandsOutpostPath, $vqrange, "temple ")
		If GetMapID() <> $l_i_Map Then $g_i_CursedLandsRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $CursedLands_Transit Then
		If $g_i_CursedLandsRoute_LastMapHandled = $l_i_Map Then Return
		CurrentAction("The Black Curtain (transit) -> Cursed Lands (portal 2).")
		If Not _Vanquisher_RunExplorableTransitPortalPath($aCursedLandsTransitPath, $vqrange, "blackcurtain ") Then
			CurrentAction("Transit map not ready yet — retrying Cursed Lands portal path.")
			Return
		EndIf
		If GetMapID() = $CursedLands_Map Then $g_i_CursedLandsRoute_LastMapHandled = $l_i_Map
	EndIf
EndFunc

Func VQCursedLands()
	If GetMapID() <> $CursedLands_Map And GetMapID() <> $CursedLands_Outpost And GetMapID() <> $CursedLands_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for CursedLands.")
		TravelTo($CursedLands_Outpost)
	EndIf

	If GetMapID() = $CursedLands_Outpost Or GetMapID() = $CursedLands_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCursedLands()
		If GetMapID() <> $CursedLands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need CursedLands (" & $CursedLands_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $CursedLands_Map Then
		CurrentAction("CursedLands route waiting - on map " & GetMapID() & ", need " & $CursedLands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting CursedLands vanquish route.")

	Local $aWaypoints[57][4] = [ _
		[-19496, 8848, " ", $vqrange], _
		[-18602, 6586, " ", $vqrange], _
		[-17054, 7175, " ", $vqrange], _
		[-15946, 7445, " ", $vqrange], _
		[-15053, 7023, " ", $vqrange], _
		[-13624, 6437, " ", $vqrange], _
		[-12525, 5679, " ", $vqrange], _
		[-11018, 4926, " ", $vqrange], _
		[-12364, 4081, " ", $vqrange], _
		[-10455, 1232, " ", $vqrange], _
		[-12270, 1827, " ", $vqrange], _
		[-13679, 606, " ", $vqrange], _
		[-12082, -364, " ", $vqrange], _
		[-13366, 951, " ", $vqrange], _
		[-10643, 888, " ", $vqrange], _
		[-11053, -1374, " ", $vqrange], _
		[-9443, -2167, " ", $vqrange], _
		[-10789, -2632, " ", $vqrange], _
		[-11207, -3480, " ", $vqrange], _
		[-11878, -4157, " ", $vqrange], _
		[-12322, -5287, " ", $vqrange], _
		[-14137, -4737, " ", $vqrange], _
		[-14089, -6291, " ", $vqrange], _
		[-15448, -3760, " ", $vqrange], _
		[-13079, -4313, " ", $vqrange], _
		[-9292, -1291, " ", $vqrange], _
		[-8202, -2740, " ", $vqrange], _
		[-9170, -3353, " ", $vqrange], _
		[-9211, -4044, " ", $vqrange], _
		[-7336, -3675, " ", $vqrange], _
		[-9115, -4460, " ", $vqrange], _
		[-9118, -5042, " ", $vqrange], _
		[-10272, -5496, " ", $vqrange], _
		[-10043, -7969, " ", $vqrange], _
		[-10556, -6510, " ", $vqrange], _
		[-8929, -5283, " ", $vqrange], _
		[-7929, -5724, " ", $vqrange], _
		[-6021, -7049, " ", $vqrange], _
		[-6905, -7346, " ", $vqrange], _
		[-8598, -8605, " ", $vqrange], _
		[-9013, -9298, " ", $vqrange], _
		[-10887, -8602, " ", $vqrange], _
		[-12167, -8764, " ", $vqrange], _
		[-12631, -9765, " ", $vqrange], _
		[-14267, -9095, " ", $vqrange], _
		[-12344, -10978, " ", $vqrange], _
		[-10962, -10738, " ", $vqrange], _
		[-9900, -11619, " ", $vqrange], _
		[-11262, -11599, " ", $vqrange], _
		[-9940, -13102, " ", $vqrange], _
		[-7184, -12391, " ", $vqrange], _
		[-7264, -10788, " ", $vqrange], _
		[-4279, -9403, " ", $vqrange], _
		[-3958, -8141, " ", $vqrange], _
		[-6337, -4810, " ", $vqrange], _
		[-5260, -2957, " ", $vqrange], _
		[-4033, -6313, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

