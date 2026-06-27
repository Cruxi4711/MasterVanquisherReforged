#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQMagusStones()
	If GetMapID() <> $MagusStones_Map And GetMapID() <> $MagusStones_Outpost Then TravelTo($MagusStones_Outpost)
	If GetMapID() = $MagusStones_Outpost Then
		GoOut()
	EndIf

	If GetMapID() = $MagusStones_Map Then

		Local $aWaypoints[87][4] = [ [18824.87, 6179.76, " ", $vqrange] _
		, [18447, 4537, " ", $vqrange] _
		, [18331, 2108, " ", $vqrange] _
		, [17526, 143, " ", $vqrange] _
		, [17205, -1355, " ", $vqrange] _
		, [17366, -5132, " ", $vqrange] _
		, [18111, -8030, " ", $vqrange] _
		, [18409, -8474, " ", $vqrange] _
		, [18613, -11799, " ", $vqrange] _
		, [17154, -15669, " ", $vqrange] _
		, [14250, -16744, " ", $vqrange] _
		, [12186, -14139, " ", $vqrange] _
		, [12540, -13440, " ", $vqrange] _
		, [13234, -9948, " ", $vqrange] _
		, [8875, -9065, " ", $vqrange] _
		, [4671, -8699, " ", $vqrange] _
		, [1534, -5493, " ", $vqrange] _
		, [1052, -7074, " ", $vqrange] _
		, [-1029, -8724, " ", $vqrange] _
		, [-3439, -10339, " ", $vqrange] _
		, [-3024, -12586, " ", $vqrange] _
		, [-2797, -13645, " ", $vqrange] _
		, [-3393, -15633, " ", $vqrange] _
		, [-4635, -16643, " ", $vqrange] _
		, [-7814, -17796, " ", $vqrange] _
		, [-10109, -17520, " ", $vqrange] _
		, [-9111, -17237, " ", $vqrange] _
		, [-10963, -15506, " ", $vqrange] _
		, [-12885, -14651, " ", $vqrange] _
		, [-13975, -17857, " ", $vqrange] _
		, [-11912, -10641, " ", $vqrange] _
		, [-8760, -9933, " ", $vqrange] _
		, [-14030, -9780, " ", $vqrange] _
		, [-12368, -7330, " ", $vqrange] _
		, [-16527, -8175, " ", $vqrange] _
		, [-17391, -5984, " ", $vqrange] _
		, [-15704, -3996, " ", $vqrange] _
		, [-16609, -2607, " ", $vqrange] _
		, [-15476, 186, " ", $vqrange] _
		, [-16480, 2522, " ", $vqrange] _
		, [-17090, 5252, " ", $vqrange] _
		, [-18640, 8724, " ", $vqrange] _
		, [-18484, 12021, " ", $vqrange] _
		, [-17180, 13093, " ", $vqrange] _
		, [-15072, 14075, " ", $vqrange] _
		, [-11888, 15628, " ", $vqrange] _
		, [-12043, 18463, " ", $vqrange] _
		, [-8876, 17415, " ", $vqrange] _
		, [-5778, 19838, " ", $vqrange] _
		, [-10970, 16860, " ", $vqrange] _
		, [-9301, 15054, " ", $vqrange] _
		, [-5379, 16642, " ", $vqrange] _
		, [-4430, 17268, " ", $vqrange] _
		, [-2974, 14197, " ", $vqrange] _
		, [-5228, 12475, " ", $vqrange] _
		, [-3468, 10837, " ", $vqrange] _
		, [-3804, 8017, " ", $vqrange] _
		, [-1346, 12360, " ", $vqrange] _
		, [874, 14367, " ", $vqrange] _
		, [3572, 13698, " ", $vqrange] _
		, [5899, 14205, " ", $vqrange] _
		, [7407, 11867, " ", $vqrange] _
		, [9541, 9027, " ", $vqrange] _
		, [12639, 7537, " ", $vqrange] _
		, [9064, 7312, " ", $vqrange] _
		, [7986, 4365, " ", $vqrange] _
		, [6341, 3029, " ", $vqrange] _
		, [7097, 92, " ", $vqrange] _
		, [8943, -985, " ", $vqrange] _
		, [10949, -2056, " ", $vqrange] _
		, [13780, -5667, " ", $vqrange] _
		, [10752, 991, " ", $vqrange] _
		, [8193, -841, " ", $vqrange] _
		, [3284, -1599, " ", $vqrange] _
		, [-76, -1498, " ", $vqrange] _
		, [578, 719, " ", $vqrange] _
		, [316, 2489, " ", $vqrange] _
		, [-1018, -1235, " ", $vqrange] _
		, [-3195, -1538, " ", $vqrange] _
		, [-6322, -2565, " ", $vqrange] _
		, [-11414, 4055, " ", $vqrange] _
		, [-6907, 8461, " ", $vqrange] _
		, [-8689, 11227, " ", $vqrange] _
		, [4671, -8699, " ", $vqrange] _
		, [-1018, -1235, " ", $vqrange] _
		, [-6322, -2565, " ", $vqrange] _
		, [-8760, -9933, " ", $vqrange] ]

		If Not _Vanquisher_ShouldSkipMapEntrySetup() Then
			GoNearestNPCToCoords(14796, 13170)
			Sleep(1000)
			Dialog(0x83)
			Sleep(1000)
			Dialog(0x84)
			Sleep(1000)
			MoveTo(16722, 11774)
			MoveTo(17383, 8685)
		EndIf

		MoveandAggroVQ($aWaypoints)
		MoveandAggroVQReverse($aWaypoints)

	EndIf
EndFunc
