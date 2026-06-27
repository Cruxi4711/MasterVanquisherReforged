; Mapped by Crux
#RequireAdmin
#NoTrayIcon
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func VQNorrhartDomains()
	If GetMapID() <> $NorrhartDomains_Map And GetMapID() <> $NorrhartDomains_Outpost Then
		CurrentAction("Traveling to outpost for Norrhart Domains.")
		TravelTo($NorrhartDomains_Outpost)
	EndIf

	If GetMapID() = $NorrhartDomains_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $NorrhartDomains_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Norrhart Domains (" & $NorrhartDomains_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $NorrhartDomains_Map Then
		CurrentAction("Norrhart Domains route waiting - on map " & GetMapID() & ", need " & $NorrhartDomains_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Norrhart Domains vanquish route.")
	$g_b_Vanquisher_TransitOnly = False
	_Vanquisher_InitCombatAI()
	Local $aWaypoints[180][4] = [ _
		[14570, -6137, " ", $vqrange], _
		[14437, -3899, "shrine", $vqrange], _
		[13954, -3520, " ", $vqrange], _
		[17219, -1093, " ", $vqrange], _
		[19706, -472, " ", $vqrange], _
		[22224, -1141, " ", $vqrange], _
		[24586, -234, " ", $vqrange], _
		[24972, 268, " ", $vqrange], _
		[22394, 516, " ", $vqrange], _
		[24047, 2463, " ", $vqrange], _
		[24666, 4953, " ", $vqrange], _
		[22149, 5254, " ", $vqrange], _
		[23617, 7407, " ", $vqrange], _
		[23961, 7677, "shrine", $vqrange], _
		[24110, 10200, " ", $vqrange], _
		[21638, 11120, " ", $vqrange], _
		[19130, 10718, " ", $vqrange], _
		[19392, 8084, " ", $vqrange], _
		[19443, 5529, " ", $vqrange], _
		[17484, 7196, " ", $vqrange], _
		[15058, 8043, " ", $vqrange], _
		[17537, 7290, " ", $vqrange], _
		[19466, 8931, " ", $vqrange], _
		[19787, 11436, " ", $vqrange], _
		[21867, 12895, " ", $vqrange], _
		[23354, 15017, " ", $vqrange], _
		[25582, 15617, " ", $vqrange], _
		[23236, 14613, " ", $vqrange], _
		[20694, 15217, " ", $vqrange], _
		[18243, 15935, " ", $vqrange], _
		[15856, 14859, "shrine", $vqrange], _
		[13672, 13530, " ", $vqrange], _
		[11216, 14476, " ", $vqrange], _
		[9346, 16222, " ", $vqrange], _
		[7064, 15188, " ", $vqrange], _
		[5922, 12952, " ", $vqrange], _
		[7263, 10799, " ", $vqrange], _
		[9695, 11631, " ", $vqrange], _
		[7195, 11728, " ", $vqrange], _
		[4784, 10856, " ", $vqrange], _
		[2585, 9373, " ", $vqrange], _
		[1653, 11716, " ", $vqrange], _
		[3612, 13386, " ", $vqrange], _
		[4974, 15576, " ", $vqrange], _
		[5444, 16395, " ", $vqrange], _
		[3196, 15202, " ", $vqrange], _
		[844, 14297, " ", $vqrange], _
		[-1084, 12529, " ", $vqrange], _
		[-3160, 11627, "shrine", $vqrange], _
		[-4248, 9289, " ", $vqrange], _
		[-4646, 11824, " ", $vqrange], _
		[-5101, 14293, " ", $vqrange], _
		[-3776, 15872, " ", $vqrange], _
		[-6008, 14515, " ", $vqrange], _
		[-8040, 13058, " ", $vqrange], _
		[-2767, 11800, " ", $vqrange], _
		[-4887, 13183, " ", $vqrange], _
		[-7401, 13113, " ", $vqrange], _
		[-9869, 12519, " ", $vqrange], _
		[-12397, 12455, " ", $vqrange], _
		[-14568, 13737, " ", $vqrange], _
		[-16998, 14610, " ", $vqrange], _
		[-19547, 14978, " ", $vqrange], _
		[-21770, 13770, " ", $vqrange], _
		[-19719, 12139, " ", $vqrange], _
		[-17253, 11495, " ", $vqrange], _
		[-14883, 10597, " ", $vqrange], _
		[-14660, 8083, " ", $vqrange], _
		[-16902, 6768, " ", $vqrange], _
		[-14990, 5037, " ", $vqrange], _
		[-12506, 5525, " ", $vqrange], _
		[-10018, 6023, " ", $vqrange], _
		[-7650, 6906, " ", $vqrange], _
		[-6952, 9379, " ", $vqrange], _
		[-6166, 11864, " ", $vqrange], _
		[-4307, 9998, " ", $vqrange], _
		[-3200, 7750, " ", $vqrange], _
		[-2229, 5400, " ", $vqrange], _
		[-675, 3290, " ", $vqrange], _
		[1174, 1476, " ", $vqrange], _
		[3736, 931, " ", $vqrange], _
		[5597, 815, "shrine", $vqrange], _
		[7174, 2823, " ", $vqrange], _
		[9753, 3338, " ", $vqrange], _
		[12358, 3245, " ", $vqrange], _
		[15191, 4693, " ", $vqrange], _
		[15245, 1138, " ", $vqrange], _
		[13741, 2630, " ", $vqrange], _
		[12787, 294, " ", $vqrange], _
		[12688, -2278, " ", $vqrange], _
		[10692, -3875, " ", $vqrange], _
		[10279, -6440, " ", $vqrange], _
		[11139, -8820, " ", $vqrange], _
		[12453, -11043, " ", $vqrange], _
		[11036, -13256, " ", $vqrange], _
		[10008, -12925, "shrine", $vqrange], _
		[7761, -11768, " ", $vqrange], _
		[7714, -12993, " ", $vqrange], _
		[5939, -11218, " ", $vqrange], _
		[4973, -8873, " ", $vqrange], _
		[3706, -6561, " ", $vqrange], _
		[1357, -5393, " ", $vqrange], _
		[229, -6143, " ", $vqrange], _
		[-291, -3685, " ", $vqrange], _
		[-703, -1100, " ", $vqrange], _
		[-2034, 1066, " ", $vqrange], _
		[-494, -973, " ", $vqrange], _
		[1998, -1438, " ", $vqrange], _
		[-265, -2696, " ", $vqrange], _
		[-2284, -4365, " ", $vqrange], _
		[-2830, -6834, " ", $vqrange], _
		[-2245, -9363, " ", $vqrange], _
		[-3201, -11768, " ", $vqrange], _
		[-5773, -12236, " ", $vqrange], _
		[-3217, -12620, " ", $vqrange], _
		[-621, -12787, " ", $vqrange], _
		[-3176, -12737, " ", $vqrange], _
		[-5640, -12257, " ", $vqrange], _
		[-7598, -10607, " ", $vqrange], _
		[-10019, -11448, " ", $vqrange], _
		[-12207, -10168, " ", $vqrange], _
		[-11892, -7684, " ", $vqrange], _
		[-13469, -5673, " ", $vqrange], _
		[-15887, -4938, " ", $vqrange], _
		[-18378, -5303, " ", $vqrange], _
		[-16259, -3854, " ", $vqrange], _
		[-14265, -2330, " ", $vqrange], _
		[-11770, -1809, " ", $vqrange], _
		[-9314, -1264, " ", $vqrange], _
		[-7467, -854, "shrine", $vqrange], _
		[-6436, 1501, " ", $vqrange], _
		[-4624, 3403, " ", $vqrange], _
		[-7072, 2462, " ", $vqrange], _
		[-9212, 1059, " ", $vqrange], _
		[-11677, 1815, " ", $vqrange], _
		[-9249, 2677, " ", $vqrange], _
		[-6990, 3948, " ", $vqrange], _
		[-7112, 6449, " ", $vqrange], _
		[-9675, 6090, " ", $vqrange], _
		[-12240, 5706, " ", $vqrange], _
		[-14639, 4838, " ", $vqrange], _
		[-16156, 2820, " ", $vqrange], _
		[-17569, 719, " ", $vqrange], _
		[-20095, 452, " ", $vqrange], _
		[-21251, -1912, " ", $vqrange], _
		[-22966, -3783, " ", $vqrange], _
		[-24336, -5888, " ", $vqrange], _
		[-21991, -4964, " ", $vqrange], _
		[-19472, -4455, " ", $vqrange], _
		[-18091, -2221, " ", $vqrange], _
		[-16029, -3699, " ", $vqrange], _
		[-18095, -5168, " ", $vqrange], _
		[-20504, -6045, " ", $vqrange], _
		[-19073, -8116, " ", $vqrange], _
		[-16958, -9456, " ", $vqrange], _
		[-14465, -8806, " ", $vqrange], _
		[-17003, -9446, " ", $vqrange], _
		[-15648, -11585, " ", $vqrange], _
		[-18199, -12029, " ", $vqrange], _
		[-19092, -9642, " ", $vqrange], _
		[-21695, -9411, " ", $vqrange], _
		[-23985, -10610, " ", $vqrange], _
		[-22702, -10886, "shrine", $vqrange], _
		[-21128, -12981, " ", $vqrange], _
		[-20352, -10551, " ", $vqrange], _
		[-19856, -7993, " ", $vqrange], _
		[-20096, -5460, " ", $vqrange], _
		[-20434, -2918, " ", $vqrange], _
		[-21197, -427, " ", $vqrange], _
		[-21767, 2034, " ", $vqrange], _
		[-23141, 4238, " ", $vqrange], _
		[-23800, 6761, " ", $vqrange], _
		[-24500, 9162, " ", $vqrange], _
		[-24538, 10755, "shrine", $vqrange], _
		[-21935, 10323, " ", $vqrange], _
		[-19431, 10284, " ", $vqrange], _
		[-17339, 8798, " ", $vqrange], _
		[-19490, 7303, " ", $vqrange], _
		[-22050, 7617, " ", $vqrange], _
		[-23669, 9593, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
