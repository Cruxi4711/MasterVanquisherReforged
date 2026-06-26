Global Const $CHECK_INTERVAL = 1500
Global Const $REWARD_WAIT_TIME = 1800000 ; 30 minuti
Global $ActionCounter = 0
Global $Gui_Legio, $Gui_Bu, $Gui_Conset, $Gui_OpenChests
Global $Bool_Conset, $Bool_Bu, $Bool_Stones, $Bool_OpenChests
Global $BlockCount = 20
Global $RangeLimit = 1450

; All maps use these route helpers — vanquish complete / abort is handled here globally.
Func _Vanquisher_ExitRouteIfDone($a_s_Phase = "")
    If _Vanquisher_ShouldStop() Then Return True
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
        If _Vanquisher_ShouldStop() Then Return
        AggroMoveTo($a_a_Points[$l_i_Idx][0], $a_a_Points[$l_i_Idx][1], $a_s_Label & ($l_i_Idx + 1), $a_i_AggroRange)
    Next
    If _Vanquisher_ShouldStop() Then Return
    AggroMoveTo($a_a_Points[$l_i_Last][0], $a_a_Points[$l_i_Last][1], $a_s_Label & " portal", $a_i_AggroRange)
    Local $l_i_MapBefore = GetMapID()
    Move($a_a_Points[$l_i_Last][0], $a_a_Points[$l_i_Last][1])
    If GetMapID() <> $l_i_MapBefore Or Map_GetInstanceInfo("IsLoading") Then Return
    WaitForLoad()
EndFunc

; Standard forward + reverse route (use for any map with both passes).
Func MoveandAggroVQFullRoute($aWaypoints)
    MoveandAggroVQ($aWaypoints)
    If _Vanquisher_ShouldStop() Then Return
    MoveandAggroVQReverse($aWaypoints)
EndFunc

Func MoveandAggroVQ($aWaypoints)
    If _Vanquisher_ExitRouteIfDone(" (forward skip)") Then Return
    $g_b_Vanquisher_HasRunRoute = True
    _Vanquisher_ApplyConsumables(True)
    Local $timer = TimerInit()
    $BlockCount = 20
    $ActionCounter = 1
    CurrentAction("Vanquish route forward — " & UBound($aWaypoints) & " waypoints.")
    For $Index = 0 To UBound($aWaypoints) - 1
        If _Vanquisher_ShouldStop() Then Return
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
        If _Vanquisher_ShouldStop() Then Return
        If _Vanquisher_CheckVanquishDuringRoute($timer, " (wurm)") Then Return
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        $ActionCounter += 1
        If _Vanquisher_IsVanquishComplete() Then
            If _Vanquisher_OnVanquishComplete(" (wurm)") Then Return
        EndIf
		_Vanquisher_CooperativeSleep(7000)
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
        If _Vanquisher_ShouldStop() Then Return
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
    Global $Bool_Bu, $Gui_Bu
    If $Bool_Bu Then Return True
    If Not $Gui_Bu Then Return False
    Return BitAND(GUICtrlRead($Gui_Bu), $GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func _IsStonesEnabled()
    Global $Bool_Stones, $Gui_Legio
    If $Bool_Stones Then Return True
    If Not $Gui_Legio Then Return False
    Return BitAND(GUICtrlRead($Gui_Legio), $GUI_CHECKED) = $GUI_CHECKED
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

Func _Vanquisher_CanUseConsumables()
    If $g_b_Vanquisher_TransitOnly Then Return False
    Return Map_GetInstanceInfo("IsExplorable")
EndFunc

Func _Vanquisher_WaitForExplorable($a_i_MaxMs = 8000)
    If _Vanquisher_CanUseConsumables() Then Return True
    Local $l_i_Wait = 0
    While $l_i_Wait < $a_i_MaxMs And Not _Vanquisher_ShouldStop()
        _Vanquisher_CooperativeSleep(250)
        $l_i_Wait += 250
        If _Vanquisher_CanUseConsumables() Then Return True
    WEnd
    Return _Vanquisher_CanUseConsumables()
EndFunc

Func _Vanquisher_ApplyConsumables($a_b_Force = False)
    If Not _Vanquisher_CanUseConsumables() Then
        If Not $a_b_Force Then Return
        If Not _Vanquisher_WaitForExplorable() Then Return
    EndIf
    If Not $a_b_Force Then
        If Not _Vanquisher_ShouldPollConsumables() Then Return
    EndIf
    $g_h_Vanquisher_ConsumablePollTimer = TimerInit()
    If _IsConsetEnabled() Then
        CurrentAction("Applying ConSets...")
        _Vanquisher_UseConsetBuffered($a_b_Force)
    EndIf
    If _IsBuEnabled() Then _Vanquisher_UseBUBuffered()
    If _IsStonesEnabled() Then _Vanquisher_UseStonesBuffered()
EndFunc

Func _Vanquisher_UseConsetBuffered($a_b_Force = False)
    If GetPartyDead() Then Return
    If Map_GetInstanceInfo("IsOutpost") Then Return
    If Not Map_GetInstanceInfo("IsExplorable") Then Return
    If $a_b_Force Then
        For $l_i_Idx = 0 To 2
            $g_a_Vanquisher_ConsetLastUsed[$l_i_Idx] = 0
        Next
    EndIf
    Local $l_i_Before = _Vanquisher_CountConsetEffects()
    UseConset()
    Local $l_i_After = _Vanquisher_CountConsetEffects()
    If $l_i_After <= $l_i_Before Then
        If Not FindConset() Then
            CurrentAction("ConSets missing — need Essence, Armor, and Grail in backpack/bags.")
        Else
            CurrentAction("ConSet effects already active or items could not be used.")
        EndIf
    Else
        CurrentAction("ConSets applied (" & $l_i_After & "/3 effects active).")
    EndIf
EndFunc

Func _Vanquisher_CountConsetEffects()
    Local $l_i_Count = 0
    If Agent_GetAgentEffectInfo(-2, $EffectEssence, "HasEffect") Then $l_i_Count += 1
    If Agent_GetAgentEffectInfo(-2, $EffectArmor, "HasEffect") Then $l_i_Count += 1
    If Agent_GetAgentEffectInfo(-2, $EffectGrail, "HasEffect") Then $l_i_Count += 1
    Return $l_i_Count
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
    If Agent_GetAgentEffectInfo(-2, 2886, "HasEffect") Then Return
    If HasImp(-2) And _Vanquisher_ConsumableOnCooldown($g_h_Vanquisher_StoneTimer) Then Return
    If UseSummoningStone() Then
        CurrentAction("Summoning stone used.")
        $g_h_Vanquisher_StoneTimer = TimerInit()
    EndIf
EndFunc

Func UseBU()
    _Vanquisher_UseBUBuffered()
EndFunc

Func UseVanquisherStones()
    _Vanquisher_UseStonesBuffered()
EndFunc

Func _Vanquisher_SkillIsResurrection($a_i_SkillID)
    For $l_i_Idx = 0 To UBound($RezSkillIDs) - 1
        If $a_i_SkillID = $RezSkillIDs[$l_i_Idx] Then Return True
    Next
    Return False
EndFunc

Func _Vanquisher_CountDeadPartyMembers()
    Local $l_i_Count = 0
    If GetIsDead(-2) Then $l_i_Count += 1

    Local $l_i_HeroCount = Party_GetMyPartyInfo("ArrayHeroPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HeroCount
        Local $l_i_AgentID = Party_GetMyPartyHeroInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then $l_i_Count += 1
    Next

    Local $l_i_HenchCount = Party_GetMyPartyInfo("ArrayHenchmanPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HenchCount
        Local $l_i_AgentID = Party_GetMyPartyHenchmanInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then $l_i_Count += 1
    Next

    Return $l_i_Count
EndFunc

Func _Vanquisher_CountAvailableResurrections()
    Local $l_i_Count = 0

    If Not GetIsDead(-2) Then
        For $l_i_Slot = 1 To 8
            Local $l_i_SkillID = Skill_GetSkillbarInfo($l_i_Slot, "SkillID", 0)
            If $l_i_SkillID = 0 Then ContinueLoop
            If Not _Vanquisher_SkillIsResurrection($l_i_SkillID) Then ContinueLoop
            If Skill_GetSkillbarInfo($l_i_Slot, "IsRecharged", 0) Then $l_i_Count += 1
        Next
    EndIf

    Local $l_i_HeroCount = Party_GetMyPartyInfo("ArrayHeroPartyMemberSize")
    For $l_i_Hero = 1 To $l_i_HeroCount
        Local $l_i_AgentID = Party_GetMyPartyHeroInfo($l_i_Hero, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then ContinueLoop

        For $l_i_Slot = 1 To 8
            Local $l_i_SkillID = Skill_GetSkillbarInfo($l_i_Slot, "SkillID", $l_i_Hero)
            If $l_i_SkillID = 0 Then ContinueLoop
            If Not _Vanquisher_SkillIsResurrection($l_i_SkillID) Then ContinueLoop
            If Skill_GetSkillbarInfo($l_i_Slot, "IsRecharged", $l_i_Hero) Then $l_i_Count += 1
        Next
    Next

    Return $l_i_Count
EndFunc

Func _Vanquisher_ShouldAttemptResurrection()
    If GetPartyDead() Then Return False
    If _Vanquisher_CountDeadPartyMembers() = 0 Then Return False
    Return _Vanquisher_CountAvailableResurrections() > 0
EndFunc

Func _Vanquisher_GetNearestDeadPartyMember()
    Local $l_i_NearestID = 0
    Local $l_f_NearestDist = 999999

    If GetIsDead(-2) Then Return -2

    Local $l_i_HeroCount = Party_GetMyPartyInfo("ArrayHeroPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HeroCount
        Local $l_i_AgentID = Party_GetMyPartyHeroInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Not Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then ContinueLoop
        Local $l_f_Dist = GetDistance($l_i_AgentID, -2)
        If $l_f_Dist < $l_f_NearestDist Then
            $l_f_NearestDist = $l_f_Dist
            $l_i_NearestID = $l_i_AgentID
        EndIf
    Next

    Local $l_i_HenchCount = Party_GetMyPartyInfo("ArrayHenchmanPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HenchCount
        Local $l_i_AgentID = Party_GetMyPartyHenchmanInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Not Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then ContinueLoop
        Local $l_f_Dist = GetDistance($l_i_AgentID, -2)
        If $l_f_Dist < $l_f_NearestDist Then
            $l_f_NearestDist = $l_f_Dist
            $l_i_NearestID = $l_i_AgentID
        EndIf
    Next

    Return $l_i_NearestID
EndFunc

Func _Vanquisher_HandlePartyResurrection($a_i_MaxWaitMs = $VANQUISHER_REZ_COMBAT_WAIT_MS)
    Local $l_i_DeadID = _Vanquisher_GetNearestDeadPartyMember()
    If $l_i_DeadID = 0 Then Return

    Local $l_h_Timer = TimerInit()
    Do
        If _Vanquisher_ShouldStop() Or GetPartyDead() Then Return

        If Not GetIsDead(-2) And $l_i_DeadID <> -2 Then
            Local $l_f_X = Agent_GetAgentInfo($l_i_DeadID, "X")
            Local $l_f_Y = Agent_GetAgentInfo($l_i_DeadID, "Y")
            If ComputeDistance(Agent_GetAgentInfo(-2, "X"), Agent_GetAgentInfo(-2, "Y"), $l_f_X, $l_f_Y) > 1000 Then
                Move($l_f_X, $l_f_Y, 50)
            EndIf

            For $l_i_Slot = 1 To 8
                Local $l_i_SkillID = Skill_GetSkillbarInfo($l_i_Slot, "SkillID", 0)
                If $l_i_SkillID = 0 Then ContinueLoop
                If Not _Vanquisher_SkillIsResurrection($l_i_SkillID) Then ContinueLoop
                If Not Skill_GetSkillbarInfo($l_i_Slot, "IsRecharged", 0) Then ContinueLoop
                UseSkillEx($l_i_Slot, $l_i_DeadID)
                ExitLoop
            Next
        EndIf

        RndSleep(250)

        If $l_i_DeadID = -2 Then
            If Not GetIsDead(-2) Then Return
        ElseIf Not Agent_GetAgentInfo($l_i_DeadID, "IsDead") Then
            $l_i_DeadID = _Vanquisher_GetNearestDeadPartyMember()
            If $l_i_DeadID = 0 Then Return
        EndIf
    Until _Vanquisher_CountAvailableResurrections() = 0 Or _Vanquisher_CountDeadPartyMembers() = 0 Or TimerDiff($l_h_Timer) > $a_i_MaxWaitMs
EndFunc

Func AggroMoveTo($x, $y, $s = "", $z = 1450)
	If _Vanquisher_ShouldStop() Then Return
	If Not $g_b_Vanquisher_TransitOnly And _Vanquisher_IsVanquishComplete() Then
		_Vanquisher_OnVanquishComplete(" (waypoint)")
		Return
	EndIf

	CurrentAction("Moving to Waypoint:" & $s)
	$random = 50
	$iBlocked = 0
	$boolOpenChests = _IsOpenChestsEnabled()

	If Not $g_b_Vanquisher_TransitOnly Then _Vanquisher_ApplyConsumables(True)

	Move($x, $y, $random)

	$lMe = GetAgentByID(-2)
	$coordsX = DllStructGetData($lMe, "X")
	$coordsY = DllStructGetData($lMe, "Y")

	Do
		If $DeadOnTheRun Or _Vanquisher_ShouldStop() Then ExitLoop
		If _Vanquisher_CountDeadPartyMembers() > 0 And _Vanquisher_ShouldAttemptResurrection() Then
			_Vanquisher_HandlePartyResurrection($VANQUISHER_REZ_COMBAT_WAIT_MS)
			If GetPartyDead() Then $DeadOnTheRun = 1
		EndIf
		If Not $g_b_Vanquisher_TransitOnly And _Vanquisher_IsVanquishComplete() Then
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
				If _Vanquisher_ShouldStop() Then Return
				_Vanquisher_ApplyConsumables()
				UpdateVanquish()
				If Not $g_b_Vanquisher_TransitOnly And _Vanquisher_IsVanquishComplete() Then
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
    Global $Bool_OpenChests, $Gui_OpenChests
    If $Bool_OpenChests Then Return True
    If Not $Gui_OpenChests Then Return False
    Return BitAND(GUICtrlRead($Gui_OpenChests), $GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func _IsConsetEnabled()
    Global $Bool_Conset, $Gui_Conset
    If $Bool_Conset Then Return True
    If Not $Gui_Conset Then Return False
    Return BitAND(GUICtrlRead($Gui_Conset), $GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func GetMaxPartySize($mapid)
    Return 8
EndFunc
