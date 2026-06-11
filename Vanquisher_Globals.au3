#include-once
; Master Vanquisher globals loaded before GwAu3_AddOns.au3 (avoid duplicate constant errors)

Global Enum $INSTANCETYPE_OUTPOST = 0, $INSTANCETYPE_EXPLORABLE, $INSTANCETYPE_LOADING

Global $intSkillEnergy[8] = [15, 15, 5, 5, 10, 15, 10, 5]
Global $intSkillCastTime[8] = [1000, 1000, 750, 750, 1000, 1000, 1000, 250]
Global $intSkillAdrenaline[8] = [0, 0, 0, 0, 0, 0, 0, 0]
Global $totalskills = 7

Global Enum $BAG_Backpack = 1, $BAG_BeltPouch, $BAG_Bag1, $BAG_Bag2, $BAG_EquipmentPack, $BAG_UnclaimedItems = 7, $BAG_Storage1, $BAG_Storage2, _
        $BAG_Storage3, $BAG_Storage4, $BAG_StorageAnniversary, $BAG_Storage5, $BAG_Storage6, $BAG_Storage7, $BAG_Storage8

Global Enum $HERO_Norgu = 1, $HERO_Goren, $HERO_Tahlkora, $HERO_MasterOfWhispers, $HERO_AcolyteJin, $HERO_Koss, $HERO_Dunkoro, $HERO_AcolyteSousuke, $HERO_Melonni, _
        $HERO_ZhedShadowhoof, $HERO_GeneralMorgahn, $HERO_MargridTheSly, $HERO_Olias = 14, $HERO_Razah, $HERO_MOX, $HERO_Jora = 18, $HERO_PyreFierceshot, _
        $HERO_Livia = 21, $HERO_Hayda, $HERO_Kahmu, $HERO_Gwen, $HERO_Xandra, $HERO_Vekk, $HERO_Ogden
Global Enum $HERO_MercenaryHero1 = 28, $HERO_MercenaryHero2 = 29, $HERO_MercenaryHero3 = 30, $HERO_MercenaryHero4 = 31, $HERO_MercenaryHero5 = 32, $HERO_MercenaryHero6 = 33, $HERO_MercenaryHero7 = 34, $HERO_MercenaryHero8 = 35

; Standard loot pickup defaults (used by GwAu3_AddOns CanPickUp)
Global $isGoldPickup = True
Global $isPurplePickup = True
Global $isBluePickup = True
Global $isWhitePickup = False
Global $isBlackPickup = True
Global $isOtherPickup = False
Global $isCollPickup = True
Global $isPconsPickup = True
Global $isCSalvPickup = True
Global $isCBagPickup = True

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

Global Const $VANQUISHER_BU_MODEL_IDS[] = [28432, 22269, 28431, 28436, 17061, 22752, 35121]
Global Const $VANQUISHER_STONE_MODEL_IDS[] = [30209, 37810]
Global Const $VANQUISHER_STONE_INTERVAL = 600000

; Crash-safe file log path (set from GUI.au3 when the Trace file is created)
Global $g_s_LogFile = @ScriptDir & "\Trace\Vanquisher.log"
Global $g_h_EditText = 0
