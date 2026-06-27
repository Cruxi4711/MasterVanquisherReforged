#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

; Copperhammer Mines (159) -> Frozen Forest (98).
Local Const $ICEDOME_COPPERHAMMER_PORTAL_X = -17971
Local Const $ICEDOME_COPPERHAMMER_PORTAL_Y = 9397

; Frozen Forest (98) -> Ice Dome (87). Last path point is approach; portal is separate.
Local Const $ICEDOME_FROZENFOREST_PORTAL_X = -24993
Local Const $ICEDOME_FROZENFOREST_PORTAL_Y = -10537

; FrozenForestToIcedome — map 159 approach (TransitZoneWaypoints.txt #1).
Local $aIcedomeOutpostPath[1][2] = [ _
	[-17953, 9671] _
]

; FrozenForestToIcedome — map 98 approach only (TransitZoneWaypoints.txt #2–#21).
Local $aIcedomeTransitPath[20][2] = [ _
	[-15817, 8498], _
	[-15175, 5849], _
	[-12365, 2997], _
	[-9826, 1424], _
	[-6725, 889], _
	[-3321, -104], _
	[-2544, -1578], _
	[-2715, -3575], _
	[-4192, -5400], _
	[-5630, -6232], _
	[-9738, -5483], _
	[-11651, -5574], _
	[-15257, -7766], _
	[-16877, -8380], _
	[-18343, -9790], _
	[-20792, -12612], _
	[-22301, -14003], _
	[-23668, -14287], _
	[-24689, -12650], _
	[-24884, -11301] _
]

Func GoOutIcedome()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $IceDome_Map Then Return

	If $l_i_Map = $IceDome_Outpost Then
		If $g_i_IcedomeRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Copperhammer Mines -> Frozen Forest (portal 1).")
		_Vanquisher_RunAggroApproachPath($aIcedomeOutpostPath, $vqrange, "copperhammer ")
		_Vanquisher_RunPortalStep($ICEDOME_COPPERHAMMER_PORTAL_X, $ICEDOME_COPPERHAMMER_PORTAL_Y, $vqrange, "copperhammer portal")
		If GetMapID() <> $l_i_Map Then $g_i_IcedomeRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $IceDome_Transit Then
		If $g_i_IcedomeRoute_LastMapHandled = $l_i_Map Then Return
		CurrentAction("Frozen Forest (transit) -> Ice Dome (portal 2).")
		If Not _Vanquisher_RunExplorableTransitLeg($aIcedomeTransitPath, $ICEDOME_FROZENFOREST_PORTAL_X, $ICEDOME_FROZENFOREST_PORTAL_Y, $vqrange, "frozenforest ") Then
			CurrentAction("Transit map not ready yet — retrying Ice Dome portal path.")
			Return
		EndIf
		If GetMapID() = $IceDome_Map Then $g_i_IcedomeRoute_LastMapHandled = $l_i_Map
	EndIf

EndFunc

Func VQIcedome()
	If GetMapID() <> $IceDome_Map And GetMapID() <> $IceDome_Outpost And GetMapID() <> $IceDome_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to Copperhammer Mines for Icedome.")
		TravelTo($IceDome_Outpost)
	EndIf

	If GetMapID() = $IceDome_Outpost Or GetMapID() = $IceDome_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutIcedome()
		If GetMapID() <> $IceDome_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Icedome (" & $IceDome_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $IceDome_Map Then
		CurrentAction("Icedome route waiting - on map " & GetMapID() & ", need " & $IceDome_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Icedome vanquish route.")

	Local $aWaypoints[19][4] = [ _
		[-4580, -5658, " ", $vqrange], _
		[-7099, -3889, " ", $vqrange], _
		[-8209, -2275, " ", $vqrange], _
		[-6907, -750, " ", $vqrange], _
		[-7084, 1085, " ", $vqrange], _
		[-3831, 1230, " ", $vqrange], _
		[-4262, 3600, " ", $vqrange], _
		[-3086, 5099, " ", $vqrange], _
		[-2743, 7372, " ", $vqrange], _
		[797, 6193, " ", $vqrange], _
		[562, 2616, " ", $vqrange], _
		[1049, -595, " ", $vqrange], _
		[3969, 573, " ", $vqrange], _
		[5717, 5604, " ", $vqrange], _
		[7635, 3729, " ", $vqrange], _
		[7537, 1108, " ", $vqrange], _
		[7073, -101, " ", $vqrange], _
		[5970, -1117, " ", $vqrange], _
		[7847, -3201, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
