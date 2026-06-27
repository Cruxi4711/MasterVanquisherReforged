#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aOldAscalonOutpostPath[2][2] = [ _
	[625, 1883], _
	[-426, 1874] _
]

Func GoOutOldAscalon()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $OldAscalon_Map Then Return

	If $l_i_Map = $OldAscalon_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> OldAscalon (portal 1)")
		_Vanquisher_RunAggroPortalPath($aOldAscalonOutpostPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQOldAscalon()
	If GetMapID() <> $OldAscalon_Map And GetMapID() <> $OldAscalon_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for OldAscalon.")
		TravelTo($OldAscalon_Outpost)
	EndIf

	If GetMapID() = $OldAscalon_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutOldAscalon()
		If GetMapID() <> $OldAscalon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need OldAscalon (" & $OldAscalon_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $OldAscalon_Map Then
		CurrentAction("OldAscalon route waiting - on map " & GetMapID() & ", need " & $OldAscalon_Map & ".")
		Return
	EndIf

	CurrentAction("Starting OldAscalon vanquish route.")

	Local $aWaypoints[109][4] = [ _
		[16450, 10402, " ", $vqrange], _
		[12678, 15158, " ", $vqrange], _
		[13497, 17507, " ", $vqrange], _
		[15044, 15051, " ", $vqrange], _
		[16390, 12941, " ", $vqrange], _
		[15394, 13531, " ", $vqrange], _
		[12288, 10427, " ", $vqrange], _
		[8346, 12247, " ", $vqrange], _
		[9186, 18143, " ", $vqrange], _
		[3553, 18931, " ", $vqrange], _
		[2832, 14636, " ", $vqrange], _
		[3585, 11189, " ", $vqrange], _
		[5507, 12840, " ", $vqrange], _
		[7016, 10481, " ", $vqrange], _
		[3491, 5105, " ", $vqrange], _
		[518, 4808, " ", $vqrange], _
		[-2672, 1925, " ", $vqrange], _
		[-4969, 4636, " ", $vqrange], _
		[-1784, 8510, " ", $vqrange], _
		[-6031, 5872, " ", $vqrange], _
		[-5344, 7588, " ", $vqrange], _
		[-6061, 9200, " ", $vqrange], _
		[-2613, 10633, " ", $vqrange], _
		[402, 12533, " ", $vqrange], _
		[-3038, 13634, " ", $vqrange], _
		[-2372, 17606, " ", $vqrange], _
		[-4392, 13799, " ", $vqrange], _
		[-7539, 16234, " ", $vqrange], _
		[-9194, 15991, " ", $vqrange], _
		[-9860, 16899, " ", $vqrange], _
		[-10907, 16894, " ", $vqrange], _
		[-11752, 15729, " ", $vqrange], _
		[-13602, 15173, " ", $vqrange], _
		[-20313, 16562, " ", $vqrange], _
		[-21886, 14950, " ", $vqrange], _
		[-21245, 11721, " ", $vqrange], _
		[-20682, 12296, " ", $vqrange], _
		[-16812, 16161, " ", $vqrange], _
		[-13525, 15069, " ", $vqrange], _
		[-16080, 10761, " ", $vqrange], _
		[-18914, 7335, " ", $vqrange], _
		[-19997, 7302, " ", $vqrange], _
		[-21063, 3513, " ", $vqrange], _
		[-22336, 4252, " ", $vqrange], _
		[-20839, 3729, " ", $vqrange], _
		[-18898, 2466, " ", $vqrange], _
		[-16153, 654, " ", $vqrange], _
		[-12720, 4335, " ", $vqrange], _
		[-13758, 7489, " ", $vqrange], _
		[-12274, 5305, " ", $vqrange], _
		[-12363, 3461, " ", $vqrange], _
		[-15763, -1988, " ", $vqrange], _
		[-18666, -3264, " ", $vqrange], _
		[-20567, -3453, " ", $vqrange], _
		[-19722, -1027, " ", $vqrange], _
		[-22281, -5793, " ", $vqrange], _
		[-21448, -9832, " ", $vqrange], _
		[-19936, -10200, " ", $vqrange], _
		[-19820, -11411, " ", $vqrange], _
		[-17508, -15248, " ", $vqrange], _
		[-16532, -14518, " ", $vqrange], _
		[-14360, -14772, " ", $vqrange], _
		[-12736, -14741, " ", $vqrange], _
		[-12531, -12445, " ", $vqrange], _
		[-16314, -10867, " ", $vqrange], _
		[-9545, -14700, " ", $vqrange], _
		[-4886, -12720, " ", $vqrange], _
		[-5206, -10898, " ", $vqrange], _
		[-7180, -8250, " ", $vqrange], _
		[-5503, -6812, " ", $vqrange], _
		[-5590, -4399, " ", $vqrange], _
		[-4169, -4871, " ", $vqrange], _
		[-3924, -5935, " ", $vqrange], _
		[-3308, -6376, " ", $vqrange], _
		[-4066, -7386, " ", $vqrange], _
		[-3081, -9185, " ", $vqrange], _
		[-1008, -8668, " ", $vqrange], _
		[659, -5564, " ", $vqrange], _
		[-956, -8542, " ", $vqrange], _
		[1161, -8850, " ", $vqrange], _
		[2898, -5411, " ", $vqrange], _
		[3621, -5141, " ", $vqrange], _
		[4321, -7340, " ", $vqrange], _
		[7508, -2677, " ", $vqrange], _
		[5518, -2116, " ", $vqrange], _
		[6764, 870, " ", $vqrange], _
		[1531, -951, " ", $vqrange], _
		[72, -558, " ", $vqrange], _
		[1547, -936, " ", $vqrange], _
		[7230, 1269, " ", $vqrange], _
		[9551, 5684, " ", $vqrange], _
		[6866, 8226, " ", $vqrange], _
		[9837, 6010, " ", $vqrange], _
		[12454, 8260, " ", $vqrange], _
		[17549, 6767, " ", $vqrange], _
		[19132, 5910, " ", $vqrange], _
		[18294, -252, " ", $vqrange], _
		[15299, 2117, " ", $vqrange], _
		[12120, 2486, " ", $vqrange], _
		[8964, -4, " ", $vqrange], _
		[12357, 173, " ", $vqrange], _
		[14713, -1409, " ", $vqrange], _
		[16628, -2891, " ", $vqrange], _
		[15692, -5089, " ", $vqrange], _
		[15502, -7727, " ", $vqrange], _
		[12589, -8892, " ", $vqrange], _
		[9976, -12910, " ", $vqrange], _
		[8185, -12536, " ", $vqrange], _
		[6267, -9468, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

