
Func _Vanquisher_FightExitCallback()
    If Not $g_b_Vanquisher_CombatStateActive Then Return True
    If Map_GetInstanceInfo("IsLoading") Or Not Map_GetInstanceInfo("IsExplorable") Then Return True
    If Death() = 1 Or GetIsDead(-2) Then Return True
    If $g_h_Vanquisher_FightTimer <> 0 And TimerDiff($g_h_Vanquisher_FightTimer) > 120000 Then Return True
    If $DeadOnTheRun Or $g_b_Vanquisher_AbortRoute Then Return True
    If Not $g_b_Vanquisher_TransitOnly And _Vanquisher_IsVanquishComplete() Then Return True
    Return False
EndFunc

Func Fight($a_i_AggroRange, $a_s_Label = "")
    If Map_GetInstanceInfo("IsLoading") Or Not Map_GetInstanceInfo("IsExplorable") Then
        _Vanquisher_ResetCombatState("skip fight in non-explorable/loading")
        Return
    EndIf
    If Death() = 1 Or GetIsDead(-2) Then Return
    If GetPartyDead() Then Return

    _Vanquisher_InitCombatAI()
    If Not $g_b_Vanquisher_CombatAIReady Then Return

    $g_b_Vanquisher_CombatStateActive = True
    $g_s_Vanquisher_CombatGroupLabel = String($a_s_Label)
    $g_h_Vanquisher_FightTimer = TimerInit()
    CurrentAction("Fighting Group #:" & $g_s_Vanquisher_CombatGroupLabel)
    Local $l_f_AnchorX = Agent_GetAgentInfo(-2, "X")
    Local $l_f_AnchorY = Agent_GetAgentInfo(-2, "Y")

    UAI_UpdateCache($a_i_AggroRange)
    UAI_Fight($l_f_AnchorX, $l_f_AnchorY, $a_i_AggroRange, 3500, $g_i_FinisherMode, True, 0, False, "_Vanquisher_FightExitCallback")

    If Map_GetInstanceInfo("IsLoading") Or Not Map_GetInstanceInfo("IsExplorable") Then
        _Vanquisher_ResetCombatState("fight ended during zoning")
        Return
    EndIf

    UpdateVanquish()
    If Not $g_b_Vanquisher_TransitOnly And _Vanquisher_IsVanquishComplete() Then
        _Vanquisher_ResetCombatState()
        _Vanquisher_OnVanquishComplete(" (fight)")
        Return
    EndIf
    If $g_b_Vanquisher_AbortRoute Then
        _Vanquisher_ResetCombatState()
        Return
    EndIf

    CurrentAction("Combat ended after: " & StringFormat("%d", TimerDiff($g_h_Vanquisher_FightTimer) / 1000) & "s")
    PingSleep(3000)
    If Map_GetInstanceInfo("IsLoading") Or Not Map_GetInstanceInfo("IsExplorable") Then
        _Vanquisher_ResetCombatState("skip loot after zoning")
        Return
    EndIf
    CurrentAction("Picking up items")
    PickUpLoot()
    _Vanquisher_ResetCombatState()
EndFunc   ;==>Fight
