;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aMamnoonLagoonOutpostPath[2][2] = [ _
	[1692, -2650], _
	[2013, -2216] _
]

Local $aMamnoonLagoonTransitPath[13][2] = [ _
	[2384, -1697], _
	[3673, 525], _
	[5150, 2644], _
	[7357, 3959], _
	[7914, 6488], _
	[7130, 8915], _
	[6393, 11377], _
	[6191, 13960], _
	[8176, 15526], _
	[10709, 15812], _
	[13129, 16739], _
	[15137, 15124], _
	[16834, 13262] _
]

; Silverwood (43) -> Mamnoon Lagoon (42). Last path point is approach; portal is separate.
Local Const $MAMNOONLAGOON_TRANSIT_PORTAL_X = 17984
Local Const $MAMNOONLAGOON_TRANSIT_PORTAL_Y = 13297

; Quarrel Falls (142) -> Silverwood (43).
Local Const $MAMNOONLAGOON_OUTPOST_PORTAL_X = 2040
Local Const $MAMNOONLAGOON_OUTPOST_PORTAL_Y = -2021

; Quarrel Falls (142) -> Silverwood transit (43) -> Mamnoon Lagoon farm (42).
Func GoOutMamnoonLagoon()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $MamnoonLagoon_Map Then Return

	If $l_i_Map = $MamnoonLagoon_Outpost Then
		If $g_i_MamnoonLagoonRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Quarrel Falls -> Silverwood (portal 1).")
		_Vanquisher_RunAggroApproachPath($aMamnoonLagoonOutpostPath, $vqrange, "quarrel ")
		_Vanquisher_RunPortalStep($MAMNOONLAGOON_OUTPOST_PORTAL_X, $MAMNOONLAGOON_OUTPOST_PORTAL_Y, $vqrange, "quarrel portal")
		If GetMapID() <> $l_i_Map Then $g_i_MamnoonLagoonRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MamnoonLagoon_Transit Then
		If $g_i_MamnoonLagoonRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Silverwood (transit) -> Mamnoon Lagoon (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Mamnoon Lagoon portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroApproachPath($aMamnoonLagoonTransitPath, $vqrange, "silverwood ")
		_Vanquisher_RunPortalStep($MAMNOONLAGOON_TRANSIT_PORTAL_X, $MAMNOONLAGOON_TRANSIT_PORTAL_Y, $vqrange, "silverwood portal")
		If GetMapID() = $MamnoonLagoon_Map Then $g_i_MamnoonLagoonRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQMamnoonLagoon()
	If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Mamnoon Lagoon.")
		TravelTo($MamnoonLagoon_Outpost)
	EndIf

	If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutMamnoonLagoon()
		If GetMapID() <> $MamnoonLagoon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Mamnoon Lagoon (" & $MamnoonLagoon_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("Mamnoon Lagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Mamnoon Lagoon vanquish route.")

	Local $aWaypoints[36][4] = [ _
		[-6363, -5190, " ", $vqrange], _
		[-5201, -2844, " ", $vqrange], _
		[-4173, -512, " ", $vqrange], _
		[-2301, 1258, " ", $vqrange], _
		[-2598, 3819, " ", $vqrange], _
		[-1594, 3867, " ", $vqrange], _
		[-1274, 1374, " ", $vqrange], _
		[-1964, -1108, " ", $vqrange], _
		[-1898, -3680, " ", $vqrange], _
		[-529, -5780, " ", $vqrange], _
		[1962, -6355, " ", $vqrange], _
		[-576, -6729, " ", $vqrange], _
		[-2353, -6877, " ", $vqrange], _
		[168, -6488, " ", $vqrange], _
		[1932, -4710, " ", $vqrange], _
		[4309, -5734, " ", $vqrange], _
		[5877, -3750, " ", $vqrange], _
		[5744, -1158, " ", $vqrange], _
		[4281, 963, " ", $vqrange], _
		[3573, 3385, " ", $vqrange], _
		[4207, 5824, " ", $vqrange], _
		[6444, 7160, " ", $vqrange], _
		[7147, 4948, " ", $vqrange], _
		[6786, 7237, " ", $vqrange], _
		[4711, 5810, " ", $vqrange], _
		[2240, 5264, " ", $vqrange], _
		[-24, 6356, " ", $vqrange], _
		[-2592, 6615, " ", $vqrange], _
		[-5051, 5817, " ", $vqrange], _
		[-7118, 4306, " ", $vqrange], _
		[-7450, 3475, " ", $vqrange], _
		[-7329, 5997, " ", $vqrange], _
		[-4763, 5921, " ", $vqrange], _
		[-2273, 6167, " ", $vqrange], _
		[-2544, 3657, " ", $vqrange], _
		[-3085, 1120, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
