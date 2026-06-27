#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aAscalonFoothillsOutpostPath[2][2] = [ _
	[9342, 4942], _
	[9240, 3985] _
]

Local $aAscalonFoothillsTransitPath[6][2] = [ _
	[8304, -458], _
	[10540, -4383], _
	[10274, -11684], _
	[9741, -16900], _
	[10668, -17113], _
	[11056, -17139] _
]

Func GoOutAscalonFoothills()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $AscalonFoothills_Map Then Return

	If $l_i_Map = $AscalonFoothills_Outpost Then
		If $g_i_AscalonFoothillsRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> Ascalon Foothills (portal 1).")
		_Vanquisher_RunAggroPortalPath($aAscalonFoothillsOutpostPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_AscalonFoothillsRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $AscalonFoothills_Transit Then
		If $g_i_AscalonFoothillsRoute_LastMapHandled = $l_i_Map Then Return
		CurrentAction("Traveler's Vale (transit) -> Ascalon Foothills (portal 2).")
		If Not _Vanquisher_RunExplorableTransitPortalPath($aAscalonFoothillsTransitPath, $vqrange, "travelersvale ") Then
			CurrentAction("Transit map not ready yet — retrying Ascalon Foothills portal path.")
			Return
		EndIf
		If GetMapID() = $AscalonFoothills_Map Then $g_i_AscalonFoothillsRoute_LastMapHandled = $l_i_Map
	EndIf

EndFunc

Func VQAscalonFoothills()
	If GetMapID() <> $AscalonFoothills_Map And GetMapID() <> $AscalonFoothills_Outpost And GetMapID() <> $AscalonFoothills_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for AscalonFoothills.")
		TravelTo($AscalonFoothills_Outpost)
	EndIf

	If GetMapID() = $AscalonFoothills_Outpost Or GetMapID() = $AscalonFoothills_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutAscalonFoothills()
		If GetMapID() <> $AscalonFoothills_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need AscalonFoothills (" & $AscalonFoothills_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $AscalonFoothills_Map Then
		CurrentAction("AscalonFoothills route waiting - on map " & GetMapID() & ", need " & $AscalonFoothills_Map & ".")
		Return
	EndIf

	CurrentAction("Starting AscalonFoothills vanquish route.")

	Local $aWaypoints[14][4] = [ _
		[-5785, 1558, " ", $vqrange], _
		[-2684, 2006, " ", $vqrange], _
		[-5544, -1613, " ", $vqrange], _
		[-3428, -5729, " ", $vqrange], _
		[373, -3274, " ", $vqrange], _
		[-3156, -2098, " ", $vqrange], _
		[-1639, 751, " ", $vqrange], _
		[621, -735, " ", $vqrange], _
		[2040, 2078, " ", $vqrange], _
		[240, 5077, " ", $vqrange], _
		[4885, 5096, " ", $vqrange], _
		[5939, 1126, " ", $vqrange], _
		[3321, -3531, " ", $vqrange], _
		[7307, -5105, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

