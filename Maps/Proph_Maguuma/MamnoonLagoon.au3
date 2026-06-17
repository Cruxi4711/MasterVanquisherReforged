#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aMamnoonLagoonOutpostPath[2][2] = [ _
	[1691, -2667], _
	[1950, -2315] _
]

Local $aMamnoonLagoonTransitPath[11][2] = [ _
	[2757, -1170], _
	[4836, 2597], _
	[7570, 4470], _
	[7950, 7804], _
	[6520, 9733], _
	[6331, 15284], _
	[11355, 15759], _
	[14292, 16691], _
	[15887, 13608], _
	[17008, 13261], _
	[18066, 13453] _
]

Func GoOutMamnoonLagoon()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $MamnoonLagoon_Map Then Return

	If $l_i_Map = $MamnoonLagoon_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MamnoonLagoon (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MamnoonLagoon_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MamnoonLagoon (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQMamnoonLagoon()
	If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MamnoonLagoon.")
		TravelTo($MamnoonLagoon_Outpost)
	EndIf

	If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutMamnoonLagoon()
		If GetMapID() <> $MamnoonLagoon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("MamnoonLagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MamnoonLagoon vanquish route.")

	Local $aWaypoints[68][4] = [ _
		[-4954, -1414], " ", $vqrange], _
		[-3660, -1], " ", $vqrange], _
		[-3166, 1007], " ", $vqrange], _
		[-2839, 2207], " ", $vqrange], _
		[-3536, 3855], " ", $vqrange], _
		[-2553, 3228], " ", $vqrange], _
		[-1959, 1408], " ", $vqrange], _
		[-978, 1903], " ", $vqrange], _
		[-1349, 3002], " ", $vqrange], _
		[-2225, 5157], " ", $vqrange], _
		[-2384, 6261], " ", $vqrange], _
		[-3158, 6609], " ", $vqrange], _
		[-7069, 4816], " ", $vqrange], _
		[-2734, 6786], " ", $vqrange], _
		[-1646, 6377], " ", $vqrange], _
		[307, 6038], " ", $vqrange], _
		[1399, 5664], " ", $vqrange], _
		[2889, 5225], " ", $vqrange], _
		[3665, 4986], " ", $vqrange], _
		[4501, 5508], " ", $vqrange], _
		[6861, 7507], " ", $vqrange], _
		[4547, 5694], " ", $vqrange], _
		[3710, 4874], " ", $vqrange], _
		[3441, 4550], " ", $vqrange], _
		[2913, 2919], " ", $vqrange], _
		[3813, 1316], " ", $vqrange], _
		[4027, 978], " ", $vqrange], _
		[5204, -1001], " ", $vqrange], _
		[5217, -3474], " ", $vqrange], _
		[4609, -4155], " ", $vqrange], _
		[3984, -4970], " ", $vqrange], _
		[2726, -4867], " ", $vqrange], _
		[2612, -4865], " ", $vqrange], _
		[727, -5686], " ", $vqrange], _
		[-880, -6665], " ", $vqrange], _
		[-379, -6476], " ", $vqrange], _
		[-1818, -5119], " ", $vqrange], _
		[-1911, -4077], " ", $vqrange], _
		[-1849, -2155], " ", $vqrange], _
		[-2356, 852], " ", $vqrange], _
		[-2590, 2772], " ", $vqrange], _
		[-2461, 3931], " ", $vqrange], _
		[-1796, 3880], " ", $vqrange], _
		[-1455, 2414], " ", $vqrange], _
		[-1430, 1245], " ", $vqrange], _
		[-1653, -286], " ", $vqrange], _
		[-1868, -1350], " ", $vqrange], _
		[-1836, -3682], " ", $vqrange], _
		[-1792, -4834], " ", $vqrange], _
		[-733, -5717], " ", $vqrange], _
		[393, -6044], " ", $vqrange], _
		[2220, -6112], " ", $vqrange], _
		[4115, -4790], " ", $vqrange], _
		[4715, -3795], " ", $vqrange], _
		[5062, -1589], " ", $vqrange], _
		[5379, -2602], " ", $vqrange], _
		[4776, -3317], " ", $vqrange], _
		[5201, -1528], " ", $vqrange], _
		[4482, 129], " ", $vqrange], _
		[3982, 1601], " ", $vqrange], _
		[3023, 4135], " ", $vqrange], _
		[2340, 5044], " ", $vqrange], _
		[167, 5877], " ", $vqrange], _
		[-2009, 5967], " ", $vqrange], _
		[-2433, 4570], " ", $vqrange], _
		[-2515, 3034], " ", $vqrange], _
		[-2380, 1530], " ", $vqrange], _
		[-2545, 1793], " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

