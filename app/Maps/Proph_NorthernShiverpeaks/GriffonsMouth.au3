#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

; Gates of Kryta (14) -> Scoundrel's Rise (54).
Local $aGriffonsMouthOutpostPath[2][2] = [ _
	[-4818, 27326], _
	[-4334, 26859] _
]

; Scoundrel's Rise (54) -> Griffon's Mouth (27). Last path point is approach; portal is separate.
Local Const $GRIFFONSMOUTH_TRANSIT_PORTAL_X = 7663
Local Const $GRIFFONSMOUTH_TRANSIT_PORTAL_Y = 8129

Local $aGriffonsMouthTransitPath[9][2] = [ _
	[-1719, -6028], _
	[-1415, -4056], _
	[205, -2686], _
	[1890, -2265], _
	[3660, -1680], _
	[5065, 1032], _
	[6608, 3784], _
	[7512, 6112], _
	[7542, 7201] _
]

Func _Vanquisher_ResetGriffonsMouthRouteProgress()
	$g_i_GriffonsMouthRoute_LastMapHandled = -1
EndFunc

Func GoOutGriffonsMouth()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $GriffonsMouth_Map Then Return

	If $l_i_Map = $GriffonsMouth_Outpost Then
		If $g_i_GriffonsMouthRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Gates of Kryta -> Scoundrel's Rise (portal 1).")
		_Vanquisher_RunAggroPortalPath($aGriffonsMouthOutpostPath, $vqrange, "gates ")
		If GetMapID() <> $l_i_Map Then $g_i_GriffonsMouthRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $GriffonsMouth_Transit Then
		If $g_i_GriffonsMouthRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Scoundrel's Rise (transit) -> Griffon's Mouth (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Griffon's Mouth portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroApproachPath($aGriffonsMouthTransitPath, $vqrange, "scoundrel ")
		_Vanquisher_RunPortalStep($GRIFFONSMOUTH_TRANSIT_PORTAL_X, $GRIFFONSMOUTH_TRANSIT_PORTAL_Y, $vqrange, "scoundrel portal")
		If GetMapID() = $GriffonsMouth_Map Then $g_i_GriffonsMouthRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQGriffonsMouth()
	If GetMapID() <> $GriffonsMouth_Map And GetMapID() <> $GriffonsMouth_Outpost And GetMapID() <> $GriffonsMouth_Transit Then
		_Vanquisher_ResetGriffonsMouthRouteProgress()
		CurrentAction("Traveling to Gates of Kryta for Griffon's Mouth.")
		TravelTo($GriffonsMouth_Outpost)
	EndIf

	If GetMapID() = $GriffonsMouth_Outpost Or GetMapID() = $GriffonsMouth_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutGriffonsMouth()
		If GetMapID() <> $GriffonsMouth_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Griffon's Mouth (" & $GriffonsMouth_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $GriffonsMouth_Map Then
		CurrentAction("Griffon's Mouth route waiting - on map " & GetMapID() & ", need " & $GriffonsMouth_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Griffon's Mouth vanquish route.")

	Local $aWaypoints[29][4] = [ _
		[-2913, -7105, " ", $vqrange], _
		[-570, -6574, " ", $vqrange], _
		[1535, -4368, " ", $vqrange], _
		[3009, -6002, " ", $vqrange], _
		[5547, -3291, " ", $vqrange], _
		[6196, -356, " ", $vqrange], _
		[5998, -3834, " ", $vqrange], _
		[5162, -7264, " ", $vqrange], _
		[6002, -3706, " ", $vqrange], _
		[3041, -6006, " ", $vqrange], _
		[1692, -3331, " ", $vqrange], _
		[762, -1374, " ", $vqrange], _
		[-2270, -1127, " ", $vqrange], _
		[-1849, -4314, " ", $vqrange], _
		[-2464, -1537, " ", $vqrange], _
		[-5098, -977, " ", $vqrange], _
		[-7529, 905, " ", $vqrange], _
		[-6410, 3478, " ", $vqrange], _
		[-3518, 5166, " ", $vqrange], _
		[-2345, 4080, " ", $vqrange], _
		[1349, 2834, " ", $vqrange], _
		[-1156, 3651, " ", $vqrange], _
		[-367, 6241, " ", $vqrange], _
		[-961, 8115, " ", $vqrange], _
		[-3406, 6831, " ", $vqrange], _
		[-1159, 8115, " ", $vqrange], _
		[597, 6595, " ", $vqrange], _
		[3032, 8331, " ", $vqrange], _
		[6586, 5423, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
