#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aTheFallsOutpostPath[2][2] = [ _
	[-14497, 835], _
	[-15074, 437] _
]

; Ettin's Back (44) -> Reed Bog (45). Last path point is approach; portal is separate.
Local Const $THEFALLS_TRANSIT_PORTAL_X = -23270
Local Const $THEFALLS_TRANSIT_PORTAL_Y = -11426

Local $aTheFallsTransitPath[12][2] = [ _
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

; Reed Bog (45) -> The Falls (46). Last path point is approach; portal is separate.
Local Const $THEFALLS_TRANSIT2_PORTAL_X = -7444
Local Const $THEFALLS_TRANSIT2_PORTAL_Y = -8557

Local $aTheFallsTransit2Path[13][2] = [ _
	[7020, 6680], _
	[5146, 4827], _
	[6116, 3654], _
	[5890, 1132], _
	[5715, -1765], _
	[4996, -4440], _
	[1538, -4971], _
	[61, -6511], _
	[-734, -8616], _
	[-1950, -8705], _
	[-2474, -6826], _
	[-5398, -6985], _
	[-6421, -7771] _
]

Func _Vanquisher_ResetTheFallsRouteProgress()
	$g_i_TheFallsRoute_LastMapHandled = -1
EndFunc

; Ventari's Refuge (139) -> Ettin's Back (44) -> Reed Bog (45) -> The Falls farm (46).
Func GoOutTheFalls()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TheFalls_Map Then Return

	If $l_i_Map = $TheFalls_Outpost Then
		If $g_i_TheFallsRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Ventari's Refuge -> Ettin's Back (portal 1).")
		_Vanquisher_RunAggroPortalPath($aTheFallsOutpostPath, $vqrange, "ventari ")
		If GetMapID() <> $l_i_Map Then $g_i_TheFallsRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheFalls_Transit Then
		If $g_i_TheFallsRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Ettin's Back (transit) -> Reed Bog (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Reed Bog portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroApproachPath($aTheFallsTransitPath, $vqrange, "ettins ")
		_Vanquisher_RunPortalStep($THEFALLS_TRANSIT_PORTAL_X, $THEFALLS_TRANSIT_PORTAL_Y, $vqrange, "ettins portal")
		If GetMapID() = $TheFalls_Transit2 Then $g_i_TheFallsRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheFalls_Transit2 Then
		If $g_i_TheFallsRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Reed Bog (transit) -> The Falls (portal 3).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying The Falls portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroApproachPath($aTheFallsTransit2Path, $vqrange, "reedbog ")
		_Vanquisher_RunPortalStep($THEFALLS_TRANSIT2_PORTAL_X, $THEFALLS_TRANSIT2_PORTAL_Y, $vqrange, "reedbog portal")
		If GetMapID() = $TheFalls_Map Then $g_i_TheFallsRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQTheFalls()
	If GetMapID() <> $TheFalls_Map And GetMapID() <> $TheFalls_Outpost And GetMapID() <> $TheFalls_Transit And GetMapID() <> $TheFalls_Transit2 Then
		_Vanquisher_ResetTheFallsRouteProgress()
		CurrentAction("Traveling to Ventari's Refuge for The Falls.")
		TravelTo($TheFalls_Outpost)
	EndIf

	If GetMapID() = $TheFalls_Outpost Or GetMapID() = $TheFalls_Transit Or GetMapID() = $TheFalls_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheFalls()
		If GetMapID() <> $TheFalls_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need The Falls (" & $TheFalls_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TheFalls_Map Then
		CurrentAction("The Falls route waiting — on map " & GetMapID() & ", need " & $TheFalls_Map & ".")
		Return
	EndIf

	CurrentAction("Starting The Falls vanquish route.")

	Local $aWaypoints[140][4] = [ _
		[17116, 2201, " ", $vqrange], _
		[14733, 1984, " ", $vqrange], _
		[14640, -893, " ", $vqrange], _
		[11608, -2750, " ", $vqrange], _
		[10710, -6711, " ", $vqrange], _
		[11670, -10145, " ", $vqrange], _
		[6997, -13425, " ", $vqrange], _
		[4089, -14942, " ", $vqrange], _
		[4924, -17200, " ", $vqrange], _
		[5883, -18098, " ", $vqrange], _
		[6564, -16891, " ", $vqrange], _
		[7895, -16365, " ", $vqrange], _
		[7771, -14911, " ", $vqrange], _
		[11979, -15932, " ", $vqrange], _
		[15551, -9403, " ", $vqrange], _
		[13115, -15383, " ", $vqrange], _
		[15888, -13898, " ", $vqrange], _
		[15554, -12635, " ", $vqrange], _
		[16480, -11240, " ", $vqrange], _
		[16670, -8249, " ", $vqrange], _
		[19420, -10505, " ", $vqrange], _
		[17291, -12407, " ", $vqrange], _
		[16289, -15271, " ", $vqrange], _
		[17658, -12495, " ", $vqrange], _
		[19040, -10518, " ", $vqrange], _
		[15871, -7235, " ", $vqrange], _
		[16543, -5461, " ", $vqrange], _
		[15339, -6297, " ", $vqrange], _
		[12969, -5284, " ", $vqrange], _
		[11055, -6703, " ", $vqrange], _
		[11993, -10112, " ", $vqrange], _
		[6999, -14194, " ", $vqrange], _
		[2452, -16332, " ", $vqrange], _
		[361, -14194, " ", $vqrange], _
		[2706, -14051, " ", $vqrange], _
		[-273, -13956, " ", $vqrange], _
		[-1287, -12134, " ", $vqrange], _
		[-2237, -13687, " ", $vqrange], _
		[-3964, -16285, " ", $vqrange], _
		[-6990, -19168, " ", $vqrange], _
		[-10457, -18986, " ", $vqrange], _
		[-12204, -18155, " ", $vqrange], _
		[-14972, -18357, " ", $vqrange], _
		[-13187, -15721, " ", $vqrange], _
		[-14808, -13390, " ", $vqrange], _
		[-16603, -14647, " ", $vqrange], _
		[-17596, -15205, " ", $vqrange], _
		[-19107, -16644, " ", $vqrange], _
		[-20517, -16705, " ", $vqrange], _
		[-19705, -18034, " ", $vqrange], _
		[-19117, -16703, " ", $vqrange], _
		[-17197, -15815, " ", $vqrange], _
		[-15707, -15379, " ", $vqrange], _
		[-14709, -12432, " ", $vqrange], _
		[-16777, -10924, " ", $vqrange], _
		[-18221, -11475, " ", $vqrange], _
		[-18659, -8766, " ", $vqrange], _
		[-16747, -7362, " ", $vqrange], _
		[-17165, -6526, " ", $vqrange], _
		[-16798, -5854, " ", $vqrange], _
		[-14681, -5651, " ", $vqrange], _
		[-13870, -3256, " ", $vqrange], _
		[-12108, -4244, " ", $vqrange], _
		[-10663, -5677, " ", $vqrange], _
		[-10182, -8186, " ", $vqrange], _
		[-11361, -8870, " ", $vqrange], _
		[-11386, -10848, " ", $vqrange], _
		[-11158, -13116, " ", $vqrange], _
		[-10625, -13725, " ", $vqrange], _
		[-7432, -10607, " ", $vqrange], _
		[-7774, -13002, " ", $vqrange], _
		[-9421, -13002, " ", $vqrange], _
		[-7444, -18592, " ", $vqrange], _
		[-9535, -13332, " ", $vqrange], _
		[-11158, -11012, " ", $vqrange], _
		[-11500, -8554, " ", $vqrange], _
		[-13693, -8351, " ", $vqrange], _
		[-13452, -6602, " ", $vqrange], _
		[-12717, -5841, " ", $vqrange], _
		[-12996, -5322, " ", $vqrange], _
		[-13110, -2432, " ", $vqrange], _
		[-10752, -1088, " ", $vqrange], _
		[-9016, 1282, " ", $vqrange], _
		[-5163, -949, " ", $vqrange], _
		[-7558, -2533, " ", $vqrange], _
		[-10233, -2140, " ", $vqrange], _
		[-8838, -1557, " ", $vqrange], _
		[-6709, -1418, " ", $vqrange], _
		[-8648, -62, " ", $vqrange], _
		[-10042, -873, " ", $vqrange], _
		[-8091, -87, " ", $vqrange], _
		[-4935, -2052, " ", $vqrange], _
		[-4393, -3230, " ", $vqrange], _
		[-3640, -6180, " ", $vqrange], _
		[1687, -6893, " ", $vqrange], _
		[3667, -3844, " ", $vqrange], _
		[1053, -1348, " ", $vqrange], _
		[-1204, -3071, " ", $vqrange], _
		[-3502, -3487, " ", $vqrange], _
		[-1105, -2041, " ", $vqrange], _
		[-1290, 799, " ", $vqrange], _
		[393, 3374, " ", $vqrange], _
		[-3172, 3497, " ", $vqrange], _
		[-5375, 5106, " ", $vqrange], _
		[-10103, 8077, " ", $vqrange], _
		[-14311, 5354, " ", $vqrange], _
		[-13866, 3176, " ", $vqrange], _
		[-15103, 2829, " ", $vqrange], _
		[-16390, 7136, " ", $vqrange], _
		[-19534, 10107, " ", $vqrange], _
		[-18173, 13350, " ", $vqrange], _
		[-16440, 12681, " ", $vqrange], _
		[-14274, 16111, " ", $vqrange], _
		[-12785, 18694, " ", $vqrange], _
		[-9300, 19185, " ", $vqrange], _
		[-6480, 16951, " ", $vqrange], _
		[-5918, 14653, " ", $vqrange], _
		[-5332, 11928, " ", $vqrange], _
		[-3906, 14130, " ", $vqrange], _
		[-4857, 11595, " ", $vqrange], _
		[-3051, 11072, " ", $vqrange], _
		[-1958, 11706, " ", $vqrange], _
		[-1910, 13211, " ", $vqrange], _
		[-389, 14288, " ", $vqrange], _
		[-864, 16079, " ", $vqrange], _
		[-3130, 15889, " ", $vqrange], _
		[-5459, 14748, " ", $vqrange], _
		[-6647, 18297, " ", $vqrange], _
		[-2480, 19501, " ", $vqrange], _
		[942, 18994, " ", $vqrange], _
		[2637, 18091, " ", $vqrange], _
		[3112, 15271, " ", $vqrange], _
		[2146, 12720, " ", $vqrange], _
		[2447, 10977, " ", $vqrange], _
		[1163, 10090, " ", $vqrange], _
		[3492, 9139, " ", $vqrange], _
		[2494, 7682, " ", $vqrange], _
		[1369, 4941, " ", $vqrange], _
		[1686, 2390, " ", $vqrange], _
		[149, 4133, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

