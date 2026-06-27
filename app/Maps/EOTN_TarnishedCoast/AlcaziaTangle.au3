#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQAlcaziaTangle()
	If GetMapID() <> $AlcaziaTangle_Map And GetMapID() <> $AlcaziaTangle_Outpost Then TravelTo($AlcaziaTangle_Outpost)
	If GetMapID() = $AlcaziaTangle_Outpost Then
		GoOut()
	EndIf

	If GetMapID() = $AlcaziaTangle_Map Then

		Local $aWaypoints[175][4] = [ [17534, -6572, " ", $vqrange] _
		, [17728, -800, " ", $vqrange] _
		, [21021, 781, " ", $vqrange] _
		, [24250.24, 4927.76, " ", $vqrange] _
		, [20844, 4069, " ", $vqrange] _
		, [19604, 3671, " ", $vqrange] _
		, [16794, 2692, " ", $vqrange] _
		, [15476, 2043, " ", $vqrange] _
		, [13780, 2536, " ", $vqrange] _
		, [12535, -187, " ", $vqrange] _
		, [9999, -911, " ", $vqrange] _
		, [8943, -3387, " ", $vqrange] _
		, [11116, -4259, " ", $vqrange] _
		, [11030, -6853, " ", $vqrange] _
		, [14267, -8050.48, " ", $vqrange] _
		, [7880, -9067, " ", $vqrange] _
		, [4842, -8198, " ", $vqrange] _
		, [5087, -10823, " ", $vqrange] _
		, [1871, -11346, " ", $vqrange] _
		, [2954, -8639, " ", $vqrange] _
		, [4691, -5551, " ", $vqrange] _
		, [3067, -4263, " ", $vqrange] _
		, [416, -2900, " ", $vqrange] _
		, [-905, -678, " ", $vqrange] _
		, [-3611, -1012, " ", $vqrange] _
		, [-6210, -3214, " ", $vqrange] _
		, [-8795, -3092, " ", $vqrange] _
		, [-10264, -6300, " ", $vqrange] _
		, [-10944, -8045, " ", $vqrange] _
		, [-12899, -9012, " ", $vqrange] _
		, [-14136, -11140, " ", $vqrange] _
		, [-14919, -8564, " ", $vqrange] _
		, [-15413, -6036, " ", $vqrange] _
		, [-18091, -7445, " ", $vqrange] _
		, [-20605, -10125, " ", $vqrange] _
		, [-23656, -9897, " ", $vqrange] _
		, [-20605, -10125, " ", $vqrange] _
		, [-18209, -7531, " ", $vqrange] _
		, [-19037, -4586, " ", $vqrange] _
		, [-21176, -3967, " ", $vqrange] _
		, [-20906, -1221, " ", $vqrange] _
		, [-21415, 1838, " ", $vqrange] _
		, [-22640, 8022, " ", $vqrange] _
		, [-18789, 9320, " ", $vqrange] _
		, [-16280, 9586, " ", $vqrange] _
		, [-17923, 14072, " ", $vqrange] _
		, [-15178, 12041, " ", $vqrange] _
		, [-13157, 13159, " ", $vqrange] _
		, [-11246, 14125, " ", $vqrange] _
		, [-9094, 10790, " ", $vqrange] _
		, [-7709, 7876, " ", $vqrange] _
		, [-8774, 10809, " ", $vqrange] _
		, [-11041, 14355, " ", $vqrange] _
		, [-7827, 15151, " ", $vqrange] _
		, [-5409, 16084, " ", $vqrange] _
		, [-1787, 13993, " ", $vqrange] _
		, [4956, 13904, " ", $vqrange] _
		, [6843, 12770, " ", $vqrange] _
		, [7080, 10312, " ", $vqrange] _
		, [8357, 12605, " ", $vqrange] _
		, [11096, 13216, " ", $vqrange] _
		, [14539, 13021, " ", $vqrange] _
		, [17009, 13138, " ", $vqrange] _
		, [20710, 14672, " ", $vqrange] _
		, [24582, 15107, " ", $vqrange] _
		, [21454, 15013, " ", $vqrange] _
		, [17216, 13128, " ", $vqrange] _
		, [13561, 11069, " ", $vqrange] _
		, [12107, 7575, " ", $vqrange] _
		, [11251, 5487, " ", $vqrange] _
		, [7976, 6797, " ", $vqrange] _
		, [5348, 8244, " ", $vqrange] _
		, [3065, 5893, " ", $vqrange] _
		, [925, 3165, " ", $vqrange] _
		, [-1726, 5728, " ", $vqrange] _
		, [-3894, 8333, " ", $vqrange] _
		, [-4612, 10505, " ", $vqrange] _
		, [-8340, 10395, " ", $vqrange] _
		, [-6959, 6270, " ", $vqrange] _
		, [-6235, 3659, " ", $vqrange] _
		, [-5597, -146, " ", $vqrange] _
		, [-7315, -2907, " ", $vqrange] _
		, [-10136, -3696, " ", $vqrange] _
		, [-11762, -830, " ", $vqrange] _
		, [-9422, 73, " ", $vqrange] _
		, [-10359, 3788, " ", $vqrange] _
		, [-12670, 6184, " ", $vqrange] _
		, [-14713, 9206, " ", $vqrange] _
		, [-12670, 6184, " ", $vqrange] _
		, [-10359, 3788, " ", $vqrange] _
		, [-9422, 73, " ", $vqrange] _
		, [-11762, -830, " ", $vqrange] _
		, [-10136, -3696, " ", $vqrange] _
		, [-7315, -2907, " ", $vqrange] _
		, [-5597, -146, " ", $vqrange] _
		, [-6235, 3659, " ", $vqrange] _
		, [-6959, 6270, " ", $vqrange] _
		, [-8340, 10395, " ", $vqrange] _
		, [-4612, 10505, " ", $vqrange] _
		, [-3894, 8333, " ", $vqrange] _
		, [-1726, 5728, " ", $vqrange] _
		, [925, 3165, " ", $vqrange] _
		, [3065, 5893, " ", $vqrange] _
		, [5348, 8244, " ", $vqrange] _
		, [7976, 6797, " ", $vqrange] _
		, [11251, 5487, " ", $vqrange] _
		, [12107, 7575, " ", $vqrange] _
		, [13561, 11069, " ", $vqrange] _
		, [17216, 13128, " ", $vqrange] _
		, [21454, 15013, " ", $vqrange] _
		, [24582, 15107, " ", $vqrange] _
		, [20710, 14672, " ", $vqrange] _
		, [17009, 13138, " ", $vqrange] _
		, [14539, 13021, " ", $vqrange] _
		, [11096, 13216, " ", $vqrange] _
		, [8357, 12605, " ", $vqrange] _
		, [7080, 10312, " ", $vqrange] _
		, [6843, 12770, " ", $vqrange] _
		, [4956, 13904, " ", $vqrange] _
		, [-1787, 13993, " ", $vqrange] _
		, [-5409, 16084, " ", $vqrange] _
		, [-7827, 15151, " ", $vqrange] _
		, [-11041, 14355, " ", $vqrange] _
		, [-8774, 10809, " ", $vqrange] _
		, [-7709, 7876, " ", $vqrange] _
		, [-9094, 10790, " ", $vqrange] _
		, [-11246, 14125, " ", $vqrange] _
		, [-13157, 13159, " ", $vqrange] _
		, [-15178, 12041, " ", $vqrange] _
		, [-17923, 14072, " ", $vqrange] _
		, [-16280, 9586, " ", $vqrange] _
		, [-18789, 9320, " ", $vqrange] _
		, [-22640, 8022, " ", $vqrange] _
		, [-21415, 1838, " ", $vqrange] _
		, [-20906, -1221, " ", $vqrange] _
		, [-21176, -3967, " ", $vqrange] _
		, [-19037, -4586, " ", $vqrange] _
		, [-18209, -7531, " ", $vqrange] _
		, [-20605, -10125, " ", $vqrange] _
		, [-23656, -9897, " ", $vqrange] _
		, [-20605, -10125, " ", $vqrange] _
		, [-18091, -7445, " ", $vqrange] _
		, [-15413, -6036, " ", $vqrange] _
		, [-14919, -8564, " ", $vqrange] _
		, [-14136, -11140, " ", $vqrange] _
		, [-12899, -9012, " ", $vqrange] _
		, [-10944, -8045, " ", $vqrange] _
		, [-10264, -6300, " ", $vqrange] _
		, [-8795, -3092, " ", $vqrange] _
		, [-6210, -3214, " ", $vqrange] _
		, [-3611, -1012, " ", $vqrange] _
		, [-905, -678, " ", $vqrange] _
		, [416, -2900, " ", $vqrange] _
		, [3067, -4263, " ", $vqrange] _
		, [4691, -5551, " ", $vqrange] _
		, [2954, -8639, " ", $vqrange] _
		, [1871, -11346, " ", $vqrange] _
		, [5087, -10823, " ", $vqrange] _
		, [4842, -8198, " ", $vqrange] _
		, [7880, -9067, " ", $vqrange] _
		, [14267, -8050.48, " ", $vqrange] _
		, [11030, -6853, " ", $vqrange] _
		, [11116, -4259, " ", $vqrange] _
		, [8943, -3387, " ", $vqrange] _
		, [9999, -911, " ", $vqrange] _
		, [12535, -187, " ", $vqrange] _
		, [13780, 2536, " ", $vqrange] _
		, [15476, 2043, " ", $vqrange] _
		, [16794, 2692, " ", $vqrange] _
		, [19604, 3671, " ", $vqrange] _
		, [20844, 4069, " ", $vqrange] _
		, [24250.24, 4927.76, " ", $vqrange] _
		, [21021, 781, " ", $vqrange] _
		, [17728, -800, " ", $vqrange] _
		, [17534, -6572, " ", $vqrange] ]

		If Not _Vanquisher_ShouldSkipMapEntrySetup() Then
			GoNearestNPCToCoords(18990, -7542)
			Sleep(1000)
			Dialog(0x83)
			Sleep(1000)
			Dialog(0x84)
			Sleep(1000)
		EndIf

		MoveandAggroVQ($aWaypoints)
		MoveandAggroVQReverse($aWaypoints)

	EndIf
EndFunc
