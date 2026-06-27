#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

; Yak's Bend (134) -> Traveler's Vale (99).
Local $aIronHorseMineOutpostPath[2][2] = [ _
	[9303, 4208], _
	[9275, 4000] _
]

; Traveler's Vale (99) -> Iron Horse Mine (88). Last path point is approach; portal is separate.
Local Const $IRONHORSEMINE_TRANSIT_PORTAL_X = -11061
Local Const $IRONHORSEMINE_TRANSIT_PORTAL_Y = 14398

Local $aIronHorseMineTransitPath[16][2] = [ _
	[9069, 3087], _
	[8428, 999], _
	[7987, -485], _
	[6780, -1772], _
	[3632, -2064], _
	[2335, 412], _
	[2289, 3625], _
	[2209, 6007], _
	[848, 7871], _
	[-1246, 9271], _
	[-3344, 11264], _
	[-5158, 12696], _
	[-6721, 13662], _
	[-7851, 13042], _
	[-9986, 12390], _
	[-10666, 13372] _
]

Func _Vanquisher_ResetIronHorseMineRouteProgress()
	$g_i_IronHorseMineRoute_LastMapHandled = -1
EndFunc

Func GoOutIronHorseMine()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $IronHorseMine_Map Then Return

	If $l_i_Map = $IronHorseMine_Outpost Then
		If $g_i_IronHorseMineRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Yak's Bend -> Traveler's Vale (portal 1).")
		_Vanquisher_RunAggroPortalPath($aIronHorseMineOutpostPath, $vqrange, "yaksbend ")
		If GetMapID() <> $l_i_Map Then $g_i_IronHorseMineRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $IronHorseMine_Transit Then
		If $g_i_IronHorseMineRoute_LastMapHandled = $l_i_Map Then Return
		CurrentAction("Traveler's Vale (transit) -> Iron Horse Mine (portal 2).")
		If Not _Vanquisher_RunExplorableTransitLeg($aIronHorseMineTransitPath, $IRONHORSEMINE_TRANSIT_PORTAL_X, $IRONHORSEMINE_TRANSIT_PORTAL_Y, $vqrange, "travelers ") Then
			CurrentAction("Transit map not ready yet — retrying Iron Horse Mine portal path.")
			Return
		EndIf
		If GetMapID() = $IronHorseMine_Map Then $g_i_IronHorseMineRoute_LastMapHandled = $l_i_Map
	EndIf
EndFunc

Func VQIronHorseMine()
	If GetMapID() <> $IronHorseMine_Map And GetMapID() <> $IronHorseMine_Outpost And GetMapID() <> $IronHorseMine_Transit Then
		_Vanquisher_ResetIronHorseMineRouteProgress()
		CurrentAction("Traveling to Yak's Bend for Iron Horse Mine.")
		TravelTo($IronHorseMine_Outpost)
	EndIf

	If GetMapID() = $IronHorseMine_Outpost Or GetMapID() = $IronHorseMine_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutIronHorseMine()
		If GetMapID() <> $IronHorseMine_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Iron Horse Mine (" & $IronHorseMine_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $IronHorseMine_Map Then
		CurrentAction("Iron Horse Mine route waiting - on map " & GetMapID() & ", need " & $IronHorseMine_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Iron Horse Mine vanquish route.")

	Local $aWaypoints[85][4] = [ _
		[-23955, 4146, " ", $vqrange], _
		[-23588, 6713, " ", $vqrange], _
		[-17833, 5133, " ", $vqrange], _
		[-18474, 605, " ", $vqrange], _
		[-18087, -3239, " ", $vqrange], _
		[-19673, -5919, " ", $vqrange], _
		[-16641, -7577, " ", $vqrange], _
		[-12902, -5919, " ", $vqrange], _
		[-15653, -3204, " ", $vqrange], _
		[-12656, -4826, " ", $vqrange], _
		[-8988, -3239, " ", $vqrange], _
		[-6237, -3380, " ", $vqrange], _
		[-3322, -1353, " ", $vqrange], _
		[-618, -267, " ", $vqrange], _
		[-421, 1340, " ", $vqrange], _
		[386, 3895, " ", $vqrange], _
		[-47, 5755, " ", $vqrange], _
		[-2412, 6983, " ", $vqrange], _
		[-3622, 5863, " ", $vqrange], _
		[-1347, 3155, " ", $vqrange], _
		[25, 3732, " ", $vqrange], _
		[-1203, 6676, " ", $vqrange], _
		[-4326, 7091, " ", $vqrange], _
		[-7826, 6115, " ", $vqrange], _
		[-8221, 2052, " ", $vqrange], _
		[-5804, 1975, " ", $vqrange], _
		[-10501, 1902, " ", $vqrange], _
		[-12013, 3414, " ", $vqrange], _
		[-14315, 5220, " ", $vqrange], _
		[-15918, 7928, " ", $vqrange], _
		[-18626, 6597, " ", $vqrange], _
		[-15150, 7748, " ", $vqrange], _
		[-13525, 3979, " ", $vqrange], _
		[-8447, 5852, " ", $vqrange], _
		[-1766, 8177, " ", $vqrange], _
		[468, 10592, " ", $vqrange], _
		[3673, 9960, " ", $vqrange], _
		[3515, 6710, " ", $vqrange], _
		[7443, 7319, " ", $vqrange], _
		[7660, 9277, " ", $vqrange], _
		[7746, 9207, " ", $vqrange], _
		[8477, 7286, " ", $vqrange], _
		[7777, 3275, " ", $vqrange], _
		[11620, 3419, " ", $vqrange], _
		[12472, 6077, " ", $vqrange], _
		[9424, 7594, " ", $vqrange], _
		[12703, 5730, " ", $vqrange], _
		[12024, 3202, " ", $vqrange], _
		[14827, 3982, " ", $vqrange], _
		[13830, 5470, " ", $vqrange], _
		[16970, 6146, " ", $vqrange], _
		[18765, 7824, " ", $vqrange], _
		[18413, 10728, " ", $vqrange], _
		[20551, 10300, " ", $vqrange], _
		[23255, 10855, " ", $vqrange], _
		[24931, 10069, " ", $vqrange], _
		[25130, 6254, " ", $vqrange], _
		[23954, 5154, " ", $vqrange], _
		[22579, 4391, " ", $vqrange], _
		[25866, 1698, " ", $vqrange], _
		[25626, -1969, " ", $vqrange], _
		[24610, -3549, " ", $vqrange], _
		[25338, -6370, " ", $vqrange], _
		[23036, -5083, " ", $vqrange], _
		[20576, -6573, " ", $vqrange], _
		[16716, -6257, " ", $vqrange], _
		[17100, -7363, " ", $vqrange], _
		[15317, -9913, " ", $vqrange], _
		[10668, -7589, " ", $vqrange], _
		[10803, -4564, " ", $vqrange], _
		[12315, -2398, " ", $vqrange], _
		[9787, -1156, " ", $vqrange], _
		[4991, -5907, " ", $vqrange], _
		[1886, -6586, " ", $vqrange], _
		[3691, -4607, " ", $vqrange], _
		[3101, -2217, " ", $vqrange], _
		[6599, 2777, " ", $vqrange], _
		[2609, -2524, " ", $vqrange], _
		[586, -3841, " ", $vqrange], _
		[571, -5199, " ", $vqrange], _
		[-872, -6129, " ", $vqrange], _
		[-135, -7672, " ", $vqrange], _
		[-4699, -8582, " ", $vqrange], _
		[-8368, -7730, " ", $vqrange], _
		[-7877, -4046, " ", $vqrange] ]

	Local $l_f_PlayerX = Agent_GetAgentInfo(-2, "X")
	Local $l_f_PlayerY = Agent_GetAgentInfo(-2, "Y")
	If $l_f_PlayerX > 10000 Then
		_Vanquisher_ClearDeathCheckpoint()
		_Vanquisher_ClearRouteProgress()
		Local $l_i_EntryStart = _Vanquisher_FindClosestWaypointIndex($aWaypoints)
		$g_i_Vanquisher_ProgressFloorIndex = $l_i_EntryStart
		$g_i_Vanquisher_ProgressRouteSize = UBound($aWaypoints)
		$g_s_Vanquisher_ProgressPhase = "forward"
		$g_b_Vanquisher_RecoverMidRun = True
		CurrentAction("Iron Horse Mine — southwest entry, starting forward at wp " & ($l_i_EntryStart + 1) & ".")
	ElseIf Not $g_b_Vanquisher_RecoverMidRun And $g_s_Vanquisher_ProgressPhase = "" And Not $g_b_Vanquisher_DeathReturnActive Then
		Local $l_f_DistToWp1 = ComputeDistance($l_f_PlayerX, $l_f_PlayerY, $aWaypoints[0][0], $aWaypoints[0][1])
		If $l_f_DistToWp1 > 3000 Then
			Local $l_i_EntryStart = _Vanquisher_FindClosestWaypointIndex($aWaypoints)
			$g_i_Vanquisher_ProgressFloorIndex = $l_i_EntryStart
			$g_i_Vanquisher_ProgressRouteSize = UBound($aWaypoints)
			$g_s_Vanquisher_ProgressPhase = "forward"
			$g_b_Vanquisher_RecoverMidRun = True
			CurrentAction("Iron Horse Mine — off-route entry, starting forward at wp " & ($l_i_EntryStart + 1) & ".")
		EndIf
	EndIf

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
