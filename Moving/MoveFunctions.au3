Global Const $CHECK_INTERVAL = 1500
Global Const $REWARD_WAIT_TIME = 1800000 ; 30 minuti
Global $ActionCounter = 0
Global $Gui_Legio
Global $Gui_Bu
Global $BlockCount = 20
Global $RangeLimit = 1450

; All maps use these route helpers — vanquish complete / abort is handled here globally.
Func _Vanquisher_ExitRouteIfDone($a_s_Phase = "")
    If $g_b_Vanquisher_AbortRoute Then Return True
    If _Vanquisher_IsVanquishComplete() Then
        _Vanquisher_OnVanquishComplete($a_s_Phase)
        Return True
    EndIf
    Return False
EndFunc

; Move through path with combat; last point is a portal (AggroMoveTo then Move + WaitForLoad).
Func _Vanquisher_RunAggroPortalPath($a_a_Points, $a_i_AggroRange = 1450, $a_s_Label = "")
    Local $l_i_Count = UBound($a_a_Points)
    If $l_i_Count < 1 Then Return
    Local $l_i_Last = $l_i_Count - 1
    For $l_i_Idx = 0 To $l_i_Last - 1
        If $g_b_Vanquisher_AbortRoute Then Return
        AggroMoveTo($a_a_Points[$l_i_Idx][0], $a_a_Points[$l_i_Idx][1], $a_s_Label & ($l_i_Idx + 1), $a_i_AggroRange)
    Next
    If $g_b_Vanquisher_AbortRoute Then Return
    AggroMoveTo($a_a_Points[$l_i_Last][0], $a_a_Points[$l_i_Last][1], $a_s_Label & " portal", $a_i_AggroRange)
    Move($a_a_Points[$l_i_Last][0], $a_a_Points[$l_i_Last][1])
    WaitForLoad()
EndFunc

; Standard forward + reverse route (use for any map with both passes).
Func MoveandAggroVQFullRoute($aWaypoints)
    MoveandAggroVQ($aWaypoints)
    If $g_b_Vanquisher_AbortRoute Then Return
    MoveandAggroVQReverse($aWaypoints)
EndFunc

Func MoveandAggroVQ($aWaypoints)
    If _Vanquisher_ExitRouteIfDone(" (forward skip)") Then Return
    $g_b_Vanquisher_HasRunRoute = True
    Local $timer = TimerInit()
    $BlockCount = 20
    $ActionCounter = 1
    CurrentAction("Vanquish route forward — " & UBound($aWaypoints) & " waypoints.")
    For $Index = 0 To UBound($aWaypoints) - 1
        If $g_b_Vanquisher_AbortRoute Then Return
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
    If _Vanquisher_ExitRouteIfDone(" (wurm skip)") Then Return
    $g_b_Vanquisher_HasRunRoute = True
    Local $timer = TimerInit()
    For $Index = 0 To UBound($aWaypoints) - 1
        If $g_b_Vanquisher_AbortRoute Then Return
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
    If _Vanquisher_ExitRouteIfDone(" (reverse skip)") Then Return
    $g_b_Vanquisher_HasRunRoute = True
    Local $timer = TimerInit()
    $ActionCounter = 1
    CurrentAction("Vanquish route reverse — " & UBound($aWaypoints) & " waypoints.")
    For $Index = UBound($aWaypoints) - 1 To 0 Step -1
        If $g_b_Vanquisher_AbortRoute Then Return
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
    If Not GetAreaVanquished() Then Return False
    CurrentAction("Vanquish complete" & $a_s_Phase & " — " & GetFoesKilled() & " killed, 0 remaining.")
    _Vanquisher_FinishRun()
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

Func _Vanquisher_ConsumableOnCooldown(ByRef $a_h_LastUsed)
    If $a_h_LastUsed = 0 Then Return False
    Return TimerDiff($a_h_LastUsed) < $VANQUISHER_CONSUMABLE_BUFFER_MS
EndFunc

Func _Vanquisher_ConsumableDebounce(ByRef $a_h_LastUsed)
    If $a_h_LastUsed = 0 Then Return False
    Return TimerDiff($a_h_LastUsed) < $VANQUISHER_CONSUMABLE_DEBOUNCE_MS
EndFunc

Func _Vanquisher_ShouldPollConsumables()
    If $g_h_Vanquisher_ConsumablePollTimer = 0 Then Return True
    Return TimerDiff($g_h_Vanquisher_ConsumablePollTimer) >= $VANQUISHER_CONSUMABLE_POLL_MS
EndFunc

Func _Vanquisher_ApplyConsumables($a_b_Force = False)
    If Not $a_b_Force Then
        If Not _Vanquisher_ShouldPollConsumables() Then Return
    EndIf
    $g_h_Vanquisher_ConsumablePollTimer = TimerInit()
    If _IsConsetEnabled() Then _Vanquisher_UseConsetBuffered()
    If _IsBuEnabled() Then _Vanquisher_UseBUBuffered()
    If _IsStonesEnabled() Then _Vanquisher_UseStonesBuffered()
EndFunc

Func _Vanquisher_UseConsetBuffered()
    If GetPartyDead() Then Return
    Local $l_a_Effects[3] = [$EffectEssence, $EffectArmor, $EffectGrail]
    For $l_i_Idx = 0 To UBound($Conset) - 1
        If GetEffectTimeRemainingEx(-2, $l_a_Effects[$l_i_Idx]) > 0 Then ContinueLoop
        If _Vanquisher_ConsumableDebounce($g_a_Vanquisher_ConsetLastUsed[$l_i_Idx]) Then ContinueLoop
        For $l_i_Bag = 1 To 4
            For $l_i_Slot = 1 To Item_GetBagInfo($l_i_Bag, "Slots")
                Local $l_p_Item = Item_GetItemBySlot($l_i_Bag, $l_i_Slot)
                If $l_p_Item = 0 Then ContinueLoop
                If Item_GetItemInfoByPtr($l_p_Item, "ModelID") <> $Conset[$l_i_Idx] Then ContinueLoop
                Item_UseItem($l_p_Item)
                $g_a_Vanquisher_ConsetLastUsed[$l_i_Idx] = TimerInit()
                RndSleep(750)
                ExitLoop 2
            Next
        Next
    Next
EndFunc

Func _Vanquisher_UseBUBuffered()
    If GetPartyDead() Then Return
    For $l_i_Idx = 0 To UBound($VANQUISHER_BU_MODEL_IDS) - 1
        Local $l_i_Effect = $VANQUISHER_BU_EFFECT_IDS[$l_i_Idx]
        If $l_i_Effect > 0 Then
            If GetEffectTimeRemainingEx(-2, $l_i_Effect) > 0 Then ContinueLoop
            If _Vanquisher_ConsumableDebounce($g_a_Vanquisher_BULastUsed[$l_i_Idx]) Then ContinueLoop
        Else
            If $g_a_Vanquisher_BUUsedThisZone[$l_i_Idx] And _Vanquisher_ConsumableOnCooldown($g_a_Vanquisher_BULastUsed[$l_i_Idx]) Then ContinueLoop
        EndIf
        If _Vanquisher_UseItemModelID($VANQUISHER_BU_MODEL_IDS[$l_i_Idx]) Then
            $g_a_Vanquisher_BULastUsed[$l_i_Idx] = TimerInit()
            $g_a_Vanquisher_BUUsedThisZone[$l_i_Idx] = True
        EndIf
    Next
EndFunc

Func _Vanquisher_UseStonesBuffered()
    If GetPartyDead() Then Return
    If GetEffectTimeRemainingEx(-2, 2886) <> 0 Then Return
    If HasImp(-2) And _Vanquisher_ConsumableOnCooldown($g_h_Vanquisher_StoneTimer) Then Return
    If UseSummoningStone() Then
        $g_h_Vanquisher_StoneTimer = TimerInit()
    EndIf
EndFunc

Func UseBU()
    _Vanquisher_UseBUBuffered()
EndFunc

Func UseVanquisherStones()
    _Vanquisher_UseStonesBuffered()
EndFunc

Func AggroMoveTo($x, $y, $s = "", $z = 1450)
	If $g_b_Vanquisher_AbortRoute Then Return
	If _Vanquisher_IsVanquishComplete() Then
		_Vanquisher_OnVanquishComplete(" (waypoint)")
		Return
	EndIf

	CurrentAction("Moving to Waypoint:" & $s)
	$random = 50
	$iBlocked = 0
	$boolOpenChests = _IsOpenChestsEnabled()

	Move($x, $y, $random)

	$lMe = GetAgentByID(-2)
	$coordsX = DllStructGetData($lMe, "X")
	$coordsY = DllStructGetData($lMe, "Y")

	Do
		If $DeadOnTheRun Or $g_b_Vanquisher_AbortRoute Then ExitLoop
		If _Vanquisher_IsVanquishComplete() Then
			_Vanquisher_OnVanquishComplete(" (move)")
			Return
		EndIf
		If _Vanquisher_ShouldPollConsumables() Then
			_Vanquisher_ApplyConsumables()
			Move($x, $y, $random)
		EndIf
		RndSleep(250)
		$oldCoordsX = $coordsX
		$oldCoordsY = $coordsY
		$nearestenemy = GetNearestEnemyToAgent(-2, $z)
		If $nearestenemy <> 0 Then
			$lDistance = GetDistance($nearestenemy, -2)
			If $lDistance < $z And _Vanquisher_AgentID($nearestenemy) <> 0 Then
				Fight($z, $s)
				If $g_b_Vanquisher_AbortRoute Then Return
				_Vanquisher_ApplyConsumables()
				UpdateVanquish()
				If _Vanquisher_IsVanquishComplete() Then
					_Vanquisher_OnVanquishComplete(" (after fight)")
					Return
				EndIf
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
