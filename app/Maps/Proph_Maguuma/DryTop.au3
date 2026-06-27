#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aDryTopOutpostPath[2][2] = [ _
	[820, -10349], _
	[409, -9585] _
]

; Tangle Root (48) -> Dry Top (47). Last path point is approach; portal is separate.
Local Const $DRYTOP_TRANSIT_PORTAL_X = -19513
Local Const $DRYTOP_TRANSIT_PORTAL_Y = 4863

Local $aDryTopTransitPath[21][2] = [ _
	[542, -9581], _
	[-81, -7048], _
	[-3987, -7884], _
	[-6970, -8091], _
	[-8490, -8037], _
	[-9799, -7981], _
	[-12540, -7149], _
	[-12147, -7126], _
	[-14872, -7598], _
	[-17103, -6981], _
	[-20146, -6498], _
	[-23690, -6319], _
	[-25780, -6024], _
	[-24404, -4170], _
	[-23250, -2272], _
	[-23010, -1212], _
	[-21906, -1679], _
	[-21624, 331], _
	[-21307, 2104], _
	[-19629, 2948], _
	[-19395, 4235] _
]

Func _Vanquisher_ResetDryTopRouteProgress()
	$g_i_DryTopRoute_LastMapHandled = -1
EndFunc

; Maguuma Stade (141) -> Tangle Root transit (48) -> Dry Top farm (47).
Func GoOutDryTop()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DryTop_Map Then Return

	If $l_i_Map = $DryTop_Outpost Then
		If $g_i_DryTopRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Maguuma Stade -> Tangle Root (portal 1).")
		_Vanquisher_RunAggroPortalPath($aDryTopOutpostPath, $vqrange, "stade ")
		If GetMapID() <> $l_i_Map Then $g_i_DryTopRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $DryTop_Transit Then
		If $g_i_DryTopRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Tangle Root (transit) -> Dry Top (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Dry Top portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroApproachPath($aDryTopTransitPath, $vqrange, "tangle ")
		_Vanquisher_RunPortalStep($DRYTOP_TRANSIT_PORTAL_X, $DRYTOP_TRANSIT_PORTAL_Y, $vqrange, "tangle portal")
		If GetMapID() = $DryTop_Map Then $g_i_DryTopRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQDryTop()
	If GetMapID() <> $DryTop_Map And GetMapID() <> $DryTop_Outpost And GetMapID() <> $DryTop_Transit Then
		_Vanquisher_ResetDryTopRouteProgress()
		CurrentAction("Traveling to Maguuma Stade for Dry Top.")
		TravelTo($DryTop_Outpost)
	EndIf

	If GetMapID() = $DryTop_Outpost Or GetMapID() = $DryTop_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutDryTop()
		If GetMapID() <> $DryTop_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Dry Top (" & $DryTop_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $DryTop_Map Then
		CurrentAction("Dry Top route waiting — on map " & GetMapID() & ", need " & $DryTop_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Dry Top vanquish route.")

	Local $aWaypoints[45][4] = [ _
		[4726, -6046, " ", $vqrange], _
		[3652, -6357, " ", $vqrange], _
		[1709, -6960, " ", $vqrange], _
		[150, -6957, " ", $vqrange], _
		[-1465, -6071, " ", $vqrange], _
		[-2973, -6180, " ", $vqrange], _
		[-4743, -4626, " ", $vqrange], _
		[-5546, -3189, " ", $vqrange], _
		[-6116, -1455, " ", $vqrange], _
		[-6942, 221, " ", $vqrange], _
		[-7052, 1744, " ", $vqrange], _
		[-6870, 3675, " ", $vqrange], _
		[-6762, 4836, " ", $vqrange], _
		[-6246, 7872, " ", $vqrange], _
		[-6666, 5394, " ", $vqrange], _
		[-4459, 6750, " ", $vqrange], _
		[-2761, 7679, " ", $vqrange], _
		[-2045, 6834, " ", $vqrange], _
		[-401, 6976, " ", $vqrange], _
		[1153, 6953, " ", $vqrange], _
		[2522, 6652, " ", $vqrange], _
		[1794, 5353, " ", $vqrange], _
		[3262, 3513, " ", $vqrange], _
		[3107, 2892, " ", $vqrange], _
		[6138, 2248, " ", $vqrange], _
		[6528, 4224, " ", $vqrange], _
		[3646, 1677, " ", $vqrange], _
		[1775, 1367, " ", $vqrange], _
		[1210, -191, " ", $vqrange], _
		[2669, -2336, " ", $vqrange], _
		[5369, -2187, " ", $vqrange], _
		[6427, -3114, " ", $vqrange], _
		[5919, -5577, " ", $vqrange], _
		[1639, -7009, " ", $vqrange], _
		[-2905, -6831, " ", $vqrange], _
		[-1896, -6216, " ", $vqrange], _
		[-4104, -3672, " ", $vqrange], _
		[-5428, -3241, " ", $vqrange], _
		[-6134, -1119, " ", $vqrange], _
		[-7154, 3174, " ", $vqrange], _
		[-6772, 5855, " ", $vqrange], _
		[-5742, 6064, " ", $vqrange], _
		[-2241, 7155, " ", $vqrange], _
		[1724, 6378, " ", $vqrange], _
		[4813, 4913, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
