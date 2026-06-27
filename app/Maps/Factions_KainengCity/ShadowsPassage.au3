#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func VQShadowsPassage()
	If GetMapID() <> $ShadowsPassage_Map And GetMapID() <> $ShadowsPassage_Outpost Then
		CurrentAction("Traveling to outpost for Shadows Passage.")
		TravelTo($ShadowsPassage_Outpost)
	EndIf

	If GetMapID() = $ShadowsPassage_Outpost Then
		_Vanquisher_ApplyDifficulty()
		Return
	EndIf

	If GetMapID() <> $ShadowsPassage_Map Then
		CurrentAction("Shadows Passage route waiting - on map " & GetMapID() & ", need " & $ShadowsPassage_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Shadows Passage vanquish route.")
	$g_b_Vanquisher_TransitOnly = False
	_Vanquisher_InitCombatAI()

	Local $aWaypoints[6][4] = [ [3396, 16639, " ", $vqrange] _
		, [2094, 18885, " ", $vqrange] _
		, [61, 18889, " ", $vqrange] _
		, [-682, 13737, " ", $vqrange] _
		, [-3699, 14519, " ", $vqrange] _
		, [-4255, 16101, " ", $vqrange] ]

	MoveandAggroVQ($aWaypoints)
	MoveAndAggroVQReverse($aWaypoints)
EndFunc
