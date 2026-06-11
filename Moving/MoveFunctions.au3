Global Const $CHECK_INTERVAL = 5000
Global Const $REWARD_WAIT_TIME = 1800000 ; 30 minuti
Global $ActionCounter = 0
Global $Gui_Legio
Global $Gui_Bu
Global $g_h_Vanquisher_StoneTimer = 0
Global $BlockCount = 20
Global $RangeLimit = 1450

Func MoveandAggroVQ($aWaypoints)
    If _Vanquisher_IsVanquishComplete() Then Return
    $g_b_Vanquisher_HasRunRoute = True
    Local $timer = TimerInit()
    $BlockCount = 20
    $ActionCounter = 1
    CurrentAction("Vanquish route forward — " & UBound($aWaypoints) & " waypoints.")
    For $Index = 0 To UBound($aWaypoints) - 1
        $RangeLimit = $aWaypoints[$Index][3]
        If _Vanquisher_CheckVanquishDuringRoute($timer, " (forward)") Then Return
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        $ActionCounter += 1
        If _Vanquisher_IsVanquishComplete() Then
            If _Vanquisher_OnVanquishComplete(" (forward)") Then Return
        EndIf
        If $DeadOnTheRun Then
            CurrentAction("We died fighting at: " & $aWaypoints[$Index][2] & $ActionCounter & ", restarting waypoints.")
            $ActionCounter = 1
        	$Index = 0
        	$DeadOnTheRun = 0
            $BlockCount = 2; let's try and get back to our spot ASAP 
        EndIf
    Next
    If _Vanquisher_IsVanquishComplete() Then
        _Vanquisher_OnVanquishComplete(" (forward end)")
        Return
    EndIf
EndFunc

Func MoveandAggroVQWurm($aWaypoints)
    Local $timer = TimerInit()
    For $Index = 0 To UBound($aWaypoints) - 1
        If _Vanquisher_CheckVanquishDuringRoute($timer, " (wurm)") Then Return
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        $ActionCounter += 1
        If _Vanquisher_IsVanquishComplete() Then
            If _Vanquisher_OnVanquishComplete(" (wurm)") Then Return
        EndIf
		Sleep(7000)
    Next
    If _Vanquisher_IsVanquishComplete() Then
        _Vanquisher_OnVanquishComplete(" (wurm end)")
    EndIf
EndFunc

Func MoveandAggroVQReverse($aWaypoints)
    If _Vanquisher_IsVanquishComplete() Then Return
    $g_b_Vanquisher_HasRunRoute = True
    Local $timer = TimerInit()
    $ActionCounter = 1
    CurrentAction("Vanquish route reverse — " & UBound($aWaypoints) & " waypoints.")
    For $Index = UBound($aWaypoints) - 1 To 0 Step -1
        If _Vanquisher_CheckVanquishDuringRoute($timer, " (reverse)") Then Return
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        $ActionCounter += 1
        If _Vanquisher_IsVanquishComplete() Then
            If _Vanquisher_OnVanquishComplete(" (reverse)") Then Return
        EndIf
        If $DeadOnTheRun Then
            CurrentAction("We died fighting at: " & $aWaypoints[$Index][2] & $ActionCounter & ", restarting waypoints.")
            $ActionCounter = 1
        	$Index = UBound($aWaypoints) - 1
        	$DeadOnTheRun = 0
            $BlockCount = 2; let's try and get back to our spot ASAP 
        EndIf
    Next
    If _Vanquisher_IsVanquishComplete() Then
        _Vanquisher_OnVanquishComplete(" (reverse end)")
        Return
    EndIf
    CurrentAction("Route done — " & GetFoesKilled() & " killed, " & GetFoesToKill() & " remaining.")
EndFunc

Func _Vanquisher_OnVanquishComplete($a_s_Phase = "")
    UpdateVanquish()
    CurrentAction("Vanquish complete" & $a_s_Phase & " — " & GetFoesKilled() & " killed, 0 remaining.")
    Return True
EndFunc

Func _Vanquisher_CheckVanquishDuringRoute(ByRef $a_h_Timer, $a_s_Phase)
    If TimerDiff($a_h_Timer) < $CHECK_INTERVAL Then Return False
    $a_h_Timer = TimerInit()
    UpdateVanquish()
    If Not _Vanquisher_IsVanquishComplete() Then Return False
    Return _Vanquisher_OnVanquishComplete($a_s_Phase)
EndFunc

Func _IsBuEnabled()
    If $Bool_Bu Then Return True
    Return GUICtrlRead($Gui_Bu) = $GUI_CHECKED
EndFunc

Func _IsStonesEnabled()
    If $Bool_Stones Then Return True
    Return GUICtrlRead($Gui_Legio) = $GUI_CHECKED
EndFunc

Func UseBU()
    If Not _IsBuEnabled() Then Return
    If GetPartyDead() Then Return
    For $l_i_Idx = 0 To UBound($VANQUISHER_BU_MODEL_IDS) - 1
        Local $l_i_Effect = $VANQUISHER_BU_EFFECT_IDS[$l_i_Idx]
        If $l_i_Effect > 0 And GetEffectTimeRemainingEx(-2, $l_i_Effect) > 0 Then ContinueLoop
        _Vanquisher_UseItemModelID($VANQUISHER_BU_MODEL_IDS[$l_i_Idx])
    Next
EndFunc

Func UseVanquisherStones()
    If Not _IsStonesEnabled() Then Return
    If $g_h_Vanquisher_StoneTimer <> 0 And TimerDiff($g_h_Vanquisher_StoneTimer) < $VANQUISHER_STONE_INTERVAL Then Return
    If UseSummoningStone() Then
        $g_h_Vanquisher_StoneTimer = TimerInit()
    EndIf
EndFunc

Func AggroMoveTo($x, $y, $s = "", $z = 1450)

	CurrentAction("Moving to Waypoint:" & $s)
	$random = 50
	$iBlocked = 0
	$boolOpenChests = _IsOpenChestsEnabled()
	$boolUseConset = _IsConsetEnabled()

	Move($x, $y, $random)

	$lMe = GetAgentByID(-2)
	$coordsX = DllStructGetData($lMe, "X")
	$coordsY = DllStructGetData($lMe, "Y")

	Do
		If $DeadOnTheRun Then ExitLoop
		If _Vanquisher_IsVanquishComplete() Then
			_Vanquisher_OnVanquishComplete(" (move)")
			Return
		EndIf
		If $boolUseConset Then UseConset()
		If _IsBuEnabled() Then UseBU()
		If _IsStonesEnabled() Then UseVanquisherStones()
		RndSleep(250)
		$oldCoordsX = $coordsX
		$oldCoordsY = $coordsY
		$nearestenemy = GetNearestEnemyToAgent(-2, $z)
		If $nearestenemy <> 0 Then
			$lDistance = GetDistance($nearestenemy, -2)
			If $lDistance < $z And _Vanquisher_AgentID($nearestenemy) <> 0 Then
				Fight($z, $s)
				$iBlocked = 0
				Move($x, $y, $random)
			EndIf
		EndIf
		If $boolOpenChests Then 
			CheckForChest()
		EndIf


		If $DeadOnTheRun Then ExitLoop
		RndSleep(250)
		$lMe = GetAgentByID(-2)
		$coordsX = DllStructGetData($lMe, "X")
		$coordsY = DllStructGetData($lMe, "Y")
		If ComputeDistance($coordsX, $coordsY, $x, $y) >= 250 Then
			Move($x, $y, $random)
		EndIf
		If $oldCoordsX = $coordsX And $oldCoordsY = $coordsY Then
			$iBlocked += 1
			Move($coordsX, $coordsY, 500)
			RndSleep(350)
			Move($x, $y, $random)
		EndIf
		If $boolOpenChests Then 
			CheckForChest()
		EndIf
	Until ComputeDistance($coordsX, $coordsY, $x, $y) < 250 Or $iBlocked > $BlockCount
EndFunc   ;==>AggroMoveTo


Func _IsOpenChestsEnabled()
    If $Bool_OpenChests Then Return True
    Return GUICtrlRead($Gui_OpenChests) = $GUI_CHECKED
EndFunc

Func _IsConsetEnabled()
    If $Bool_Conset Then Return True
    Return GUICtrlRead($Gui_Conset) = $GUI_CHECKED
EndFunc

Func GetMaxPartySize($mapid)
    Return 8
EndFunc
