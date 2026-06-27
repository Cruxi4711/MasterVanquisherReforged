#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func VQSaoshangTrail()
	If GetMapID() <> $SaoshangTrail_Map And GetMapID() <> $SaoshangTrail_Outpost Then
		CurrentAction("Traveling to outpost for Saoshang Trail.")
		TravelTo($SaoshangTrail_Outpost)
	EndIf

	If GetMapID() = $SaoshangTrail_Outpost Then
		_Vanquisher_ApplyDifficulty()
		Return
	EndIf

	If GetMapID() <> $SaoshangTrail_Map Then
		CurrentAction("Saoshang Trail route waiting - on map " & GetMapID() & ", need " & $SaoshangTrail_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Saoshang Trail vanquish route.")
	$g_b_Vanquisher_TransitOnly = False
	_Vanquisher_InitCombatAI()

	Local $aWaypoints[9][4] = [ [15519, 13409, " ", $vqrange] _
		, [14502, 13165, " ", $vqrange] _
		, [12763, 12433, " ", $vqrange] _
		, [9805, 10947, " ", $vqrange] _
		, [8691, 11878, " ", $vqrange] _
		, [8329, 12867, " ", $vqrange] _
		, [7215, 13842, " ", $vqrange] _
		, [6003, 13827, " ", $vqrange] _
		, [3584, 10280, " ", $vqrange] ]

	MoveandAggroVQ($aWaypoints)
	Reverse($aWaypoints)
EndFunc
