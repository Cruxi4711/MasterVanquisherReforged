#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aMajestysRestOutpostPath[1][2] = [ _
	[-5199, 16327] _
]

; Temple of the Ages (138) -> The Black Curtain (18).
Local Const $MAJESTYSREST_TEMPLE_PORTAL_X = -5243
Local Const $MAJESTYSREST_TEMPLE_PORTAL_Y = 15961

; The Black Curtain (18) -> Talmark Wilderness (17). Last path point is approach; portal is separate.
Local Const $MAJESTYSREST_BLACKCURTAIN_PORTAL_X = -20304
Local Const $MAJESTYSREST_BLACKCURTAIN_PORTAL_Y = 1824

; Talmark Wilderness (17) -> Majesty's Rest (60). Last path point is approach; portal is separate.
Local Const $MAJESTYSREST_TALMARK_PORTAL_X = -20339
Local Const $MAJESTYSREST_TALMARK_PORTAL_Y = 3824

Global Const $MAJESTYSREST_TRANSIT_WIK = $GC_I_MAP_ID_WAR_IN_KRYTA_TALMARK_WILDERNESS

Local $aMajestysRestTransitPath[8][2] = [ _
	[-6302, 14890], _
	[-12310, 14349], _
	[-15074, 13794], _
	[-16069, 13242], _
	[-17215, 12961], _
	[-17978, 10435], _
	[-18374, 7235], _
	[-20108, 2457] _
]

Local $aMajestysRestTransit2Path[10][2] = [ _
	[16716, 2887], _
	[11180, 7961], _
	[3437, 8483], _
	[-2499, 8992], _
	[-7004, 10342], _
	[-12458, 9257], _
	[-14167, 10912], _
	[-17071, 7303], _
	[-18812, 5631], _
	[-19523, 3658] _
]

; War in Kryta Talmark (837) -> Majesty's Rest (60). Approach only; portal is separate.
Local $aMajestysRestWiKTransitPath[20][2] = [ _
	[18554, 867], _
	[17307, 2055], _
	[14928, 4637], _
	[12891, 6640], _
	[10948, 7939], _
	[7209, 7811], _
	[2658, 8255], _
	[-365, 8385], _
	[-2377, 5137], _
	[-3942, 2242], _
	[-6322, 1748], _
	[-8319, 3291], _
	[-9942, 5001], _
	[-10717, 7393], _
	[-12610, 9544], _
	[-14841, 10697], _
	[-16086, 9916], _
	[-16913, 7472], _
	[-18487, 6350], _
	[-19323, 3650] _
]

Func _Vanquisher_ResetMajestysRestRouteProgress()
	$g_i_MajestysRestRoute_LastMapHandled = -1
EndFunc

; Temple of the Ages (138) -> The Black Curtain (18) -> Talmark (17 or WiK 837) -> Majesty's Rest farm (60).
Func GoOutMajestysRest()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $MajestysRest_Map Then Return

	If $l_i_Map = $MajestysRest_Outpost Then
		If $g_i_MajestysRestRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Temple of the Ages -> The Black Curtain (portal 1).")
		_Vanquisher_RunAggroApproachPath($aMajestysRestOutpostPath, $vqrange, "temple ")
		_Vanquisher_RunPortalStep($MAJESTYSREST_TEMPLE_PORTAL_X, $MAJESTYSREST_TEMPLE_PORTAL_Y, $vqrange, "temple portal")
		If GetMapID() <> $l_i_Map Then $g_i_MajestysRestRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MajestysRest_Transit Then
		If $g_i_MajestysRestRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("The Black Curtain (transit) -> Talmark Wilderness (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Talmark Wilderness portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		Local $l_i_BlackCurtain = $MajestysRest_Transit
		_Vanquisher_RunAggroApproachPath($aMajestysRestTransitPath, $vqrange, "blackcurtain ")
		If GetMapID() = $l_i_BlackCurtain Then
			_Vanquisher_RunPortalStep($MAJESTYSREST_BLACKCURTAIN_PORTAL_X, $MAJESTYSREST_BLACKCURTAIN_PORTAL_Y, $vqrange, "blackcurtain portal")
		EndIf
		If GetMapID() = $MajestysRest_Transit2 Or GetMapID() = $MAJESTYSREST_TRANSIT_WIK Then
			$g_i_MajestysRestRoute_LastMapHandled = $l_i_BlackCurtain
		EndIf
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MajestysRest_Transit2 Or $l_i_Map = $MAJESTYSREST_TRANSIT_WIK Then
		If $g_i_MajestysRestRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Talmark Wilderness (transit) -> Majesty's Rest (portal 3).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Majesty's Rest portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		Local $l_i_Talmark = $l_i_Map
		If $l_i_Map = $MAJESTYSREST_TRANSIT_WIK Then
			_Vanquisher_RunAggroApproachPath($aMajestysRestWiKTransitPath, $vqrange, "wiktalmark ")
		Else
			_Vanquisher_RunAggroApproachPath($aMajestysRestTransit2Path, $vqrange, "talmark ")
		EndIf
		If GetMapID() = $l_i_Talmark Then
			_Vanquisher_RunPortalStep($MAJESTYSREST_TALMARK_PORTAL_X, $MAJESTYSREST_TALMARK_PORTAL_Y, $vqrange, "talmark portal")
		EndIf
		If GetMapID() = $MajestysRest_Map Then $g_i_MajestysRestRoute_LastMapHandled = $l_i_Talmark
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQMajestysRest()
	If GetMapID() <> $MajestysRest_Map And GetMapID() <> $MajestysRest_Outpost And GetMapID() <> $MajestysRest_Transit And GetMapID() <> $MajestysRest_Transit2 And GetMapID() <> $MAJESTYSREST_TRANSIT_WIK Then
		_Vanquisher_ResetMajestysRestRouteProgress()
		CurrentAction("Traveling to Temple of the Ages for Majesty's Rest.")
		TravelTo($MajestysRest_Outpost)
	EndIf

	If GetMapID() = $MajestysRest_Outpost Or GetMapID() = $MajestysRest_Transit Or GetMapID() = $MajestysRest_Transit2 Or GetMapID() = $MAJESTYSREST_TRANSIT_WIK Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $MajestysRest_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Majesty's Rest (" & $MajestysRest_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $MajestysRest_Map Then
		CurrentAction("Majesty's Rest route waiting — on map " & GetMapID() & ", need " & $MajestysRest_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Majesty's Rest vanquish route.")
	$g_b_Vanquisher_TransitOnly = False
	_Vanquisher_InitCombatAI()

	Local $aWaypoints[77][4] = [ _
		[21522, -3238, " ", $vqrange], _
		[21779, 2461, " ", $vqrange], _
		[22541, 4683, " ", $vqrange], _
		[21272, 6143, " ", $vqrange], _
		[21113, 4524, " ", $vqrange], _
		[20256, 3604, " ", $vqrange], _
		[18129, 2842, " ", $vqrange], _
		[20319, 2048, " ", $vqrange], _
		[18986, 937, " ", $vqrange], _
		[20192, 1033, " ", $vqrange], _
		[20129, -1760, " ", $vqrange], _
		[18193, -269, " ", $vqrange], _
		[16865, 420, " ", $vqrange], _
		[16252, -1572, " ", $vqrange], _
		[17470, -1816, " ", $vqrange], _
		[14470, -1522, " ", $vqrange], _
		[13929, -179, " ", $vqrange], _
		[13789, 167, " ", $vqrange], _
		[13383, 1318, " ", $vqrange], _
		[12857, 1127, " ", $vqrange], _
		[14042, 1574, " ", $vqrange], _
		[13386, 1320, " ", $vqrange], _
		[13783, 170, " ", $vqrange], _
		[13925, -184, " ", $vqrange], _
		[14467, -1528, " ", $vqrange], _
		[15320, -4921, " ", $vqrange], _
		[19111, -7402, " ", $vqrange], _
		[15322, -4908, " ", $vqrange], _
		[14287, -5855, " ", $vqrange], _
		[13149, -2097, " ", $vqrange], _
		[11484, -6221, " ", $vqrange], _
		[8805, -3632, " ", $vqrange], _
		[10805, -966, " ", $vqrange], _
		[10709, 3128, " ", $vqrange], _
		[12931, 4938, " ", $vqrange], _
		[15534, 3509, " ", $vqrange], _
		[16319, 1057, " ", $vqrange], _
		[15541, 3507, " ", $vqrange], _
		[18276, 5403, " ", $vqrange], _
		[15542, 3517, " ", $vqrange], _
		[12933, 4938, " ", $vqrange], _
		[13397, 6362, " ", $vqrange], _
		[11537, 7896, " ", $vqrange], _
		[9509, 7662, " ", $vqrange], _
		[7572, 6635, " ", $vqrange], _
		[7780, 4373, " ", $vqrange], _
		[9496, 5933, " ", $vqrange], _
		[9535, 7677, " ", $vqrange], _
		[7589, 6650, " ", $vqrange], _
		[7797, 4379, " ", $vqrange], _
		[7341, 1421, " ", $vqrange], _
		[8809, -3599, " ", $vqrange], _
		[7368, 1495, " ", $vqrange], _
		[4757, 4572, " ", $vqrange], _
		[2336, 1664, " ", $vqrange], _
		[-2741, -521, " ", $vqrange], _
		[-5523, 833, " ", $vqrange], _
		[-5316, -2823, " ", $vqrange], _
		[-8030, -1960, " ", $vqrange], _
		[-6194, -3179, " ", $vqrange], _
		[-9703, -4954, " ", $vqrange], _
		[-8470, -6348, " ", $vqrange], _
		[-10353, -6155, " ", $vqrange], _
		[-9691, -4930, " ", $vqrange], _
		[-11913, -5155, " ", $vqrange], _
		[-10456, -4250, " ", $vqrange], _
		[-11244, -2854, " ", $vqrange], _
		[-10907, -1180, " ", $vqrange], _
		[-8225, -1147, " ", $vqrange], _
		[-6721, 1585, " ", $vqrange], _
		[-9188, 5174, " ", $vqrange], _
		[-13314, 2000, " ", $vqrange], _
		[-11277, -543, " ", $vqrange], _
		[-13536, 1472, " ", $vqrange], _
		[-17144, -511, " ", $vqrange], _
		[-22539, 1049, " ", $vqrange], _
		[-23160, 337, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

