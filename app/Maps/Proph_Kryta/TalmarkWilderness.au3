#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aTalmarkWildernessOutpostPath[1][2] = [ _
	[-5199, 16327] _
]

; Temple of the Ages (138) -> The Black Curtain (18).
Local Const $TALMARK_TEMPLE_PORTAL_X = -5243
Local Const $TALMARK_TEMPLE_PORTAL_Y = 15961

; The Black Curtain (18) -> Talmark Wilderness (17 or WiK 837). Last path point is approach; portal is separate.
Local Const $TALMARK_BLACKCURTAIN_PORTAL_X = -20304
Local Const $TALMARK_BLACKCURTAIN_PORTAL_Y = 1824

Global Const $TALMARK_TRANSIT_WIK = $GC_I_MAP_ID_WAR_IN_KRYTA_TALMARK_WILDERNESS

Local $aTalmarkWildernessTransitPath[8][2] = [ _
	[-6302, 14890], _
	[-12310, 14349], _
	[-15074, 13794], _
	[-16069, 13242], _
	[-17215, 12961], _
	[-17978, 10435], _
	[-18374, 7235], _
	[-20108, 2457] _
]

Func _Vanquisher_ResetTalmarkWildernessRouteProgress()
	$g_i_TalmarkWildernessRoute_LastMapHandled = -1
EndFunc

; Temple of the Ages (138) -> The Black Curtain (18) -> Talmark Wilderness farm (17 or WiK 837).
Func GoOutTalmarkWilderness()
	Local $l_i_Map = GetMapID()

	If _Vanquisher_IsOnTalmarkWildernessMap() Then Return

	If $l_i_Map = $TalmarkWilderness_Outpost Then
		If $g_i_TalmarkWildernessRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Temple of the Ages -> The Black Curtain (portal 1).")
		_Vanquisher_RunAggroApproachPath($aTalmarkWildernessOutpostPath, $vqrange, "temple ")
		_Vanquisher_RunPortalStep($TALMARK_TEMPLE_PORTAL_X, $TALMARK_TEMPLE_PORTAL_Y, $vqrange, "temple portal")
		If GetMapID() <> $l_i_Map Then $g_i_TalmarkWildernessRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TalmarkWilderness_Transit Then
		If $g_i_TalmarkWildernessRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("The Black Curtain (transit) -> Talmark Wilderness (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Talmark Wilderness portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		Local $l_i_BlackCurtain = $TalmarkWilderness_Transit
		_Vanquisher_RunAggroApproachPath($aTalmarkWildernessTransitPath, $vqrange, "blackcurtain ")
		If GetMapID() = $l_i_BlackCurtain Then
			_Vanquisher_RunPortalStep($TALMARK_BLACKCURTAIN_PORTAL_X, $TALMARK_BLACKCURTAIN_PORTAL_Y, $vqrange, "blackcurtain portal")
		EndIf
		If GetMapID() = $TalmarkWilderness_Map Or GetMapID() = $TALMARK_TRANSIT_WIK Then
			$g_i_TalmarkWildernessRoute_LastMapHandled = $l_i_BlackCurtain
		EndIf
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQTalmarkWilderness()
	If Not _Vanquisher_IsOnTalmarkWildernessMap() And GetMapID() <> $TalmarkWilderness_Outpost And GetMapID() <> $TalmarkWilderness_Transit Then
		_Vanquisher_ResetTalmarkWildernessRouteProgress()
		CurrentAction("Traveling to Temple of the Ages for Talmark Wilderness.")
		TravelTo($TalmarkWilderness_Outpost)
	EndIf

	If GetMapID() = $TalmarkWilderness_Outpost Or GetMapID() = $TalmarkWilderness_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutTalmarkWilderness()
		If Not _Vanquisher_IsOnTalmarkWildernessMap() Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Talmark Wilderness (" & $TalmarkWilderness_Map & ").")
			Return
		EndIf
	EndIf

	If Not _Vanquisher_IsOnTalmarkWildernessMap() Then
		CurrentAction("Talmark Wilderness route waiting — on map " & GetMapID() & ", need " & $TalmarkWilderness_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Talmark Wilderness vanquish route.")

	Local $aWaypoints[73][4] = [ _
		[16888, 2685, " ", $vqrange], _
		[10801, 8084, " ", $vqrange], _
		[8472, 8084, " ", $vqrange], _
		[9795, 11948, " ", $vqrange], _
		[7836, 5755, " ", $vqrange], _
		[3125, 8031, " ", $vqrange], _
		[-1692, 7396, " ", $vqrange], _
		[-4021, 9672, " ", $vqrange], _
		[-7038, 10678, " ", $vqrange], _
		[-4127, 16024, " ", $vqrange], _
		[3371, 16248, " ", $vqrange], _
		[-421, 12583, " ", $vqrange], _
		[4872, 14489, " ", $vqrange], _
		[-377, 12410, " ", $vqrange], _
		[-5391, 13832, " ", $vqrange], _
		[-6983, 10716, " ", $vqrange], _
		[-8643, 9801, " ", $vqrange], _
		[-10608, 13765, " ", $vqrange], _
		[-12979, 13460, " ", $vqrange], _
		[-13352, 10784, " ", $vqrange], _
		[-16299, 9564, " ", $vqrange], _
		[-16807, 7464, " ", $vqrange], _
		[-18603, 4686, " ", $vqrange], _
		[-16977, 7362, " ", $vqrange], _
		[-14233, 10750, " ", $vqrange], _
		[-12200, 9225, " ", $vqrange], _
		[-9591, 8514, " ", $vqrange], _
		[-10438, 3466, " ", $vqrange], _
		[-12225, 188, " ", $vqrange], _
		[-13793, -1332, " ", $vqrange], _
		[-10828, -2522, " ", $vqrange], _
		[-6974, -5401, " ", $vqrange], _
		[-4264, -4089, " ", $vqrange], _
		[-1935, -2437, " ", $vqrange], _
		[-1709, -6498, " ", $vqrange], _
		[-555, -4552, " ", $vqrange], _
		[-72, -2098, " ", $vqrange], _
		[-2740, 824, " ", $vqrange], _
		[-6726, 1964, " ", $vqrange], _
		[-2909, 2136, " ", $vqrange], _
		[-2824, 5355, " ", $vqrange], _
		[267, 6159, " ", $vqrange], _
		[606, -108, " ", $vqrange], _
		[4849, 1524, " ", $vqrange], _
		[6831, 4338, " ", $vqrange], _
		[11150, 2856, " ", $vqrange], _
		[11955, -447, " ", $vqrange], _
		[12600, -4097, " ", $vqrange], _
		[10633, -3261, " ", $vqrange], _
		[7254, -1675, " ", $vqrange], _
		[2808, -1506, " ", $vqrange], _
		[6407, -3792, " ", $vqrange], _
		[4713, -6714, " ", $vqrange], _
		[8059, -8662, " ", $vqrange], _
		[9163, -7314, " ", $vqrange], _
		[10049, -9086, " ", $vqrange], _
		[10388, -9170, " ", $vqrange], _
		[13691, -10102, " ", $vqrange], _
		[13288, -7637, " ", $vqrange], _
		[11813, -7490, " ", $vqrange], _
		[13860, -9933, " ", $vqrange], _
		[10134, -9382, " ", $vqrange], _
		[12505, -13659, " ", $vqrange], _
		[7466, -10144, " ", $vqrange], _
		[6915, -12092, " ", $vqrange], _
		[6661, -15353, " ", $vqrange], _
		[9071, -15697, " ", $vqrange], _
		[3104, -14464, " ", $vqrange], _
		[5349, -10652, " ", $vqrange], _
		[5052, -8154, " ", $vqrange], _
		[2723, -7730, " ", $vqrange], _
		[2850, -10017, " ", $vqrange], _
		[-538, -11584, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
