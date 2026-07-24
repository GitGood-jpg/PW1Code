.thumb

#include "settings.h"

#if ADD_FAIRY_TYPE

.equ TypeCount, 0x12
.equ NewTagStart, 0x20

.type THUMB_BRANCH_LINK_255_0x21CF574, %function

@ TYPE_NULL redefinitions

#if !GEN6_CRIT && !EXPAND_FIELD_EFFECTS
FULL_COPY_ServerEvent_CalcDamage_0x13A:
    .byte 0x12, 0x2A @ cmp r2, #TypeCount
    .byte 0x08, 0xDA @ bge #0x14
    .size FULL_COPY_ServerEvent_CalcDamage_0x13A, . - FULL_COPY_ServerEvent_CalcDamage_0x13A
#endif // !GEN6_CRIT && !EXPAND_FIELD_EFFECTS

FULL_COPY_splitTypeCore_0x1C:
    .byte 0x12, 0x21 @ movs r1, #TypeCount
    .size FULL_COPY_splitTypeCore_0x1C, . - FULL_COPY_splitTypeCore_0x1C

FULL_COPY_splitTypeCore_0x2E:
    .byte 0x12, 0x20 @ movs r0, #TypeCount
    .size FULL_COPY_splitTypeCore_0x2E, . - FULL_COPY_splitTypeCore_0x2E

FULL_COPY_splitTypeCore_0x3A:
    .byte 0x12, 0x29 @ cmp r1, #TypeCount
    .byte 0x06, 0xDB @ blt #0x10
    .byte 0x12, 0x28 @ cmp r0, #TypeCount
    .byte 0x01, 0xDB @ blt #0x6
    .size FULL_COPY_splitTypeCore_0x3A, . - FULL_COPY_splitTypeCore_0x3A

FULL_COPY_splitTypeCore_0x4C:
    .byte 0x12, 0x28 @ cmp r0, #TypeCount
    .byte 0x00, 0xDB @ blt #0x4
    .size FULL_COPY_splitTypeCore_0x4C, . - FULL_COPY_splitTypeCore_0x4C

FULL_COPY_ServerEvent_CheckMoveDamageEffectiveness_0x12:
    .byte 0x12, 0x28 @ cmp r0, #TypeCount
    .byte 0x02, 0xDB @ blt #0x8
    .size FULL_COPY_ServerEvent_CheckMoveDamageEffectiveness_0x12, . - FULL_COPY_ServerEvent_CheckMoveDamageEffectiveness_0x12

#if !EXPAND_MOVES
FULL_COPY_BattleMon_HasType_0x6:
    .byte 0x12, 0x2C @ cmp r4, #TypeCount
    .byte 0x0E, 0xDA @ bge #0x20
    .size FULL_COPY_BattleMon_HasType_0x6, . - FULL_COPY_BattleMon_HasType_0x6
#endif

FULL_COPY_HandlerColorChange_0x36:
    .byte 0x12, 0x2E @ cmp r6, #TypeCount
    .size FULL_COPY_HandlerColorChange_0x36, . - FULL_COPY_HandlerColorChange_0x36

FULL_COPY_HandlerConversion2_0x2C:
    .byte 0x12, 0x2C @ cmp r4, #TypeCount
    .byte 0x3C, 0xDA @ bge #0x7c
    .byte 0x00, 0x98 @ ldr r0, [sp]
    .byte 0x12, 0x21 @ movs r1, #TypeCount
    .size FULL_COPY_HandlerConversion2_0x2C, . - FULL_COPY_HandlerConversion2_0x2C
	
@ W1: battle-overlay is 93 (167 is W2). A number in front of a symbol parses wrong → PURE SYMBOL,
@ which resolves to ov93 via ESDB.
FULL_COPY_BattleHandler_Transform_0xB4:
    .byte 0x12, 0x21 @ movs r1, #TypeCount
    .size FULL_COPY_BattleHandler_Transform_0xB4, . - FULL_COPY_BattleHandler_Transform_0xB4

@ BluRoses PC screen fix
FULL_COPY_255_0x21C2A50:
    .word 0xA700
    .size FULL_COPY_255_0x21C2A50, . - FULL_COPY_255_0x21C2A50

FULL_COPY_255_0x21D0846:
    cmp r4, #TypeCount
    .size FULL_COPY_255_0x21D0846, . - FULL_COPY_255_0x21D0846

FULL_COPY_255_0x21D09AC:
    .word 0xA5BC
    .size FULL_COPY_255_0x21D09AC, . - FULL_COPY_255_0x21D09AC

FULL_COPY_255_0x21D0A00:
    add r1, #NewTagStart
    .size FULL_COPY_255_0x21D0A00, . - FULL_COPY_255_0x21D0A00

FULL_COPY_255_0x21D0A0A:
    cmp r4, #TypeCount
    .size FULL_COPY_255_0x21D0A0A, . - FULL_COPY_255_0x21D0A0A

THUMB_BRANCH_LINK_255_0x21CF574:
    push {r2-r3, lr}
    ldr r1, =0xA0DC
    add r2, r1
    sub r2, r4
    ldr r3, =0xA268
    cmp r2, r3
    blt keep_r1_A0DC
    ldr r3, =0xA2AC
    cmp r2, r3
    bhi keep_r1_A0DC
    ldr r1, =0xA5BC-0x18C
keep_r1_A0DC:
    ldr r0, =0x9E94
    pop {r2-r3, pc}
   .size THUMB_BRANCH_LINK_255_0x21CF574, . - THUMB_BRANCH_LINK_255_0x21CF574
 
FULL_COPY_255_0x21BF2F0:
    mov r4, #NewTagStart
    .size FULL_COPY_255_0x21BF2F0, . - FULL_COPY_255_0x21BF2F0

FULL_COPY_255_0x21BF300:
    cmp r4, #(NewTagStart + TypeCount)
    .size FULL_COPY_255_0x21BF300, . - FULL_COPY_255_0x21BF300

FULL_COPY_255_0x21D0A6E:
    mov r4, #NewTagStart
    .size FULL_COPY_255_0x21D0A6E, . - FULL_COPY_255_0x21D0A6E

FULL_COPY_255_0x21D0A7E:
    cmp r4, #(NewTagStart + TypeCount)
    .size FULL_COPY_255_0x21D0A7E, . - FULL_COPY_255_0x21D0A7E

FULL_COPY_255_0x21D0A22:
    add r7, #NewTagStart
    .size FULL_COPY_255_0x21D0A22, . - FULL_COPY_255_0x21D0A22

FULL_COPY_255_0x21D0A4A:
    add r4, #NewTagStart
    .size FULL_COPY_255_0x21D0A4A, . - FULL_COPY_255_0x21D0A4A

@ BluRoses Hall of Fame fix
FULL_COPY_255_0x0219B908:
    @ TYPE_NORMAL   
    .word 0x2D
    @ TYPE_FIGHTING 
    .word 0x26
    @ TYPE_FLYING   
    .word 0x28
    @ TYPE_POISON   
    .word 0x2E
    @ TYPE_GROUND   
    .word 0x2B
    @ TYPE_ROCK     
    .word 0x30
    @ TYPE_BUG      
    .word 0x22
    @ TYPE_GHOST    
    .word 0x29
    @ TYPE_STEEL    
    .word 0x31
    @ TYPE_FIRE     
    .word 0x27
    @ TYPE_WATER    
    .word 0x32
    @ TYPE_GRASS    
    .word 0x2A
    @ TYPE_ELECTRIC 
    .word 0x25
    @ TYPE_PSYCHIC  
    .word 0x2F
    @ TYPE_ICE      
    .word 0x2C
    @ TYPE_DRAGON   
    .word 0x24
    @ TYPE_DARK     
    .word 0x23
    @ TYPE_FAIRY. TODO: Make SPA for this guy, currently loads the same as NORMAL.
    .word 0x2D 
    .size FULL_COPY_255_0x0219B908, . - FULL_COPY_255_0x0219B908

FULL_COPY_265_0x219BADC:
    .word 4
    .size FULL_COPY_265_0x219BADC, . - FULL_COPY_265_0x219BADC

FULL_COPY_265_0x219BB1C:
    .word 0
    .size FULL_COPY_265_0x219BB1C, . - FULL_COPY_265_0x219BB1C

@ Summary Screen Fixes?
FULL_COPY_207_0x021B5110:
    lsl r2, #0x11
    .size FULL_COPY_207_0x021B5110, . - FULL_COPY_207_0x021B5110
FULL_COPY_207_0x021B511A:
    mov r1, #0xB0
    .size FULL_COPY_207_0x021B511A, . - FULL_COPY_207_0x021B511A
FULL_COPY_207_0x021B5126:
    mov r2, #0xB0
    .size FULL_COPY_207_0x021B5126, . - FULL_COPY_207_0x021B5126
FULL_COPY_207_0x021B3A5A:
    cmp r4, #TypeCount
    .size FULL_COPY_207_0x021B3A5A, . - FULL_COPY_207_0x021B3A5A
FULL_COPY_207_0x021B3A32:
    add r0, #(0x264 - 0x1A0)
    .size FULL_COPY_207_0x021B3A32, . - FULL_COPY_207_0x021B3A32
FULL_COPY_207_0x021B6BF0:
    add r1, r6, r0
    mov r0, #(0x264 >> 2)
    lsl r0, #2
    ldr r0, [r1, r0]
    .size FULL_COPY_207_0x021B6BF0, . - FULL_COPY_207_0x021B6BF0
FULL_COPY_207_0x021B6C5C:
    mov r0, #(0x264 >> 2)
    lsl r0, #2
    add r5, sp, #0x24
    nop // one extra instruction pog
    .size FULL_COPY_207_0x021B6C5C, . - FULL_COPY_207_0x021B6C5C
FULL_COPY_207_0x021B8EE0:
    mov r0, #(0x264 >> 2)
    lsl r0, #2
    .size FULL_COPY_207_0x021B8EE0, . - FULL_COPY_207_0x021B8EE0
FULL_COPY_207_0x021B6BE0:
    ldr  r0, [sp, #0x18]
    mov  r1, #0xaf      
    mov  r2, #0         
    mov  r4, #0xaf      
    .size FULL_COPY_207_0x021B6BE0, . - FULL_COPY_207_0x021B6BE0

FULL_COPY_207_0x021B8E68: // patch 3
    add  r5, r0, #0 
    add  r0, r4, #0 
    mov  r1, #0xaf  
    mov  r2, #0     
    .size FULL_COPY_207_0x021B8E68, . - FULL_COPY_207_0x021B8E68

FULL_COPY_207_0x021B8E78:
    lsl  r0, r5, #2
    add  r1, r6, r0
    mov r0, #(0x264 >> 2)
    lsl r0, #2
    .size FULL_COPY_207_0x021B8E78, . - FULL_COPY_207_0x021B8E78

FULL_COPY_207_0x021BA848:
    lsl  r0, r6, #2
    add  r1, r5, r0
    mov r0, #(0x264 >> 2)
    lsl r0, #2
    .size FULL_COPY_207_0x021BA848, . - FULL_COPY_207_0x021BA848

// Change the Fairy type move UI graphic — W1: ov94 (seg 94) off 0x140d4 = runtime 0x0220A654,
// NARC member 222 (a/0/1/1/222 of W1 = Fairy graphic; W2 used 572). Native, replaces the
// OverlayFairyPatch verbatim ov94 0x140d4.
FULL_COPY_94_0x0220A654:
    .word 222
    .size FULL_COPY_94_0x0220A654, . - FULL_COPY_94_0x0220A654

@ Fairy type icons (18th icon, summary screen graphic buffer). On W2 = FULL_COPY_207 (inert on W1,
@ overlay 207 does not exist); on W1 the summary is ov131 (mount 0x021D4260). Translation of the ov131
@ verbatims from OverlayFairyPatch (now removed) → NATIVE hooks. The bytes are the "set" values already verified on W1.
FULL_COPY_131_0x021D4CD4:
    .byte 0x99,0x20,0x08,0x91,0x80,0x00,0x03,0x90
    .size FULL_COPY_131_0x021D4CD4, . - FULL_COPY_131_0x021D4CD4
FULL_COPY_131_0x021D4D00:
    .byte 0x12,0x2c,0xeb,0xd3
    .size FULL_COPY_131_0x021D4D00, . - FULL_COPY_131_0x021D4D00
FULL_COPY_131_0x021D6364:
    .byte 0x52,0x04,0x01,0x26
    .size FULL_COPY_131_0x021D6364, . - FULL_COPY_131_0x021D6364
FULL_COPY_131_0x021D636E:
    .byte 0xb0,0x21,0x20,0x1c
    .size FULL_COPY_131_0x021D636E, . - FULL_COPY_131_0x021D636E
FULL_COPY_131_0x021D637A:
    .byte 0xb0,0x22,0x02,0x90
    .size FULL_COPY_131_0x021D637A, . - FULL_COPY_131_0x021D637A
FULL_COPY_131_0x021D7DAA:
    .byte 0x99,0x20,0x80,0x00
    .size FULL_COPY_131_0x021D7DAA, . - FULL_COPY_131_0x021D7DAA
FULL_COPY_131_0x021D7E14:
    .byte 0x99,0x20,0x80,0x00,0x09,0xad,0xc0,0x46
    .size FULL_COPY_131_0x021D7E14, . - FULL_COPY_131_0x021D7E14
FULL_COPY_131_0x021D9FFC:
    .byte 0x99,0x20,0x80,0x00
    .size FULL_COPY_131_0x021D9FFC, . - FULL_COPY_131_0x021D9FFC
FULL_COPY_131_0x021DA060:
    .byte 0x99,0x20,0x80,0x00
    .size FULL_COPY_131_0x021DA060, . - FULL_COPY_131_0x021DA060
FULL_COPY_131_0x021DB9BC:
    .byte 0x99,0x20,0x80,0x00
    .size FULL_COPY_131_0x021DB9BC, . - FULL_COPY_131_0x021DB9BC

@ Fairy type attribute + PALETTE in arm9 (segment 255 = absolute arm9), from Black1Fairy.Vpatch.
@ Replace the builder's arm9 byte-patches (PmcInject) → all in .S. GetPokemonTypeIconPalette
@ (0x2027604) reads the palette table @0x209FD10 WITHOUT a bound-check; for Fairy (0x209FD21) 0x02 is needed.
@ NB: PW2Code's GetPokemonTypeIconPalette hook does file I/O on every render → freeze on W1, so
@ we patch the TABLE (we don't hook the function).
FULL_COPY_255_0x0209FD09:
    .byte 0x02,0x01,0x01,0x02
    .size FULL_COPY_255_0x0209FD09, . - FULL_COPY_255_0x0209FD09
FULL_COPY_255_0x0209FD21:
    .byte 0x02
    .size FULL_COPY_255_0x0209FD21, . - FULL_COPY_255_0x0209FD21

@ Type count 17->18 in ov93: ONLY symbols (splitTypeCore + the 3 added to the ESDB +
@ BattleHandler_Transform), like on W2 — they resolve to ov93 via ESDB. No raw FULL_COPY_93.

#endif // ADD_FAIRY_TYPE
