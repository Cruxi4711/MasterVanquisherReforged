#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aTravelersValeOutpostPath[2][2] = [ _
	[9303, 4208], _
	[9275, 4000] _
]

Func _Vanquisher_ResetTravelersValeRouteProgress()
	$g_i_TravelersValeRoute_LastMapHandled = -1
EndFunc

; Yak's Bend (134) -> Traveler's Vale farm (99).
Func GoOutTravelersVale()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TravelersVale_Map Then Return

	If $l_i_Map = $TravelersVale_Outpost Then
		If $g_i_TravelersValeRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Yak's Bend -> Traveler's Vale.")
		_Vanquisher_RunAggroPortalPath($aTravelersValeOutpostPath, $vqrange, "yaksbend ")
		If GetMapID() <> $l_i_Map Then $g_i_TravelersValeRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQTravelersVale()
	If GetMapID() <> $TravelersVale_Map And GetMapID() <> $TravelersVale_Outpost Then
		_Vanquisher_ResetTravelersValeRouteProgress()
		CurrentAction("Traveling to Yak's Bend.")
		TravelTo($TravelersVale_Outpost)
	EndIf

	If GetMapID() = $TravelersVale_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTravelersVale()
		If GetMapID() <> $TravelersVale_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Traveler's Vale (" & $TravelersVale_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TravelersVale_Map Then
		CurrentAction("Traveler's Vale route waiting — on map " & GetMapID() & ", need " & $TravelersVale_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Traveler's Vale vanquish route.")

	Local $aWaypoints[49][4] = [ _
		[8207.00, -333.00, " ", $vqrange], _
		[11417.00, -2899.00, " ", $vqrange], _
		[10010.00, -6296.00, " ", $vqrange], _
		[9963.00, -10398.00, " ", $vqrange], _
		[10306.00, -13417.00, " ", $vqrange], _
		[8917.00, -14510.00, " ", $vqrange], _
		[5683.00, -16716.00, " ", $vqrange], _
		[2951.00, -14883.00, " ", $vqrange], _
		[338.00, -13873.00, " ", $vqrange], _
		[-866.00, -15697.00, " ", $vqrange], _
		[-3456.00, -16785.00, " ", $vqrange], _
		[-1283.00, -15970.00, " ", $vqrange], _
		[-3080.00, -12849.00, " ", $vqrange], _
		[-5949.00, -12463.00, " ", $vqrange], _
		[-8216.00, -11267.00, " ", $vqrange], _
		[-4301.00, -12607.00, " ", $vqrange], _
		[-2184.00, -13157.00, " ", $vqrange], _
		[947.00, -11275.00, " ", $vqrange], _
		[2561.00, -9659.00, " ", $vqrange], _
		[3322.00, -12900.00, " ", $vqrange], _
		[4254.00, -7633.00, " ", $vqrange], _
		[7700.00, -6871.00, " ", $vqrange], _
		[3990.00, -7655.00, " ", $vqrange], _
		[2096.00, -6324.00, " ", $vqrange], _
		[3341.00, -3666.00, " ", $vqrange], _
		[7534.00, -1623.00, " ", $vqrange], _
		[3439.00, -2328.00, " ", $vqrange], _
		[-374.00, -1352.00, " ", $vqrange], _
		[-1550.00, -2966.00, " ", $vqrange], _
		[-1776.00, -6295.00, " ", $vqrange], _
		[-1550.00, -737.00, " ", $vqrange], _
		[-3184.00, 1337.00, " ", $vqrange], _
		[-2571.00, 6561.00, " ", $vqrange], _
		[-801.00, 8248.00, " ", $vqrange], _
		[-3679.00, 11100.00, " ", $vqrange], _
		[-6869.00, 13503.00, " ", $vqrange], _
		[-8547.00, 12819.00, " ", $vqrange], _
		[-6371.00, 16077.00, " ", $vqrange], _
		[-3117.00, 17801.00, " ", $vqrange], _
		[-2035.00, 16561.00, " ", $vqrange], _
		[278.00, 16481.00, " ", $vqrange], _
		[239.00, 15300.00, " ", $vqrange], _
		[832.00, 13347.00, " ", $vqrange], _
		[-1633.00, 12227.00, " ", $vqrange], _
		[-1227.00, 8598.00, " ", $vqrange], _
		[1825.00, 6460.00, " ", $vqrange], _
		[2915.00, 4653.00, " ", $vqrange], _
		[1299.00, 3860.00, " ", $vqrange], _
		[5094.00, 7017.00, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
