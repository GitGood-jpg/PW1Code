.thumb

#include "settings.h"

#if GEN7_INFILTRATOR
.type THUMB_BRANCH_LINK_CALCDMG_Set_0xFA, %function
#endif
#if EXPAND_MOVES
.type THUMB_BRANCH_LINK_LoadAnimationScriptFile_0xB6, %function
.type THUMB_BRANCH_LINK_BtlvEffect_LoadAnimationScript_0x1A, %function
.type THUMB_BRANCH_LINK_MoveAnimLoadW1_0xC6, %function
#endif

#if WEATHER_ABILITY_TURNS != 255

@ This changes the amount of turns weather will last after being summoned by an ability
FULL_COPY_CommonWeatherChangeAbility_0x2A:
    movs    r0, #WEATHER_ABILITY_TURNS
    .size FULL_COPY_CommonWeatherChangeAbility_0x2A, . - FULL_COPY_CommonWeatherChangeAbility_0x2A

#endif // WEATHER_ABILITY_TURNS != 255

#if EXPAND_FIELD_EFFECTS
 
FULL_COPY_BattleHandler_RemoveSideEffectCore_0x58:
    cmp     r4, #MAX_SIDE_EFFECT_AMOUNT
    .size FULL_COPY_BattleHandler_RemoveSideEffectCore_0x58, . - FULL_COPY_BattleHandler_RemoveSideEffectCore_0x58
 
#endif // EXPAND_FIELD_EFFECTS

#if SNOW_WEATHER

@ This prevents any Pokemon from taking hail/snow damage
FULL_COPY_CalcWeatherDamage_0xE:
    nop
    movs    r0, #1
    .size FULL_COPY_CalcWeatherDamage_0xE, . - FULL_COPY_CalcWeatherDamage_0xE

#endif // SNOW_WEATHER

#if EXPAND_ABILITIES || ADD_MEGA_EVOLUTION

@ Remove the if statements that check for Unnerve and add the checked ability as 
@ the third function parameter so that Unnerve and As One can be checked check inside 
@ the ServerControl_UnnerveAction function
FULL_COPY_ServerControl_AddCondition_0x132:
    nop
    movs    r2, r0
    .size FULL_COPY_ServerControl_AddCondition_0x132, . - FULL_COPY_ServerControl_AddCondition_0x132

FULL_COPY_ServerDisplay_SkillSwap_0x148:
    nop
    movs    r2, r4
    .size FULL_COPY_ServerDisplay_SkillSwap_0x148, . - FULL_COPY_ServerDisplay_SkillSwap_0x148

FULL_COPY_ServerDisplay_SkillSwap_0x16E:
    nop
    movs    r2, r6
    .size FULL_COPY_ServerDisplay_SkillSwap_0x16E, . - FULL_COPY_ServerDisplay_SkillSwap_0x16E

FULL_COPY_ServerControl_ClearMonDependentEffects_0xB6:
    nop
    movs    r2, r0
    .size FULL_COPY_ServerControl_ClearMonDependentEffects_0xB6, . - FULL_COPY_ServerControl_ClearMonDependentEffects_0xB6

FULL_COPY_BattleHandler_ChangeAbility_0x126:
    nop
    movs    r2, r6
    .size FULL_COPY_BattleHandler_ChangeAbility_0x126, . - FULL_COPY_BattleHandler_ChangeAbility_0x126

#endif // EXPAND_ABILITIES || ADD_MEGA_EVOLUTION

#if GEN7_WEAK_ARMOR

FULL_COPY_HandlerWeakArmor_0x9E:
    strb    r7, [r1,#0xC]
    .size FULL_COPY_HandlerWeakArmor_0x9E, . - FULL_COPY_HandlerWeakArmor_0x9E

#endif // GEN7_WEAK_ARMOR

#if GEN8_MOODY

FULL_COPY_HandlerMoody_0x76:
    cmp r5, #5
    .size FULL_COPY_HandlerMoody_0x76, . - FULL_COPY_HandlerMoody_0x76

#endif // GEN8_MOODY

#if GEN7_INFILTRATOR

THUMB_BRANCH_LINK_CALCDMG_Set_0xFA:
    ldr     r3, [sp,#0x18]  @ attackingMon
    push    {r7, lr}
    movs    r7, r0
    movs    r0, r3
    movs    r1, #0x11       @ VALUE_EFFECTIVE_ABILITY
    bl      BattleMon_GetValue
    cmp     r0, #151        @ ABIL_INFILTRATOR
    bne     Check_Substitute
    movs    r0, #0
    b       Exit_CALCDMG_Set
Check_Substitute:
    movs    r0, r7          @ targetMon
    bl      BattleMon_IsSubstituteActive
Exit_CALCDMG_Set:
    pop     {r7, pc}
    .size THUMB_BRANCH_LINK_CALCDMG_Set_0xFA, . - THUMB_BRANCH_LINK_CALCDMG_Set_0xFA

#endif // GEN7_INFILTRATOR

#if EXPAND_ITEMS

FULL_COPY_HandlerDrySkinWeather_0x1A:
    movs    r0, r5
    .size FULL_COPY_HandlerDrySkinWeather_0x1A, . - FULL_COPY_HandlerDrySkinWeather_0x1A

FULL_COPY_HandlerSolarPowerWeather_0x12:
    movs    r0, r5
    .size FULL_COPY_HandlerSolarPowerWeather_0x12, . - FULL_COPY_HandlerSolarPowerWeather_0x12

FULL_COPY_HandlerSolarPowerPower_0x12:
    movs    r1, r5
    .size FULL_COPY_HandlerSolarPowerPower_0x12, . - FULL_COPY_HandlerSolarPowerPower_0x12

FULL_COPY_BattleHandler_ChangeAbility_0x10:
    movs    r1, r5
    .size FULL_COPY_BattleHandler_ChangeAbility_0x10, . - FULL_COPY_BattleHandler_ChangeAbility_0x10

FULL_COPY_ServerDisplay_SkillSwap_0x14:
    movs    r1, r5
    .size FULL_COPY_ServerDisplay_SkillSwap_0x14, . - FULL_COPY_ServerDisplay_SkillSwap_0x14

FULL_COPY_ServerDisplay_SkillSwap_0x1E:
    movs    r1, r5
    .size FULL_COPY_ServerDisplay_SkillSwap_0x1E, . - FULL_COPY_ServerDisplay_SkillSwap_0x1E

#endif // EXPAND_ITEMS

#if ADD_MEGA_EVOLUTION || (EXPAND_ABILITIES && EXPAND_ITEMS)

FULL_COPY_HandlerTrick_0x6C:
    nop
    .size FULL_COPY_HandlerTrick_0x6C, . - FULL_COPY_HandlerTrick_0x6C

FULL_COPY_HandlerTrick_0x82:
    ldr r0, [sp,#0x4]
    .size FULL_COPY_HandlerTrick_0x82, . - FULL_COPY_HandlerTrick_0x82

FULL_COPY_HandlerTrick_0x9A:
    ldr r0, [sp,#0x4]
    .size FULL_COPY_HandlerTrick_0x9A, . - FULL_COPY_HandlerTrick_0x9A

FULL_COPY_HandlerBestow_0x66:
    nop
    .size FULL_COPY_HandlerBestow_0x66, . - FULL_COPY_HandlerBestow_0x66

FULL_COPY_HandlerCommon_CheckUnchangeableItem_0x18:
    movs r0, r5
    .size FULL_COPY_HandlerCommon_CheckUnchangeableItem_0x18, . - FULL_COPY_HandlerCommon_CheckUnchangeableItem_0x18

FULL_COPY_HandlerCommon_CheckIfCanStealPokeItem_0x4A:
    movs r0, r4
    .size FULL_COPY_HandlerCommon_CheckIfCanStealPokeItem_0x4A, . - FULL_COPY_HandlerCommon_CheckIfCanStealPokeItem_0x4A

#endif // ADD_MEGA_EVOLUTION || (EXPAND_ABILITIES && EXPAND_ITEMS)

#if EXPAND_MOVES

THUMB_BRANCH_LINK_LoadAnimationScriptFile_0xB6:
    push    {lr}
    ldr     r3, =0x7FFF
    cmp     r1, r0
    blt     Load_Move_Animation
    ldr     r0, =FIRST_NEW_MOVE
    cmp     r1, r0
    bge     Load_New_Move_Animation
    movs    r1, #1
    b       Return_LoadAnimationScriptFile
Load_New_Move_Animation:
    sub     r6, #BATTLE_ANIMATIONS_COUNT
Load_Move_Animation:
    movs    r1, #0
Return_LoadAnimationScriptFile:
    movs    r0, #1
    cmp     r1, r0
    pop     {pc}
    .size THUMB_BRANCH_LINK_LoadAnimationScriptFile_0xB6, . - THUMB_BRANCH_LINK_LoadAnimationScriptFile_0xB6

THUMB_BRANCH_LINK_BtlvEffect_LoadAnimationScript_0x1A:
    push    {r6, r7, lr}
    ldr     r3, =0x7FFF
    cmp     r4, r0
    blt     Load_Move_Animation_2
    ldr     r0, =FIRST_NEW_MOVE
    cmp     r4, r0
    bge     Load_Move_Animation_2
    movs    r6, #1
    b       Return_BtlvEffect_LoadAnimationScript
Load_New_Move_Animation_2:
    sub     r4, #BATTLE_ANIMATIONS_COUNT
Load_Move_Animation_2:
    movs    r6, #0
Return_BtlvEffect_LoadAnimationScript:
    movs    r7, #1
    cmp     r6, r7
    pop     {r6, r7, pc}
    .size THUMB_BRANCH_LINK_BtlvEffect_LoadAnimationScript_0x1A, . - THUMB_BRANCH_LINK_BtlvEffect_LoadAnimationScript_0x1A

@ ============================================================================
@ White 1 — new-move animations DECOUPLING (editable, no corruption).
@ MoveEffect_Start shows Pound (moveID 1) to the system and saves the real moveID in g_animMoveID.
@ The system (including the effect layer) treats everything as Pound (safe), BUT here, on the if branch of
@ FUN_021f9518 (0x21f9518+0xC6 = 0x21f95de), we redirect the archive-index of the main a066 load
@ to g_animMoveID (the real move) → editable a066[moveID] visual.
@ Replaces 'adds r1,r6,#0' (r1=index=moveID=1) + 'ands r2,r3' (@0x21f95de, 4 bytes). lr=0x21f95e2.
@ Preserve r0(=0x42 a066), r3(flags), r6, r4, r5. r1/r2 are the ones in play here.
THUMB_BRANCH_LINK_MoveAnimLoadW1_0xC6:
    ldr     r1, =g_animMoveID
    ldrh    r1, [r1]              @ r1 = g_animMoveID (0 if vanilla/real-Pound)
    cmp     r1, #0
    bne     1f                    @ != 0 → r1 = real moveID (a066[real] redirection)
    movs    r1, r6                @ otherwise r1 = r6 (normal moveID, as original)
1:  and     r2, r3                @ rebuilds the instruction eaten by the bl (r2 = puVar2[0x8e] & r3)
    bx      lr
    .size THUMB_BRANCH_LINK_MoveAnimLoadW1_0xC6, . - THUMB_BRANCH_LINK_MoveAnimLoadW1_0xC6
    .ltorg

#endif // EXPAND_MOVES

#if GEN6_CRIT

FULL_COPY_167_0x21D74E0:
    .byte 16
    .byte 8
    .byte 2
    .byte 1
    .byte 1
    .size FULL_COPY_167_0x21D74E0, . - FULL_COPY_167_0x21D74E0

#endif // GEN6_CRIT

@ ============================================================================
@ ★★ Jul 12 — the bug#7 fix (arm9 0x02078D8F: beq→b) has been MOVED BACK to
@ PmcInject.arm9BytePatches and must NOT return here. It's not a matter of style:
@
@ PMC marks RESIDENT (= never unloaded) any module that links the ARM9:
@     IsOvlIDResident(id) := id == OVLID_ARM9_RESERVE || id == OVLID_ARM7_RESERVE
@     ModuleState constructor: if (!IsResident()) UnloadExecutable();
@ A FULL_COPY_255 (segment 255 = arm9) in here made the BattleUpgrade resident → its
@ imports toward the Library were resolved ONLY ONCE at boot (LoadExecutable→LinkModuleNames).
@ But the Library modules load/unload continuously and the PMC heap reuses the slots → at battle N the
@ DLL is at a DIFFERENT address, while moveEventAddTableExt[].func still points to the old one →
@ data abort → exception handler in a loop = the "moves freeze after several battles".
@ Proof (savestate): crash PC 0x02236696 = 10 bytes BEYOND the end of the 612B module @0x02236428.
@
@ Without the arm9 patch here, the BattleUpgrade goes back to overlay-only → NOT resident → reloaded and re-linked
@ at every battle (as on W2) → fresh imports and zeroed globals (also fixes megaEvolveFlag).
@ ⚠️ Do NOT add FULL_COPY_255 / arm9 symbols in this module.
