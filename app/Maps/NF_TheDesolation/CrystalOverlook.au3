; Updated by Crux
#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

; The Mouth of Torment (440) -> The Ruptured Heart (439): portal tile in the outpost.
Local Const $CRYSTALOVERLOOK_OUTPOST_PORTAL_X = -4454
Local Const $CRYSTALOVERLOOK_OUTPOST_PORTAL_Y = -6313

; The Ruptured Heart (439) -> Crystal Overlook (448): last path point is approach; portal is separate.
Local Const $CRYSTALOVERLOOK_TRANSIT_PORTAL_X = -19200
Local Const $CRYSTALOVERLOOK_TRANSIT_PORTAL_Y = 1800

Local $aCrystalOverlookTransitPath[8][2] = [ _
	[-5217, -6706], _
	[-7347, -5330], _
	[-8751, -3218], _
	[-11362, -3312], _
	[-13161, -1485], _
	[-15359, -224], _
	[-17327, 1473], _
	[-18421, 1661] _
]

Func _Vanquisher_ResetCrystalOverlookRouteProgress()
	$g_i_CrystalOverlookRoute_LastMapHandled = -1
EndFunc

; The Mouth of Torment (440) -> The Ruptured Heart transit (439) -> Crystal Overlook farm (448).
Func GoOutCrystalOverlook()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $CrystalOverlook_Map Then Return

	If $l_i_Map = $CrystalOverlook_Outpost Then
		If $g_i_CrystalOverlookRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("The Mouth of Torment -> The Ruptured Heart (portal 1).")
		_Vanquisher_RunPortalStep($CRYSTALOVERLOOK_OUTPOST_PORTAL_X, $CRYSTALOVERLOOK_OUTPOST_PORTAL_Y, $vqrange, "mouth of torment portal")
		If GetMapID() <> $l_i_Map Then $g_i_CrystalOverlookRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $CrystalOverlook_Transit Then
		If $g_i_CrystalOverlookRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("The Ruptured Heart (transit) -> Crystal Overlook (portal 2).")
		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Transit map not ready yet — retrying Crystal Overlook portal path.")
			$g_b_Vanquisher_TransitOnly = False
			Return
		EndIf
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroApproachPath($aCrystalOverlookTransitPath, $vqrange, "rupturedheart ")
		_Vanquisher_RunPortalStep($CRYSTALOVERLOOK_TRANSIT_PORTAL_X, $CRYSTALOVERLOOK_TRANSIT_PORTAL_Y, $vqrange, "rupturedheart portal")
		If GetMapID() = $CrystalOverlook_Map Then $g_i_CrystalOverlookRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQCrystalOverlook()
	If GetMapID() <> $CrystalOverlook_Map And GetMapID() <> $CrystalOverlook_Outpost And GetMapID() <> $CrystalOverlook_Transit Then
		_Vanquisher_ResetCrystalOverlookRouteProgress()
		CurrentAction("Traveling to The Mouth of Torment for Crystal Overlook.")
		TravelTo($CrystalOverlook_Outpost)
	EndIf

	If GetMapID() = $CrystalOverlook_Outpost Or GetMapID() = $CrystalOverlook_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $CrystalOverlook_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Crystal Overlook (" & $CrystalOverlook_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $CrystalOverlook_Map Then
		CurrentAction("Crystal Overlook route waiting — on map " & GetMapID() & ", need " & $CrystalOverlook_Map & ".")
		Return
	EndIf

	If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
		CurrentAction("Crystal Overlook not ready yet — waiting for map load.")
		Return
	EndIf

	CurrentAction("Starting Crystal Overlook vanquish route.")
	$g_b_Vanquisher_TransitOnly = False
	_Vanquisher_InitCombatAI()

	; Take Junundu blessing at the first shrine.
	GoNearestNPCToCoords(10987, 21836)
	Sleep(1000)
	Dialog(0x00000084)
	Dialog(0x00000085)
	Sleep(1000)

	Local $aWaypoints[122][4] = [ _
		[13262, 21107, " ", $vqrange], _
		[10987, 21836, "shrine", $vqrange], _
		[13152, 23270, " ", $vqrange], _
		[12906, 24978, " ", $vqrange], _
		[10300, 24829, " ", $vqrange], _
		[7765, 24574, " ", $vqrange], _
		[5952, 24672, " ", $vqrange], _
		[6048, 24001, " ", $vqrange], _
		[6642, 21496, " ", $vqrange], _
		[8830, 20278, " ", $vqrange], _
		[11390, 19900, " ", $vqrange], _
		[10779, 17440, " ", $vqrange], _
		[9288, 15378, " ", $vqrange], _
		[9132, 12862, " ", $vqrange], _
		[10575, 10810, " ", $vqrange], _
		[11147, 8303, " ", $vqrange], _
		[11570, 5811, " ", $vqrange], _
		[13344, 4024, " ", $vqrange], _
		[13048, 1515, " ", $vqrange], _
		[11211, -224, "shrine", $vqrange], _
		[9377, 1476, " ", $vqrange], _
		[7066, 2468, " ", $vqrange], _
		[6952, 5020, " ", $vqrange], _
		[9151, 6289, " ", $vqrange], _
		[10518, 7595, "junundu", $vqrange], _
		[10825, 5061, " ", $vqrange], _
		[11641, 2668, " ", $vqrange], _
		[12708, 343, " ", $vqrange], _
		[13810, -1927, " ", $vqrange], _
		[12417, -4136, " ", $vqrange], _
		[13344, -6136, " ", $vqrange], _
		[12415, -8496, " ", $vqrange], _
		[9865, -8499, " ", $vqrange], _
		[8644, -6232, " ", $vqrange], _
		[7813, -3773, " ", $vqrange], _
		[6694, -1517, " ", $vqrange], _
		[6697, -4119, " ", $vqrange], _
		[7074, -6648, " ", $vqrange], _
		[8155, -8952, " ", $vqrange], _
		[5641, -8799, " ", $vqrange], _
		[3139, -8452, " ", $vqrange], _
		[844, -7270, " ", $vqrange], _
		[860, -9863, " ", $vqrange], _
		[1986, -12220, " ", $vqrange], _
		[4350, -11335, " ", $vqrange], _
		[6847, -10876, " ", $vqrange], _
		[9043, -9546, " ", $vqrange], _
		[10487, -7500, " ", $vqrange], _
		[10653, -10012, " ", $vqrange], _
		[9407, -12308, " ", $vqrange], _
		[8796, -13223, "junundu", $vqrange], _
		[7613, -15438, " ", $vqrange], _
		[8409, -17864, " ", $vqrange], _
		[10543, -19318, " ", $vqrange], _
		[12776, -20538, " ", $vqrange], _
		[12578, -21558, "shrine", $vqrange], _
		[10010, -21349, " ", $vqrange], _
		[7500, -21208, " ", $vqrange], _
		[4976, -22026, " ", $vqrange], _
		[2382, -22464, " ", $vqrange], _
		[128, -23546, " ", $vqrange], _
		[-1345, -25603, " ", $vqrange], _
		[-3379, -24109, " ", $vqrange], _
		[-3246, -23603, " ", $vqrange], _
		[-3556, -23339, "shrine", $vqrange], _
		[-5682, -21823, " ", $vqrange], _
		[-3656, -20299, " ", $vqrange], _
		[-1147, -20561, " ", $vqrange], _
		[1380, -20665, " ", $vqrange], _
		[3581, -19365, " ", $vqrange], _
		[5498, -17706, " ", $vqrange], _
		[6416, -15272, " ", $vqrange], _
		[4376, -13700, " ", $vqrange], _
		[1815, -13710, " ", $vqrange], _
		[-583, -14666, " ", $vqrange], _
		[-2945, -15777, " ", $vqrange], _
		[-5459, -16095, " ", $vqrange], _
		[-7979, -16190, " ", $vqrange], _
		[-9398, -14114, " ", $vqrange], _
		[-6843, -13609, " ", $vqrange], _
		[-4492, -12695, " ", $vqrange], _
		[-2317, -11413, " ", $vqrange], _
		[-2528, -8872, " ", $vqrange], _
		[-4453, -8829, "shrine", $vqrange], _
		[-3921, -6281, " ", $vqrange], _
		[-3312, -3813, " ", $vqrange], _
		[-1380, -2148, " ", $vqrange], _
		[-2823, -21, " ", $vqrange], _
		[-4123, -2217, " ", $vqrange], _
		[-5541, -4337, " ", $vqrange], _
		[-7191, -6386, " ", $vqrange], _
		[-7929, -8861, " ", $vqrange], _
		[-9677, -10795, " ", $vqrange], _
		[-11888, -9419, " ", $vqrange], _
		[-12948, -7150, " ", $vqrange], _
		[-12128, -4700, " ", $vqrange], _
		[-9948, -3386, " ", $vqrange], _
		[-10680, -867, " ", $vqrange], _
		[-12567, 870, " ", $vqrange], _
		[-12944, 3391, " ", $vqrange], _
		[-10482, 2850, " ", $vqrange], _
		[-8392, 1310, " ", $vqrange], _
		[-5805, 1417, " ", $vqrange], _
		[-4246, 3512, " ", $vqrange], _
		[-2889, 5121, "shrine", $vqrange], _
		[-5387, 5428, " ", $vqrange], _
		[-3941, 7582, " ", $vqrange], _
		[-1581, 8472, " ", $vqrange], _
		[314, 10158, " ", $vqrange], _
		[2950, 10490, " ", $vqrange], _
		[5425, 11284, " ", $vqrange], _
		[2927, 11569, " ", $vqrange], _
		[640, 10528, " ", $vqrange], _
		[-1186, 8807, " ", $vqrange], _
		[-3156, 7259, " ", $vqrange], _
		[-4618, 9412, " ", $vqrange], _
		[-5568, 10656, " ", $vqrange], _
		[-3543, 9111, " ", $vqrange], _
		[-5514, 7507, " ", $vqrange], _
		[-7935, 6715, " ", $vqrange], _
		[-9768, 8477, " ", $vqrange], _
		[-11260, 10509, " ", $vqrange] _
	]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
