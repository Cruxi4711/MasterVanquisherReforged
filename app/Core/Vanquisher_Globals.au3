#include-once
; Master Vanquisher globals loaded before GwAu3_AddOns.au3 (avoid duplicate constant errors)

Global Const $VANQUISHER_APP_DIR = @ScriptDir & "\app"
Global Const $VANQUISHER_CONFIG_DIR = $VANQUISHER_APP_DIR & "\Config"
Global Const $VANQUISHER_HERO_INI = $VANQUISHER_CONFIG_DIR & "\Hero.ini"
Global Const $VANQUISHER_CHAR_INI = $VANQUISHER_CONFIG_DIR & "\Vanquisher.ini"

Global Enum $INSTANCETYPE_OUTPOST = 0, $INSTANCETYPE_EXPLORABLE, $INSTANCETYPE_LOADING

Global Enum $BAG_Backpack = 1, $BAG_BeltPouch, $BAG_Bag1, $BAG_Bag2, $BAG_EquipmentPack, $BAG_UnclaimedItems = 7, $BAG_Storage1, $BAG_Storage2, _
        $BAG_Storage3, $BAG_Storage4, $BAG_StorageAnniversary, $BAG_Storage5, $BAG_Storage6, $BAG_Storage7, $BAG_Storage8

Global Enum $HERO_Norgu = 1, $HERO_Goren, $HERO_Tahlkora, $HERO_MasterOfWhispers, $HERO_AcolyteJin, $HERO_Koss, $HERO_Dunkoro, $HERO_AcolyteSousuke, $HERO_Melonni, _
        $HERO_ZhedShadowhoof, $HERO_GeneralMorgahn, $HERO_MargridTheSly, $HERO_Olias = 14, $HERO_Razah, $HERO_MOX, $HERO_Jora = 18, $HERO_PyreFierceshot, _
        $HERO_Livia = 21, $HERO_Hayda, $HERO_Kahmu, $HERO_Gwen, $HERO_Xandra, $HERO_Vekk, $HERO_Ogden
Global Enum $HERO_MercenaryHero1 = 28, $HERO_MercenaryHero2 = 29, $HERO_MercenaryHero3 = 30, $HERO_MercenaryHero4 = 31, $HERO_MercenaryHero5 = 32, $HERO_MercenaryHero6 = 33, $HERO_MercenaryHero7 = 34, $HERO_MercenaryHero8 = 35

; Standard loot pickup defaults (used by GwAu3_AddOns CanPickUp)
Global $isGoldPickup = True
Global $isPurplePickup = False
Global $isBluePickup = False
Global $isWhiteRarityPickup = False
Global $isWhitePickup = True
Global $isBlackPickup = True
Global $isOtherPickup = False
Global $isCollPickup = False
Global $isCSalvPickup = False
Global $isCBagPickup = False

; Dyes to pickup: black (1670), white (1678)
Global Const $VANQUISHER_DYE_MODEL_IDS[] = [1670, 1678]

; Tomes to pickup [20]
Global Const $VANQUISHER_TOME_MODEL_IDS[] = [21796, 21797, 21798, 21799, 21800, 21801, 21802, 21803, 21804, 21805, 21786, 21787, 21788, 21789, 21790, 21791, 21792, 21793, 21794, 21795]
; Alcohol to pickup [17]
Global Const $VANQUISHER_ALCOHOL_MODEL_IDS[] = [910, 2513, 5585, 6049, 6366, 6367, 6375, 15477, 19171, 22190, 24593, 28435, 30855, 31145, 31146, 35124, 36682]
; Pcons to pickup or use [39]
Global Const $VANQUISHER_PCON_MODEL_IDS[] = [910, 5585, 6366, 6375, 22190, 24593, 28435, 30855, 31145, 35124, 36682, 6376, 21809, 21810, 21813, 36683, 21492, 21812, 22269, 22644, 22752, 28436, 15837, 21490, 30648, 31020, 6370, 21488, 21489, 22191, 26784, 28433, 5656, 18345, 21491, 37765, 21833, 28433, 28434]
; If death occurs use model IDs [6]
Global Const $VANQUISHER_DEATH_MODEL_IDS[] = [6370, 21488, 21489, 22191, 26784, 28433]

Global $OpenedChestAgentIDs[1] = [0]
Global $aChestID[24]
$aChestID[0] = 65   ; Krytan Chest
$aChestID[1] = 66   ; Elonian Chest
$aChestID[2] = 67   ; Maguuma Chest
$aChestID[3] = 68   ; Phantom Chest
$aChestID[4] = 69   ; Ascalonian Chest
$aChestID[5] = 70   ; Miners Chest
$aChestID[6] = 71   ; Steel Chest
$aChestID[7] = 72   ; Shiverpeak Chest
$aChestID[8] = 73   ; Darkstone Chest
$aChestID[9] = 74   ; Obsidian Chest
$aChestID[10] = 4576 ; Forbidden Chest
$aChestID[11] = 4577 ; Kurzick Chest
$aChestID[12] = 4578 ; Stoneroot Chest
$aChestID[13] = 4579 ; Shing Jea Chest
$aChestID[14] = 4580 ; Luxon Chest
$aChestID[15] = 4581 ; Deep Jade Chest
$aChestID[16] = 4582 ; Canthan Chest
$aChestID[17] = 6061 ; Ancient Elonian Chest
$aChestID[18] = 6062 ; Istani Chest
$aChestID[19] = 6063 ; Vabbi Chest
$aChestID[20] = 6064 ; Kournan Chest
$aChestID[21] = 6065 ; Margonite Chest
$aChestID[22] = 7053 ; Demonic Chest
$aChestID[23] = 8141 ; Locked Chest

; Faction guild donation: 5k per deposit packet, start only once 10k+ is held
Global Const $VANQUISHER_FACTION_DONATE_CHUNK = 5000
Global Const $VANQUISHER_FACTION_DONATE_MIN = 10000

; Harvest/event BUs: candy corn, cupcake, candy apple, pie, golden egg, skalefin soup, war supplies
Global Const $VANQUISHER_BU_MODEL_IDS[] = [ _
		$GC_I_MODELID_CANDY_CORN, _
		$GC_I_MODELID_CUPCAKE, _
		$GC_I_MODELID_CANDY_APPLE, _
		$GC_I_MODELID_PUMPKIN_PIE, _
		$GC_I_MODELID_GOLDEN_EGG, _
		$GC_I_MODELID_SKALEFIN_SOUP, _
		$GC_I_MODELID_WAR_SUPPLIES _
]
; Parallel effect skill IDs (0 = no effect tracking, use if item present)
Global Const $VANQUISHER_BU_EFFECT_IDS[] = [ _
		$GC_I_SKILL_ID_CANDY_CORN_SKILL, _
		$GC_I_SKILL_ID_BIRTHDAY_CUPCAKE_SKILL, _
		$GC_I_SKILL_ID_CANDY_APPLE_SKILL, _
		0, _
		$GC_I_SKILL_ID_GOLDEN_EGG_SKILL, _
		0, _
		0 _
]
; All summoning stones from GwAu3 API ($GC_AI_ALL_SUMMONING_STONES)
Global Const $VANQUISHER_STONE_MODEL_IDS[] = [ _
		$GC_I_MODELID_MERCANTILE_SUMMONING_STONE, _
		$GC_I_MODELID_TENGU_SUPPORT_FLARE, _
		$GC_I_MODELID_IMPERIAL_GUARD_REINFORCEMENT_ORDER, _
		$GC_I_MODELID_AUTOMATON_SUMMONING_STONE, _
		$GC_I_MODELID_IGNEOUS_SUMMONING_STONE, _
		$GC_I_MODELID_CHITINOUS_SUMMONING_STONE, _
		$GC_I_MODELID_MYSTICAL_SUMMONING_STONE, _
		$GC_I_MODELID_AMBER_SUMMONING_STONE, _
		$GC_I_MODELID_ARTIC_SUMMONING_STONE, _
		$GC_I_MODELID_DEMONIC_SUMMONING_STONE, _
		$GC_I_MODELID_GELATINOUS_SUMMONING_STONE, _
		$GC_I_MODELID_FOSSILIZED_SUMMONING_STONE, _
		$GC_I_MODELID_JADEITE_SUMMONING_STONE, _
		$GC_I_MODELID_MISCHIEVOUS_SUMMONING_STONE, _
		$GC_I_MODELID_FROSTY_SUMMONING_STONE, _
		$GC_I_MODELID_MYSTERIOUS_SUMMONING_STONE, _
		$GC_I_MODELID_ZAISHEN_SUMMONING_STONE, _
		$GC_I_MODELID_GHASTLY_SUMMONING_STONE, _
		$GC_I_MODELID_CELESTIAL_SUMMONING_STONE, _
		$GC_I_MODELID_SHINING_BLADE_WAR_HORN, _
		$GC_I_MODELID_LEGIONNAIRE_SUMMONING_STONE _
]
Global Const $VANQUISHER_CONSUMABLE_BUFFER_MS = 1800000 ; 30 min between stone summons while pet is alive
Global Const $VANQUISHER_CONSUMABLE_DEBOUNCE_MS = 5000 ; short anti-spam after use while effect applies
Global Const $VANQUISHER_CONSUMABLE_POLL_MS = 10000 ; check effects every 10s during movement (not every tick)
Global Const $VANQUISHER_REZ_COMBAT_WAIT_MS = 30000 ; max wait for party rez during aggro movement
Global Const $VANQUISHER_STONE_INTERVAL = $VANQUISHER_CONSUMABLE_BUFFER_MS
Global $g_h_Vanquisher_FightTimer = 0
Global $g_h_Vanquisher_ConsumablePollTimer = 0
Global $g_h_Vanquisher_StoneTimer = 0
Global $g_a_Vanquisher_BULastUsed[7]
Global $g_a_Vanquisher_BUUsedThisZone[7]
Global $g_a_Vanquisher_ConsetLastUsed[3]

Global $g_h_EditText = 0

; Legacy GWA/GWAPI names still referenced by some launcher builds (e.g. Gw2Auto_Reforged.au3)
Global $nHandle = 0
Global $nPID = 0

; Vanquish baseline on zone-in (foes remaining/killed when entering the explorable)
Global $g_i_Vanquisher_InitialFoesToKill = -1
Global $g_i_Vanquisher_InitialFoesKilled = 0
Global $g_b_Vanquisher_CounterUnreliable = False
Global $g_i_Vanquisher_SessionStartKilled = 0
Global $g_b_Vanquisher_HasRunRoute = False
Global $g_b_Vanquisher_RunFinished = False
Global $g_b_Vanquisher_AbortRoute = False
Global $g_b_Vanquisher_DeathResignPending = False
Global $g_b_Vanquisher_CombatAIReady = False
Global $g_b_Vanquisher_CombatStateActive = False
Global $g_s_Vanquisher_CombatGroupLabel = ""
Global $g_b_Vanquisher_TransitOnly = False
Global $g_i_Vanquisher_GoOutLastMapHandled = -1
Global $g_i_TearsRoute_LastMapHandled = -1
Global $g_i_StingrayRoute_LastMapHandled = -1
Global $g_i_CrystalOverlookRoute_LastMapHandled = -1

Global $g_s_LogFile = @ScriptDir & "\Trace\Vanquisher.log"

Global $g_b_Vanquisher_DeathReturnToCheckpoint = False
Global $g_i_GriffonsMouthRoute_LastMapHandled = -1
Global $g_i_IronHorseMineRoute_LastMapHandled = -1
Global $g_i_TravelersValeRoute_LastMapHandled = -1
Global $g_i_ReedBogRoute_LastMapHandled = -1
Global $g_i_TheFallsRoute_LastMapHandled = -1
Global $g_i_DryTopRoute_LastMapHandled = -1
Global $g_i_TalmarkWildernessRoute_LastMapHandled = -1
Global $g_i_MajestysRestRoute_LastMapHandled = -1
Global $g_i_KessexPeakRoute_LastMapHandled = -1
Global $g_i_CursedLandsRoute_LastMapHandled = -1
Global $g_i_NeboTerraceRoute_LastMapHandled = -1
Global $g_i_MineralSpringsRoute_LastMapHandled = -1
Global $g_i_LornarsPassRoute_LastMapHandled = -1
Global $g_i_IcedomeRoute_LastMapHandled = -1
Global $g_i_DreadnoughtsDriftRoute_LastMapHandled = -1
Global $g_i_MamnoonLagoonRoute_LastMapHandled = -1
Global $g_i_TheAridSeaRoute_LastMapHandled = -1
Global $g_i_AscalonFoothillsRoute_LastMapHandled = -1
Global $g_i_DiessaLowlandsRoute_LastMapHandled = -1
Global $g_i_DragonsGulletRoute_LastMapHandled = -1
Global $g_i_FlameTempleCorridorRoute_LastMapHandled = -1
Global $g_i_SacnothValleyRoute_LastMapHandled = -1

Global $g_b_Vanquisher_RecoverMidRun = False
Global Const $VANQUISHER_BLOCK_COUNT_MAX = 35

Global $g_s_Vanquisher_DeathCheckpointIni = @ScriptDir & "\Trace\VanquisherDeath.ini"
Global $g_s_Vanquisher_ProgressIni = @ScriptDir & "\Trace\VanquisherProgress.ini"
Global $g_i_Vanquisher_ProgressFloorIndex = -1
Global $g_s_Vanquisher_ProgressPhase = ""
Global $g_b_Vanquisher_SkipForwardRoute = False

Global Const $VANQUISHER_DEATH_RETURN_ARRIVAL_DIST = 2000
Global Const $VANQUISHER_REZ_WAIT_MS = 60000
Global $g_b_Vanquisher_DeathReturnActive = False
Global $g_i_Vanquisher_DeathReturnUntilIndex = -1
Global $g_f_Vanquisher_DeathTargetX = 0
Global $g_f_Vanquisher_DeathTargetY = 0

Global $g_f_Vanquisher_ProgressX = 0
Global $g_f_Vanquisher_ProgressY = 0
Global $g_i_Vanquisher_ProgressRouteSize = -1
Global $g_b_Vanquisher_WipeRecoveryPending = False
Global $g_i_Vanquisher_CurrentRouteIndex = -1

Global $g_b_Vanquisher_PostRezBacktrackNeeded = False
Global $g_i_Vanquisher_PostRezBacktrackFromIndex = -1
Global $g_b_Vanquisher_PostRezForwardNeeded = False
Global $g_i_Vanquisher_PostRezForwardFromIndex = -1
Global $g_i_Vanquisher_PostRezForwardToIndex = -1

Global $g_b_Vanquisher_ShrineRecoveryActive = False
Global $g_b_Vanquisher_LastPlayerDead = False
Global $g_i_Vanquisher_LastDeathPenalty = -1
Global $g_i_Vanquisher_JumpToWaypointIndex = -1
Global $g_i_Vanquisher_ShrineGapFillUntilIndex = -1
Global $g_ai2_Vanquisher_ActiveWaypoints[0][0]

Global Const $VANQUISHER_COMBAT_STALL_MS = 90000
Global Const $VANQUISHER_COMBAT_HARD_CAP_MS = 120000
Global Const $VANQUISHER_COMBAT_TARGET_HP_STALL_MS = 30000
Global Const $VANQUISHER_COMBAT_FIGHT_DRIFT = 800
Global $g_h_Vanquisher_CombatFightTimer = 0
Global $g_h_Vanquisher_CombatStallTimer = 0
Global $g_h_Vanquisher_CombatTargetHPTimer = 0
Global $g_i_Vanquisher_CombatLastKilled = 0
Global $g_f_Vanquisher_CombatLastX = 0
Global $g_f_Vanquisher_CombatLastY = 0
Global $g_f_Vanquisher_CombatLastTargetHP = -1
Global $g_i_Vanquisher_CombatAggroRange = 1450

Global Const $VANQUISHER_MAP_STALL_TIMEOUT_MS = 14400000
Global Const $VANQUISHER_MAP_PROGRESS_STALL_MS = 5400000
Global Const $VANQUISHER_MAP_MAX_DEFER_ATTEMPTS = 5
Global Const $VANQUISHER_ALL_STALLED_PAUSE_MS = 600000

Global Const $VANQUISHER_STRAGGLER_THRESHOLD = 3
Global Const $VANQUISHER_STRAGGLER_MAX_ATTEMPTS = 3
Global $g_h_Vanquisher_MapAttemptTimer = 0
Global $g_h_Vanquisher_MapProgressTimer = 0
Global $g_i_Vanquisher_MapAttemptKilledBaseline = 0
Global $g_b_Vanquisher_FreshFarmEntry = False
Global $g_b_Vanquisher_StragglerHuntFailed = False
