; Updated by Crux
#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

; The Mouth of Torment (440) has multiple exit portals; auto-zone picks the wrong one.
; Approach tile sits in FRONT of the correct portal, so we overshoot through it until the zone loads.
Local Const $RUPTUREDHEART_PORTAL_APPROACH_X = 1619.90
Local Const $RUPTUREDHEART_PORTAL_APPROACH_Y = -1924.10

Func GoOutTheRupturedHeart()
	Local $l_i_MapBefore = GetMapID()
	If $l_i_MapBefore <> $TheRupturedHeart_Outpost Then Return

	$g_b_Vanquisher_TransitOnly = True
	CurrentAction("The Mouth of Torment -> The Ruptured Heart (portal).")

	; Overshoot direction = spawn -> approach, extended past the approach tile through the portal.
	Local $l_f_StartX = Agent_GetAgentInfo(-2, "X")
	Local $l_f_StartY = Agent_GetAgentInfo(-2, "Y")
	Local $l_f_DX = $RUPTUREDHEART_PORTAL_APPROACH_X - $l_f_StartX
	Local $l_f_DY = $RUPTUREDHEART_PORTAL_APPROACH_Y - $l_f_StartY
	Local $l_f_Len = Sqrt($l_f_DX * $l_f_DX + $l_f_DY * $l_f_DY)
	If $l_f_Len < 1 Then $l_f_Len = 1
	Local $l_f_OverX = $RUPTUREDHEART_PORTAL_APPROACH_X + ($l_f_DX / $l_f_Len) * 750
	Local $l_f_OverY = $RUPTUREDHEART_PORTAL_APPROACH_Y + ($l_f_DY / $l_f_Len) * 750

	AggroMoveTo($RUPTUREDHEART_PORTAL_APPROACH_X, $RUPTUREDHEART_PORTAL_APPROACH_Y, "torment portal")

	Local $l_h_Timer = TimerInit()
	While GetMapID() = $l_i_MapBefore And Not Map_GetInstanceInfo("IsLoading") And TimerDiff($l_h_Timer) < 20000
		Move($l_f_OverX, $l_f_OverY)
		Sleep(Other_GetPing() + 500)
	WEnd

	WaitForLoad()
	_Vanquisher_WaitForPlayerReadyAfterLoad()
	$g_b_Vanquisher_TransitOnly = False
EndFunc

Func VQTheRupturedHeart()
	If GetMapID() <> $TheRupturedHeart_Map And GetMapID() <> $TheRupturedHeart_Outpost Then TravelTo($TheRupturedHeart_Outpost)
	If GetMapID() = $TheRupturedHeart_Outpost Then
		GoOut()
	EndIf

	If GetMapID() = $TheRupturedHeart_Map Then

		If Not _Vanquisher_WaitForPlayerReadyAfterLoad(12000) Then
			CurrentAction("Ruptured Heart not ready yet - waiting for map load.")
			Return
		EndIf

		Local $aWaypoints[158][4] = [ [2284, -1554, " ", $vqrange] _
		, [444, 225, " ", $vqrange] _
		, [1170, 2723, " ", $vqrange] _
		, [2128, 3336, " ", $vqrange] _
		, [4001, 1559, " ", $vqrange] _
		, [4344, 1261, "shrine", $vqrange] _
		, [5968, -673, " ", $vqrange] _
		, [8264, -3298, " ", $vqrange] _
		, [6598, -5288, " ", $vqrange] _
		, [7605, -7671, " ", $vqrange] _
		, [9527, -9283, " ", $vqrange] _
		, [11588, -7823, " ", $vqrange] _
		, [12718, -5512, " ", $vqrange] _
		, [15173, -4981, " ", $vqrange] _
		, [17222, -6520, " ", $vqrange] _
		, [18244, -6402, " ", $vqrange] _
		, [19335, -4069, " ", $vqrange] _
		, [19584, -2590, "shrine", $vqrange] _
		, [17143, -1955, " ", $vqrange] _
		, [14550, -1998, " ", $vqrange] _
		, [14363, 509, " ", $vqrange] _
		, [16227, 2307, " ", $vqrange] _
		, [18675, 2908, " ", $vqrange] _
		, [19487, 2949, " ", $vqrange] _
		, [17620, 1241, " ", $vqrange] _
		, [15012, 1264, " ", $vqrange] _
		, [12616, 2082, " ", $vqrange] _
		, [12927, 4564, " ", $vqrange] _
		, [15361, 5374, " ", $vqrange] _
		, [17884, 5642, " ", $vqrange] _
		, [19584, 7008, " ", $vqrange] _
		, [17551, 5546, " ", $vqrange] _
		, [15735, 7268, " ", $vqrange] _
		, [17880, 8683, " ", $vqrange] _
		, [19296, 10754, " ", $vqrange] _
		, [18597, 13173, " ", $vqrange] _
		, [20184, 14311, "shrine", $vqrange] _
		, [20137, 16843, " ", $vqrange] _
		, [19703, 18455, " ", $vqrange] _
		, [19946, 15886, " ", $vqrange] _
		, [18036, 14168, " ", $vqrange] _
		, [15767, 12918, " ", $vqrange] _
		, [13581, 11519, " ", $vqrange] _
		, [11614, 9880, " ", $vqrange] _
		, [10310, 7647, " ", $vqrange] _
		, [8166, 9133, " ", $vqrange] _
		, [5812, 10231, " ", $vqrange] _
		, [3769, 11706, " ", $vqrange] _
		, [6257, 11013, " ", $vqrange] _
		, [8625, 10165, " ", $vqrange] _
		, [10993, 9329, " ", $vqrange] _
		, [12030, 9033, "junundu", $vqrange] _
		, [10934, 11382, " ", $vqrange] _
		, [9759, 13653, " ", $vqrange] _
		, [8088, 15641, " ", $vqrange] _
		, [6495, 17584, " ", $vqrange] _
		, [4273, 16317, " ", $vqrange] _
		, [3531, 18718, " ", $vqrange] _
		, [3791, 20688, " ", $vqrange] _
		, [2947, 18274, " ", $vqrange] _
		, [4003, 16005, " ", $vqrange] _
		, [5529, 15825, "junundu", $vqrange] _
		, [4914, 17521, " ", $vqrange] _
		, [7451, 16978, " ", $vqrange] _
		, [7414, 14386, " ", $vqrange] _
		, [5328, 12907, " ", $vqrange] _
		, [2769, 12885, " ", $vqrange] _
		, [538, 14018, " ", $vqrange] _
		, [111, 16536, " ", $vqrange] _
		, [511, 19043, " ", $vqrange] _
		, [-1283, 17197, " ", $vqrange] _
		, [-3146, 18877, " ", $vqrange] _
		, [-5693, 18424, " ", $vqrange] _
		, [-7338, 16456, " ", $vqrange] _
		, [-9070, 14516, " ", $vqrange] _
		, [-10401, 13048, "shrine", $vqrange] _
		, [-7975, 12241, " ", $vqrange] _
		, [-5617, 11381, " ", $vqrange] _
		, [-4763, 13793, " ", $vqrange] _
		, [-2975, 15653, " ", $vqrange] _
		, [-4771, 13759, " ", $vqrange] _
		, [-4993, 11241, " ", $vqrange] _
		, [-3811, 8916, " ", $vqrange] _
		, [-2771, 6642, " ", $vqrange] _
		, [-214, 6829, " ", $vqrange] _
		, [365, 8672, " ", $vqrange] _
		, [-43, 6092, " ", $vqrange] _
		, [1069, 3808, " ", $vqrange] _
		, [-545, 1841, " ", $vqrange] _
		, [-2928, 2636, " ", $vqrange] _
		, [-5476, 2217, " ", $vqrange] _
		, [-7801, 1776, " ", $vqrange] _
		, [-6568, 4074, " ", $vqrange] _
		, [-6353, 6597, " ", $vqrange] _
		, [-6656, 9158, " ", $vqrange] _
		, [-8924, 10327, " ", $vqrange] _
		, [-11477, 9907, " ", $vqrange] _
		, [-13997, 10135, " ", $vqrange] _
		, [-16447, 11028, " ", $vqrange] _
		, [-18966, 10399, " ", $vqrange] _
		, [-19255, 10080, " ", $vqrange] _
		, [-16704, 10107, " ", $vqrange] _
		, [-17285, 7624, " ", $vqrange] _
		, [-19104, 7162, " ", $vqrange] _
		, [-18022, 4859, " ", $vqrange] _
		, [-16903, 4758, " ", $vqrange] _
		, [-16933, 4280, "shrine", $vqrange] _
		, [-14357, 4206, " ", $vqrange] _
		, [-16595, 2975, " ", $vqrange] _
		, [-18177, 1602, " ", $vqrange] _
		, [-16052, 280, " ", $vqrange] _
		, [-13731, -807, " ", $vqrange] _
		, [-13167, -3301, " ", $vqrange] _
		, [-12946, -5808, " ", $vqrange] _
		, [-13432, -8336, " ", $vqrange] _
		, [-13248, -10368, " ", $vqrange] _
		, [-15677, -11166, " ", $vqrange] _
		, [-16610, -13556, " ", $vqrange] _
		, [-16552, -16157, " ", $vqrange] _
		, [-17302, -18643, " ", $vqrange] _
		, [-17411, -16111, " ", $vqrange] _
		, [-17709, -13563, " ", $vqrange] _
		, [-19060, -11393, " ", $vqrange] _
		, [-19092, -8891, " ", $vqrange] _
		, [-20309, -7114, " ", $vqrange] _
		, [-18975, -4882, " ", $vqrange] _
		, [-17393, -2834, " ", $vqrange] _
		, [-16661, -421, " ", $vqrange] _
		, [-14181, -1137, " ", $vqrange] _
		, [-12043, -2609, " ", $vqrange] _
		, [-9503, -2214, " ", $vqrange] _
		, [-7338, -907, " ", $vqrange] _
		, [-5283, -1776, " ", $vqrange] _
		, [-7150, -3465, " ", $vqrange] _
		, [-7100, -6026, " ", $vqrange] _
		, [-6755, -7233, "shrine", $vqrange] _
		, [-4520, -8511, " ", $vqrange] _
		, [-5760, -9830, " ", $vqrange] _
		, [-3273, -10166, " ", $vqrange] _
		, [-3820, -11683, " ", $vqrange] _
		, [-2108, -9816, " ", $vqrange] _
		, [-102, -11175, " ", $vqrange] _
		, [-2410, -12395, " ", $vqrange] _
		, [-1508, -13534, " ", $vqrange] _
		, [-1913, -14284, "shrine", $vqrange] _
		, [-2072, -13321, " ", $vqrange] _
		, [-2894, -12562, " ", $vqrange] _
		, [-413, -11739, " ", $vqrange] _
		, [1985, -10800, " ", $vqrange] _
		, [3772, -9042, " ", $vqrange] _
		, [5031, -11243, " ", $vqrange] _
		, [4120, -8895, " ", $vqrange] _
		, [4188, -6287, " ", $vqrange] _
		, [4855, -3830, " ", $vqrange] _
		, [6127, -1590, " ", $vqrange] _
		, [4847, 593, " ", $vqrange] _
		, [2519, -437, " ", $vqrange] _
		, [2235, -1544, " ", $vqrange] ]
		MoveandAggroVQ($aWaypoints)
		MoveandAggroVQReverse($aWaypoints)

	EndIf
EndFunc
