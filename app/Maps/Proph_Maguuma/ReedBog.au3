#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aReedBogOutpostPath[2][2] = [ _
	[-14497, 835], _
	[-15074, 437] _
]

; Ettin's Back (44) -> Reed Bog (45). Last path point is approach; portal is separate.
Local Const $REEDBOG_TRANSIT_PORTAL_X = -23270
Local Const $REEDBOG_TRANSIT_PORTAL_Y = -11426

Local $aReedBogTransitPath[12][2] = [ _
	[-15468, 182], _
	[-17369, -1254], _
	[-15045, -3491], _
	[-14214, -6888], _
	[-12871, -8503], _
	[-13425, -10161], _
	[-15840, -10047], _
	[-17518, -9051], _
	[-19247, -8578], _
	[-20052, -9789], _
	[-21225, -11307], _
	[-22445, -11443] _
]

Func _Vanquisher_ResetReedBogRouteProgress()
	$g_i_ReedBogRoute_LastMapHandled = -1
EndFunc

; Ventari's Refuge (139) -> Ettin's Back transit (44) -> Reed Bog farm (45).
Func GoOutReedBog()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $ReedBog_Map Then Return

	If $l_i_Map = $ReedBog_Outpost Then
		If $g_i_ReedBogRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Ventari's Refuge -> Ettin's Back (portal 1).")
		_Vanquisher_RunAggroPortalPath($aReedBogOutpostPath, $vqrange, "ventari ")
		If GetMapID() <> $l_i_Map Then $g_i_ReedBogRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $ReedBog_Transit Then
		If $g_i_ReedBogRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Ettin's Back (transit) -> Reed Bog (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Reed Bog portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroApproachPath($aReedBogTransitPath, $vqrange, "ettins ")
		_Vanquisher_RunPortalStep($REEDBOG_TRANSIT_PORTAL_X, $REEDBOG_TRANSIT_PORTAL_Y, $vqrange, "ettins portal")
		If GetMapID() = $ReedBog_Map Then $g_i_ReedBogRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQReedBog()
	If GetMapID() <> $ReedBog_Map And GetMapID() <> $ReedBog_Outpost And GetMapID() <> $ReedBog_Transit Then
		_Vanquisher_ResetReedBogRouteProgress()
		CurrentAction("Traveling to Ventari's Refuge for Reed Bog.")
		TravelTo($ReedBog_Outpost)
	EndIf

	If GetMapID() = $ReedBog_Outpost Or GetMapID() = $ReedBog_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutReedBog()
		If GetMapID() <> $ReedBog_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Reed Bog (" & $ReedBog_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $ReedBog_Map Then
		CurrentAction("Reed Bog route waiting — on map " & GetMapID() & ", need " & $ReedBog_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Reed Bog vanquish route.")

	Local $aWaypoints[28][4] = [ _
		[7164, 7081, " ", $vqrange], _
		[4803, 4633, " ", $vqrange], _
		[-485, 7205, " ", $vqrange], _
		[-2694, 6082, " ", $vqrange], _
		[-5773, 5901, " ", $vqrange], _
		[-8670, 3619, " ", $vqrange], _
		[-8526, 70, " ", $vqrange], _
		[-7871, -440, " ", $vqrange], _
		[-7013, 2110, " ", $vqrange], _
		[-5338, 3510, " ", $vqrange], _
		[-2332, 4959, " ", $vqrange], _
		[-2731, 3112, " ", $vqrange], _
		[-5954, 939, " ", $vqrange], _
		[-2948, 1881, " ", $vqrange], _
		[-5198, -476, " ", $vqrange], _
		[-7334, -1604, " ", $vqrange], _
		[-8794, -2909, " ", $vqrange], _
		[-7825, -5029, " ", $vqrange], _
		[-7658, -6698, " ", $vqrange], _
		[-2670, -6828, " ", $vqrange], _
		[-1613, -9109, " ", $vqrange], _
		[-333, -8646, " ", $vqrange], _
		[186, -5512, " ", $vqrange], _
		[2727, -4362, " ", $vqrange], _
		[5507, -4939, " ", $vqrange], _
		[5456, -1279, " ", $vqrange], _
		[5874, 2961, " ", $vqrange], _
		[6662, 4422, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
