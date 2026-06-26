
Func _Vanquisher_FightExitCallback()
    If $g_h_Vanquisher_FightTimer <> 0 And TimerDiff($g_h_Vanquisher_FightTimer) > 120000 Then Return True
    If $DeadOnTheRun Or $g_b_Vanquisher_AbortRoute Then Return True
    If Not $g_b_Vanquisher_TransitOnly And _Vanquisher_IsVanquishComplete() Then Return True
    Return False
EndFunc

Func Fight($a_i_AggroRange, $a_s_Label = "")
    CurrentAction("Fighting Group #:" & $a_s_Label)
    If GetPartyDead() Then Return

    _Vanquisher_InitCombatAI()
    If Not $g_b_Vanquisher_CombatAIReady Then Return

    $g_h_Vanquisher_FightTimer = TimerInit()
    Local $l_f_AnchorX = Agent_GetAgentInfo(-2, "X")
    Local $l_f_AnchorY = Agent_GetAgentInfo(-2, "Y")

    UAI_UpdateCache($a_i_AggroRange)
    UAI_Fight($l_f_AnchorX, $l_f_AnchorY, $a_i_AggroRange, 3500, $g_i_FinisherMode, True, 0, False, "_Vanquisher_FightExitCallback")

    UpdateVanquish()
    If Not $g_b_Vanquisher_TransitOnly And _Vanquisher_IsVanquishComplete() Then
        _Vanquisher_OnVanquishComplete(" (fight)")
        Return
    EndIf
    If $g_b_Vanquisher_AbortRoute Then Return

    CurrentAction("Combat ended after: " & StringFormat("%d", TimerDiff($g_h_Vanquisher_FightTimer) / 1000) & "s")
    PingSleep(3000)
    CurrentAction("Picking up items")
    PickUpLoot()
EndFunc   ;==>Fight
