; Updated by Crux
#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQTheShatteredRavines()
	If GetMapID() <> $TheShatteredRavines_Map And GetMapID() <> $TheShatteredRavines_Outpost Then TravelTo($TheShatteredRavines_Outpost)
	If GetMapID() = $TheShatteredRavines_Outpost Then
		GoOut()
	EndIf

	If GetMapID() = $TheShatteredRavines_Map Then

		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Shattered Ravines not ready yet - waiting for map load.")
			Return
		EndIf

		GoNearestNPCToCoords(909, 8064)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)

		Local $aWaypoints[158][4] = [ [416, 9518, " ", $vqrange] _
		, [909, 8064, "shrine", $vqrange] _
		, [-945, 6334, " ", $vqrange] _
		, [-3425, 5771, " ", $vqrange] _
		, [-5910, 5331, " ", $vqrange] _
		, [-8154, 6474, " ", $vqrange] _
		, [-5699, 5659, " ", $vqrange] _
		, [-3208, 4860, " ", $vqrange] _
		, [-2395, 4504, "junundu", $vqrange] _
		, [-3001, 6998, " ", $vqrange] _
		, [-3059, 9617, " ", $vqrange] _
		, [-5078, 11136, " ", $vqrange] _
		, [-7347, 9900, " ", $vqrange] _
		, [-9299, 8182, " ", $vqrange] _
		, [-11837, 8799, " ", $vqrange] _
		, [-14399, 8622, " ", $vqrange] _
		, [-16913, 7944, "shrine", $vqrange] _
		, [-19417, 7701, " ", $vqrange] _
		, [-21189, 9480, " ", $vqrange] _
		, [-23752, 9250, " ", $vqrange] _
		, [-25443, 7344, " ", $vqrange] _
		, [-25774, 4841, " ", $vqrange] _
		, [-25326, 2273, " ", $vqrange] _
		, [-26045, -122, " ", $vqrange] _
		, [-26239, -1915, " ", $vqrange] _
		, [-24740, -1474, " ", $vqrange] _
		, [-23218, -3470, " ", $vqrange] _
		, [-20844, -4470, " ", $vqrange] _
		, [-18395, -3723, " ", $vqrange] _
		, [-16161, -2783, "shrine", $vqrange] _
		, [-17920, -995, " ", $vqrange] _
		, [-15631, 221, " ", $vqrange] _
		, [-13455, 1569, " ", $vqrange] _
		, [-11177, 2787, " ", $vqrange] _
		, [-8659, 2590, " ", $vqrange] _
		, [-9830, 318, " ", $vqrange] _
		, [-10818, -2001, " ", $vqrange] _
		, [-13403, -1741, " ", $vqrange] _
		, [-15951, -2180, " ", $vqrange] _
		, [-18064, -3712, " ", $vqrange] _
		, [-20238, -5146, " ", $vqrange] _
		, [-21090, -7618, " ", $vqrange] _
		, [-23175, -11918, " ", $vqrange] _
		, [-23776, -9483, " ", $vqrange] _
		, [-25404, -9091, "shrine", $vqrange] _
		, [-26352, -7022, " ", $vqrange] _
		, [-24096, -8256, " ", $vqrange] _
		, [-21829, -9532, " ", $vqrange] _
		, [-19489, -10632, " ", $vqrange] _
		, [-17468, -10676, "junundu", $vqrange] _
		, [-15186, -9619, " ", $vqrange] _
		, [-12735, -10215, " ", $vqrange] _
		, [-13473, -8742, " ", $vqrange] _
		, [-15922, -7854, " ", $vqrange] _
		, [-15424, -5321, " ", $vqrange] _
		, [-13698, -7254, " ", $vqrange] _
		, [-15942, -6063, " ", $vqrange] _
		, [-18235, -7077, " ", $vqrange] _
		, [-20780, -6988, " ", $vqrange] _
		, [-23157, -6105, " ", $vqrange] _
		, [-24804, -4123, " ", $vqrange] _
		, [-23279, -2046, " ", $vqrange] _
		, [-21604, -182, " ", $vqrange] _
		, [-20528, 2171, " ", $vqrange] _
		, [-20791, 4697, " ", $vqrange] _
		, [-20511, 2111, " ", $vqrange] _
		, [-18001, 2559, " ", $vqrange] _
		, [-15657, 3674, " ", $vqrange] _
		, [-13332, 4870, " ", $vqrange] _
		, [-10911, 5807, " ", $vqrange] _
		, [-8691, 4436, " ", $vqrange] _
		, [-6510, 3009, " ", $vqrange] _
		, [-4333, 1721, " ", $vqrange] _
		, [-2122, 389, " ", $vqrange] _
		, [-1377, -2124, " ", $vqrange] _
		, [-3148, -4033, " ", $vqrange] _
		, [-4963, -5775, " ", $vqrange] _
		, [-6037, -3483, " ", $vqrange] _
		, [-8144, -1961, " ", $vqrange] _
		, [-10424, -927, " ", $vqrange] _
		, [-11738, -3056, " ", $vqrange] _
		, [-11288, -5630, " ", $vqrange] _
		, [-10600, -8120, " ", $vqrange] _
		, [-8984, -10035, " ", $vqrange] _
		, [-8410, -10735, "shrine", $vqrange] _
		, [-6534, -9050, " ", $vqrange] _
		, [-3985, -8974, " ", $vqrange] _
		, [-3032, -9580, " ", $vqrange] _
		, [-3715, -8853, "junundu", $vqrange] _
		, [-2573, -6604, " ", $vqrange] _
		, [-146, -5948, " ", $vqrange] _
		, [-2732, -5970, " ", $vqrange] _
		, [-5275, -6096, " ", $vqrange] _
		, [-3479, -4281, " ", $vqrange] _
		, [-1652, -2413, " ", $vqrange] _
		, [-1989, 146, " ", $vqrange] _
		, [-925, 2431, " ", $vqrange] _
		, [1563, 3247, " ", $vqrange] _
		, [4121, 3334, " ", $vqrange] _
		, [6565, 3977, " ", $vqrange] _
		, [9045, 3577, " ", $vqrange] _
		, [11489, 2925, " ", $vqrange] _
		, [13215, 4767, " ", $vqrange] _
		, [15261, 6385, " ", $vqrange] _
		, [17621, 7439, " ", $vqrange] _
		, [20115, 7954, " ", $vqrange] _
		, [22555, 8665, " ", $vqrange] _
		, [24653, 10339, " ", $vqrange] _
		, [25263, 10152, " ", $vqrange] _
		, [23164, 8740, " ", $vqrange] _
		, [20754, 8038, " ", $vqrange] _
		, [18190, 7544, " ", $vqrange] _
		, [17215, 6447, " ", $vqrange] _
		, [14647, 6073, " ", $vqrange] _
		, [12877, 4306, " ", $vqrange] _
		, [12039, 1942, " ", $vqrange] _
		, [12679, -565, " ", $vqrange] _
		, [10163, -663, " ", $vqrange] _
		, [12066, 1070, " ", $vqrange] _
		, [14326, 2242, " ", $vqrange] _
		, [11781, 1935, " ", $vqrange] _
		, [9229, 1961, " ", $vqrange] _
		, [7052, 702, " ", $vqrange] _
		, [4915, -869, " ", $vqrange] _
		, [2346, -1204, " ", $vqrange] _
		, [4847, -1786, " ", $vqrange] _
		, [7385, -2273, " ", $vqrange] _
		, [9991, -2267, " ", $vqrange] _
		, [12485, -2896, " ", $vqrange] _
		, [14544, -1359, " ", $vqrange] _
		, [15182, 1165, " ", $vqrange] _
		, [16615, 3264, " ", $vqrange] _
		, [19064, 2407, " ", $vqrange] _
		, [20867, 635, " ", $vqrange] _
		, [22209, -1602, " ", $vqrange] _
		, [23319, -3889, " ", $vqrange] _
		, [23231, -4280, "shrine", $vqrange] _
		, [23182, -6809, " ", $vqrange] _
		, [22424, -8064, " ", $vqrange] _
		, [20257, -6759, " ", $vqrange] _
		, [19400, -8985, " ", $vqrange] _
		, [17913, -9842, " ", $vqrange] _
		, [15510, -8902, " ", $vqrange] _
		, [13009, -8747, " ", $vqrange] _
		, [11354, -8319, " ", $vqrange] _
		, [13310, -6704, " ", $vqrange] _
		, [11166, -5383, " ", $vqrange] _
		, [8646, -4999, " ", $vqrange] _
		, [7722, -3974, "shrine", $vqrange] _
		, [5248, -3305, " ", $vqrange] _
		, [3141, -4680, " ", $vqrange] _
		, [3973, -7108, " ", $vqrange] _
		, [1447, -7041, " ", $vqrange] _
		, [-994, -6337, " ", $vqrange] _
		, [-3535, -6908, " ", $vqrange] _
		, [-5581, -8352, " ", $vqrange] _
		, [-7699, -9727, " ", $vqrange] _
		, [-10168, -10493, " ", $vqrange] ]
		MoveandAggroVQ($aWaypoints)
		MoveandAggroVQReverse($aWaypoints)

	EndIf
EndFunc