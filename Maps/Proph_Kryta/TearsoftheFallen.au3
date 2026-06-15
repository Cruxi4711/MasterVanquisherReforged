#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aTearsOutpostPath[2][2] = [ _
	[2043, 11028], _
	[1795, 11698] _
]

Local $aTearsTransitPath[7][2] = [ _
	[1606, 13394], _
	[-4298, 17149], _
	[-5176, 20570], _
	[-9688, 20389], _
	[-11232, 18965], _
	[-12577, 21055], _
	[-13618, 20788] _
]

; Outpost 137 -> transit 63 (Stingray Strand) -> farm 53 (Tears of the Fallen). Two portals.
Func GoOutTearsoftheFallen()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TearsoftheFallen_Outpost Then
		CurrentAction("Tears of the Fallen — outpost to transit.")
		_Vanquisher_RunAggroPortalPath($aTearsOutpostPath, $vqrange, "outpost ")
		Return
	EndIf

	If $l_i_Map = $TearsoftheFallen_Transit Then
		CurrentAction("Tears of the Fallen — transit to farm.")
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroPortalPath($aTearsTransitPath, $vqrange, "transit ")
	EndIf
EndFunc

Func VQTearsoftheFallen()
	If GetMapID() <> $TearsoftheFallen_Map And GetMapID() <> $TearsoftheFallen_Outpost And GetMapID() <> $TearsoftheFallen_Transit Then
		TravelTo($TearsoftheFallen_Outpost)
	EndIf

	If GetMapID() = $TearsoftheFallen_Outpost Or GetMapID() = $TearsoftheFallen_Transit Then
		_Vanquisher_ApplyDifficulty()
		Do
			GoOutTearsoftheFallen()
			Sleep(2000)
		Until GetMapID() = $TearsoftheFallen_Map
	EndIf

	If GetMapID() <> $TearsoftheFallen_Map Then
		CurrentAction("Tears route waiting — on map " & GetMapID() & ", need " & $TearsoftheFallen_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Tears of the Fallen route.")

	Local $aWaypoints[31][4] = [ _
		[3377, -6583, " ", $vqrange], _
		[2544, -5393, " ", $vqrange], _
		[-1324, -7624, " ", $vqrange], _
		[-2484, -3816, " ", $vqrange], _
		[-5555, -3910, " ", $vqrange], _
		[-1502, -2477, " ", $vqrange], _
		[-199, -1006, " ", $vqrange], _
		[-1151, 1396, " ", $vqrange], _
		[-2077, 3639, " ", $vqrange], _
		[-4531, 1826, " ", $vqrange], _
		[-9006, -3149, " ", $vqrange], _
		[-6171, 1949, " ", $vqrange], _
		[-4233, 3485, " ", $vqrange], _
		[-6382, 3236, " ", $vqrange], _
		[-7483, 6598, " ", $vqrange], _
		[-4805, 9037, " ", $vqrange], _
		[194, 8115, " ", $vqrange], _
		[973, 6401, " ", $vqrange], _
		[2996, 5353, " ", $vqrange], _
		[878, 5051, " ", $vqrange], _
		[3886, 6194, " ", $vqrange], _
		[4219, 4096, " ", $vqrange], _
		[6372, 2264, " ", $vqrange], _
		[5841, 850, " ", $vqrange], _
		[4948, -1917, " ", $vqrange], _
		[2742, -4146, " ", $vqrange], _
		[7656, -4505, " ", $vqrange], _
		[2390, -2661, " ", $vqrange], _
		[-2044, -1471, " ", $vqrange], _
		[-3145, 1059, " ", $vqrange] _

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
