; Updated by Crux
#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQPoisonedOutcrops()
	If GetMapID() <> $PoisonedOutcrops_Map And GetMapID() <> $PoisonedOutcrops_Outpost Then TravelTo($PoisonedOutcrops_Outpost)
	If GetMapID() = $PoisonedOutcrops_Outpost Then
		GoOut()
	EndIf

	If GetMapID() = $PoisonedOutcrops_Map Then

		GoNearestNPCToCoords(14490, -7692)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)

		Local $aWaypoints[107][4] = [ [15882, -9769, " ", $vqrange] _
		, [14490, -7692, "shrine", $vqrange] _
		, [16728, -8811, " ", $vqrange] _
		, [19328, -8721, " ", $vqrange] _
		, [21742, -9680, " ", $vqrange] _
		, [24062, -10695, " ", $vqrange] _
		, [26423, -9728, " ", $vqrange] _
		, [28827, -8949, " ", $vqrange] _
		, [28270, -6464, " ", $vqrange] _
		, [26368, -4804, " ", $vqrange] _
		, [24550, -6586, " ", $vqrange] _
		, [25057, -9080, " ", $vqrange] _
		, [27546, -8486, " ", $vqrange] _
		, [26888, -5971, " ", $vqrange] _
		, [25613, -3787, " ", $vqrange] _
		, [25475, -1256, " ", $vqrange] _
		, [22913, -1461, " ", $vqrange] _
		, [20355, -1270, " ", $vqrange] _
		, [18147, -80, " ", $vqrange] _
		, [15626, 390, " ", $vqrange] _
		, [15037, -2131, " ", $vqrange] _
		, [12871, -3534, " ", $vqrange] _
		, [10731, -4897, " ", $vqrange] _
		, [14068, -7119, " ", $vqrange] _
		, [11539, -6979, " ", $vqrange] _
		, [9093, -6352, " ", $vqrange] _
		, [14042, -7397, " ", $vqrange] _
		, [11268, -6940, " ", $vqrange] _
		, [10356, -6324, " ", $vqrange] _
		, [7922, -7158, " ", $vqrange] _
		, [7136, -5733, " ", $vqrange] _
		, [8599, -3678, " ", $vqrange] _
		, [9598, -1378, " ", $vqrange] _
		, [10604, -650, " ", $vqrange] _
		, [9716, -3032, " ", $vqrange] _
		, [12212, -2664, " ", $vqrange] _
		, [12448, -88, " ", $vqrange] _
		, [13107, 2433, " ", $vqrange] _
		, [14274, 3413, " ", $vqrange] _
		, [11799, 4234, " ", $vqrange] _
		, [10411, 4587, "shrine", $vqrange] _
		, [12094, 6541, " ", $vqrange] _
		, [9834, 5228, " ", $vqrange] _
		, [7323, 4494, " ", $vqrange] _
		, [5090, 3332, " ", $vqrange] _
		, [3061, 1832, " ", $vqrange] _
		, [609, 1202, " ", $vqrange] _
		, [1422, 3688, " ", $vqrange] _
		, [3406, 5374, " ", $vqrange] _
		, [1351, 3879, " ", $vqrange] _
		, [-964, 2891, " ", $vqrange] _
		, [-1172, 358, " ", $vqrange] _
		, [-2341, -1868, " ", $vqrange] _
		, [-4264, -3072, " ", $vqrange] _
		, [-1769, -2361, " ", $vqrange] _
		, [439, -3673, " ", $vqrange] _
		, [2810, -2582, " ", $vqrange] _
		, [239, -2444, " ", $vqrange] _
		, [-806, -71, " ", $vqrange] _
		, [-1904, 2194, " ", $vqrange] _
		, [-4182, 1147, " ", $vqrange] _
		, [-6074, -572, " ", $vqrange] _
		, [-6144, -864, " ", $vqrange] _
		, [-4628, 1231, " ", $vqrange] _
		, [-4315, 3771, " ", $vqrange] _
		, [-5677, 6003, " ", $vqrange] _
		, [-5901, 6589, "shrine", $vqrange] _
		, [-4108, 8451, " ", $vqrange] _
		, [-2629, 10498, " ", $vqrange] _
		, [-79, 10414, " ", $vqrange] _
		, [-241, 12497, " ", $vqrange] _
		, [-2234, 10929, " ", $vqrange] _
		, [-4007, 9046, " ", $vqrange] _
		, [-5565, 6947, " ", $vqrange] _
		, [-7541, 5315, " ", $vqrange] _
		, [-9422, 3662, " ", $vqrange] _
		, [-11275, 1913, " ", $vqrange] _
		, [-13038, 140, " ", $vqrange] _
		, [-13463, -875, " ", $vqrange] _
		, [-15782, -2067, " ", $vqrange] _
		, [-16136, 487, " ", $vqrange] _
		, [-15734, 3027, " ", $vqrange] _
		, [-13682, 4462, " ", $vqrange] _
		, [-11166, 4950, " ", $vqrange] _
		, [-9836, 5945, " ", $vqrange] _
		, [-10336, 8485, " ", $vqrange] _
		, [-8624, 10387, " ", $vqrange] _
		, [-9193, 12893, " ", $vqrange] _
		, [-11768, 13114, " ", $vqrange] _
		, [-14229, 12365, " ", $vqrange] _
		, [-11646, 12344, " ", $vqrange] _
		, [-9839, 10566, " ", $vqrange] _
		, [-12073, 9261, " ", $vqrange] _
		, [-14337, 8175, " ", $vqrange] _
		, [-16695, 7073, " ", $vqrange] _
		, [-15892, 8313, " ", $vqrange] _
		, [-18013, 9717, " ", $vqrange] _
		, [-19760, 10008, "shrine", $vqrange] _
		, [-21539, 8156, " ", $vqrange] _
		, [-22557, 5854, " ", $vqrange] _
		, [-24279, 3898, " ", $vqrange] _
		, [-24677, 2047, " ", $vqrange] _
		, [-25193, 3601, " ", $vqrange] _
		, [-23878, 1411, " ", $vqrange] _
		, [-21842, -230, " ", $vqrange] _
		, [-19471, -1040, " ", $vqrange] _
		, [-21741, -2284, " ", $vqrange] ]
		MoveandAggroVQ($aWaypoints)
		MoveandAggroVQReverse($aWaypoints)

	EndIf
EndFunc