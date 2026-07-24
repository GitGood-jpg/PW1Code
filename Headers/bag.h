#ifndef __BIG_BAG_STRUCT_TEMP_H
#define __BIG_BAG_STRUCT_TEMP_H
// THIS STRUCT IS STILL VERY UNDER RESEARCH, NAME IS TEMPORARY

#include "defs.h"

#include "items.h"
#include "msg_data.h"

#include "save/savedata_bag.h"

#define TCBManagerEx u32

struct GameData;
struct TCB;

// [W1] Layout adapted to White 1 (20 Jul). In White 2 `actionsBlocked` is at
// 0x14; in W1 it is at 0xC — verified on the disassembly
// (`PlayerActionPerms_IsActionBlocked` 0x0200c105 does `ldrb r0,[r0+r1+0xC]`,
// confirmed by the Ghidra decompile). The two u32 field_C/field_10 of W2 do not
// exist in W1.
struct SWAN_ALIGNED(4) PlayerActionPerms
{
    u8 char0;
    u8 gap1[3];
    PlayerExState playerSpecialState;   // 0x4
    u16 followFlagState;                // 0x8
    u8 gapA[2];                         // 0xA
    u8 actionsBlocked[12];              // 0xC  (W2: 0x14)
};

struct SWAN_ALIGNED(8) Bag
{
    GameData* gameData;
    BagSaveData* bagSaveData_4;
    void* void_ptr_8;
    PlayerActionPerms* playerActionPerms;
    u32 field_10;
    u32 field_14;
    BagSaveData* bagSaveData;
    u8 gap1C[8];
    BagSaveData* bagSaveData_24;
    BagItem bagitem_ptrs_28[3];
    u8 field_34[1224];          // [W1] was 1228: brings msgData from 0x520 to 0x51C
    u32(*function_4FC)(u32);
    u8* u8_ptr_504;
    u16 field_508;
    u8 field_506[10];
    u32 field_510;
    u32* u32_ptr_514;
    u32 field_518;
    MsgData* msgData;
    WordSetSystem* wordSetSystem;
    StrBuf* strBuf1;
    StrBuf* strBuf2;
    StrBuf* strBuf_530;
    u32 int_534;
    u8 field_538[16];           // [W1] was 20: brings heapID from 0x54C to 0x544
    u16 heapID;
    u8 field_54E[266];          // [W1] was 342: brings itemID_8A0 from 0x8A0 to 0x84C
    u32* dword_ptr_6A4;
    TCB* tcb_6A8;
    u8 field_6AC[12];
    u32 u32_6B8;
    u8 field_6BC[24];
    u32 array_6D4[3];
    u32 array_6E0[17];
    u8 field_724[16];
    u32 int_734;
    u8 field_738[16];
    TCBManagerEx* tCBManagerEx;
    u8* u8_ptr_74C;
    u8 field_750[76];
    u32* buttonClickRelated;
    u16 field_7A0;
    u8 field_7A2[93];
    u8 field_7FF;
    u32 field_800;
    u8 field_804[40];
    ItemType pocketType_82C;
    u32 u32_830;
    u32 u32_834;
    u32* ptr_838;
    int field_83C;
    u8 gap840[8];
    u32 BIAArraySizeUnkn[20];
    u32 u32_898;
    u32 bagItemActions;
    ItemID itemID_8A0;
    u8 field_8A4[8];
    b32 bool_8AC;
    u8 field_8B0[16];
    u32 field_8C0;
    u32 field_8C4;
    u32 field_8C8;
    u8 field_8CC[456];
    u32 itemID_A94;
    u8 field_A98[5304];
    u32 field_1F50;
};

// ─── [W1] Offsets verified on the White 1 disassembly ───────────────────────
// This project's headers come from White 2 and several offsets there do not
// hold for W1. These are the only fields QoLItems actually reads: if a change
// to the struct moves them, the build stops here instead of producing silent
// wrong reads (which is the worst way to find out).
//
//   field             W2      W1     derived from
//   msgData           0x520   0x51C  Bag_RepelEffect: [r5, r4-0x28]
//   wordSetSystem     0x524   0x520  Bag_LoadItemName: literal 0x520
//   strBuf1           0x528   0x524  Bag_RepelEffect: [r5, r4-0x20]
//   strBuf2           0x528   0x528  Bag_RepelEffect: [r5, r4-0x1C]
//   heapID            0x54C   0x544  base for the calcs above
//   itemID_8A0        0x8A0   0x84C  Bag_RepelEffect: literal 0x84C
#define W1_ASSERT_OFF(s, f, o) \
    static_assert(__builtin_offsetof(s, f) == (o), #s "." #f " moved: invalid W1 layout")

W1_ASSERT_OFF(Bag, gameData,      0x000);
W1_ASSERT_OFF(Bag, bagSaveData_4, 0x004);
W1_ASSERT_OFF(Bag, void_ptr_8,    0x008);
W1_ASSERT_OFF(Bag, msgData,       0x51C);
W1_ASSERT_OFF(Bag, wordSetSystem, 0x520);
W1_ASSERT_OFF(Bag, strBuf1,       0x524);
W1_ASSERT_OFF(Bag, strBuf2,       0x528);
W1_ASSERT_OFF(Bag, heapID,        0x544);
W1_ASSERT_OFF(Bag, itemID_8A0,    0x84C);
W1_ASSERT_OFF(PlayerActionPerms, actionsBlocked, 0x00C);

extern "C" int Bag_LoadItemName(Bag* bag, u32 narcIdx, u32 itemID);
extern "C" void Bag_CreateTextBox(Bag* bag, int a2);
extern "C" b32 IsSkipDialogueKeyPressed(Bag* bag, int a2);
extern "C" int SkipDialogue(int a1);

#endif // __BIG_BAG_STRUCT_TEMP_H
