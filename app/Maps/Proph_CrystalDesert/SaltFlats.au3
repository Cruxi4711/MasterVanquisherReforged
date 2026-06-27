#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aSaltFlatsOutpostPath[2][2] = [ _
	[-17139.62, 8813.30], _
	[-16591.81, 8238.59] _
]

Func GoOutSaltFlats()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $SaltFlats_Map Then Return

	If $l_i_Map = $SaltFlats_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> SaltFlats (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSaltFlatsOutpostPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQSaltFlats()
	If GetMapID() <> $SaltFlats_Map And GetMapID() <> $SaltFlats_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SaltFlats.")
		TravelTo($SaltFlats_Outpost)
	EndIf

	If GetMapID() = $SaltFlats_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutSaltFlats()
		If GetMapID() <> $SaltFlats_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SaltFlats (" & $SaltFlats_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $SaltFlats_Map Then
		CurrentAction("SaltFlats route waiting - on map " & GetMapID() & ", need " & $SaltFlats_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SaltFlats vanquish route.")

	Local $aWaypoints[150][4] = [ _
		[-15982, 7161, " ", $vqrange], _
		[-14516, 4982, " ", $vqrange], _
		[-12968, 2903, " ", $vqrange], _
		[-11021, 1212, " ", $vqrange], _
		[-9821, -1023, " ", $vqrange], _
		[-9411, -3517, " ", $vqrange], _
		[-9330, -6123, " ", $vqrange], _
		[-10607, -8316, " ", $vqrange], _
		[-12100, -6153, " ", $vqrange], _
		[-12786, -3688, " ", $vqrange], _
		[-14193, -5906, " ", $vqrange], _
		[-12966, -8236, " ", $vqrange], _
		[-15259, -9270, " ", $vqrange], _
		[-17747, -9954, " ", $vqrange], _
		[-19316, -7931, " ", $vqrange], _
		[-18624, -5408, " ", $vqrange], _
		[-16640, -3813, " ", $vqrange], _
		[-16761, -6356, " ", $vqrange], _
		[-15197, -8359, " ", $vqrange], _
		[-12616, -8877, " ", $vqrange], _
		[-10142, -9508, " ", $vqrange], _
		[-8801, -7313, " ", $vqrange], _
		[-6546, -7555, " ", $vqrange], _
		[-5339, -9765, " ", $vqrange], _
		[-4653, -12186, " ", $vqrange], _
		[-5949, -14385, " ", $vqrange], _
		[-6912, -16759, " ", $vqrange], _
		[-6636, -19331, " ", $vqrange], _
		[-5656, -16996, " ", $vqrange], _
		[-5065, -14511, " ", $vqrange], _
		[-2654, -13703, " ", $vqrange], _
		[-269, -12804, " ", $vqrange], _
		[2277, -13198, " ", $vqrange], _
		[4718, -12453, " ", $vqrange], _
		[7259, -12646, " ", $vqrange], _
		[9676, -11857, " ", $vqrange], _
		[11826, -13179, " ", $vqrange], _
		[12916, -15436, " ", $vqrange], _
		[12441, -17918, " ", $vqrange], _
		[14946, -17992, " ", $vqrange], _
		[17430, -17482, " ", $vqrange], _
		[19427, -18990, " ", $vqrange], _
		[17568, -17210, " ", $vqrange], _
		[15287, -16095, " ", $vqrange], _
		[13279, -14495, " ", $vqrange], _
		[11335, -12804, " ", $vqrange], _
		[8900, -12050, " ", $vqrange], _
		[6409, -12334, " ", $vqrange], _
		[3903, -12629, " ", $vqrange], _
		[1430, -13302, " ", $vqrange], _
		[-1181, -13182, " ", $vqrange], _
		[-3658, -13780, " ", $vqrange], _
		[-4536, -11311, " ", $vqrange], _
		[-5815, -9096, " ", $vqrange], _
		[-6278, -6532, " ", $vqrange], _
		[-5674, -4029, " ", $vqrange], _
		[-3158, -3766, " ", $vqrange], _
		[-736, -3020, " ", $vqrange], _
		[-3152, -3742, " ", $vqrange], _
		[-3818, -1208, " ", $vqrange], _
		[-3784, 1335, " ", $vqrange], _
		[-2704, 3679, " ", $vqrange], _
		[-4137, 4162, " ", $vqrange], _
		[-3606, 1631, " ", $vqrange], _
		[-3742, -925, " ", $vqrange], _
		[-4901, -3186, " ", $vqrange], _
		[-6124, -5456, " ", $vqrange], _
		[-7946, -7243, " ", $vqrange], _
		[-9101, -4928, " ", $vqrange], _
		[-9629, -2402, " ", $vqrange], _
		[-10367, 9, " ", $vqrange], _
		[-12747, 809, " ", $vqrange], _
		[-15224, 1422, " ", $vqrange], _
		[-17169, 3195, " ", $vqrange], _
		[-18783, 5257, " ", $vqrange], _
		[-20362, 3545, " ", $vqrange], _
		[-19355, 1205, " ", $vqrange], _
		[-20158, 3643, " ", $vqrange], _
		[-18221, 5369, " ", $vqrange], _
		[-15717, 5621, " ", $vqrange], _
		[-13388, 6634, " ", $vqrange], _
		[-12708, 9135, " ", $vqrange], _
		[-14384, 11069, " ", $vqrange], _
		[-16198, 12971, " ", $vqrange], _
		[-16606, 15485, " ", $vqrange], _
		[-15405, 17736, " ", $vqrange], _
		[-12966, 18620, " ", $vqrange], _
		[-11649, 16441, " ", $vqrange], _
		[-12067, 13905, " ", $vqrange], _
		[-10199, 15682, " ", $vqrange], _
		[-11988, 17477, " ", $vqrange], _
		[-10383, 19508, " ", $vqrange], _
		[-7851, 18998, " ", $vqrange], _
		[-6418, 16872, " ", $vqrange], _
		[-4985, 14668, " ", $vqrange], _
		[-3398, 12650, " ", $vqrange], _
		[-1309, 11149, " ", $vqrange], _
		[728, 9564, " ", $vqrange], _
		[-1195, 7854, " ", $vqrange], _
		[1044, 9135, " ", $vqrange], _
		[1078, 11653, " ", $vqrange], _
		[663, 14219, " ", $vqrange], _
		[749, 16859, " ", $vqrange], _
		[496, 18587, " ", $vqrange], _
		[2492, 17079, " ", $vqrange], _
		[2326, 14571, " ", $vqrange], _
		[2228, 12046, " ", $vqrange], _
		[4701, 11562, " ", $vqrange], _
		[4820, 9054, " ", $vqrange], _
		[6889, 10659, " ", $vqrange], _
		[7512, 8225, " ", $vqrange], _
		[9246, 6795, " ", $vqrange], _
		[9929, 9298, " ", $vqrange], _
		[12401, 8725, " ", $vqrange], _
		[14683, 7595, " ", $vqrange], _
		[17177, 8240, " ", $vqrange], _
		[19534, 7264, " ", $vqrange], _
		[21563, 8748, " ", $vqrange], _
		[19341, 10122, " ", $vqrange], _
		[18126, 12427, " ", $vqrange], _
		[18359, 14935, " ", $vqrange], _
		[18986, 17418, " ", $vqrange], _
		[18836, 19980, " ", $vqrange], _
		[16288, 19730, " ", $vqrange], _
		[14024, 18583, " ", $vqrange], _
		[11418, 18601, " ", $vqrange], _
		[8902, 18957, " ", $vqrange], _
		[6367, 19107, " ", $vqrange], _
		[4284, 17659, " ", $vqrange], _
		[3844, 15119, " ", $vqrange], _
		[6395, 14764, " ", $vqrange], _
		[8684, 15918, " ", $vqrange], _
		[8002, 18401, " ", $vqrange], _
		[5411, 18081, " ", $vqrange], _
		[3182, 16718, " ", $vqrange], _
		[1883, 14430, " ", $vqrange], _
		[1284, 11893, " ", $vqrange], _
		[776, 9429, " ", $vqrange], _
		[-1296, 7864, " ", $vqrange], _
		[1035, 8994, " ", $vqrange], _
		[-897, 10800, " ", $vqrange], _
		[-2856, 12471, " ", $vqrange], _
		[-4851, 14189, " ", $vqrange], _
		[-6750, 15873, " ", $vqrange], _
		[-8643, 14057, " ", $vqrange], _
		[-10285, 12045, " ", $vqrange], _
		[-11519, 9781, " ", $vqrange], _
		[-12642, 7427, " ", $vqrange], _
		[-14642, 5771, " ", $vqrange], _
		[-17196, 6010, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

