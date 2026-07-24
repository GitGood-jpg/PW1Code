#ifndef __DEFS_H
#define __DEFS_H

#ifdef _CONSOLE
#define SWAN_PACKED
#define SWAN_ALIGNED(x)
#define SWAN_NORETURN
#else
#define SWAN_PACKED __attribute__((__packed__))
#define SWAN_ALIGNED(x) __attribute__((aligned(x)))
#define SWAN_NORETURN __attribute__((noreturn))
#endif

#include "swantypes.h"

#include "nds/mem.h"

#define DEBUG_PRINT 1
#if DEBUG_PRINT
#include "kPrint.h"
#define DPRINT(format) k::Print(format)
#define DPRINTF(format, ...) k::Printf(format, __VA_ARGS__)
#elif !DEBUG_PRINT
#define DPRINT(format)
#define DPRINTF(format, ...)
#endif

#define ARRAY_COUNT(arr) sizeof(arr) / sizeof(arr[0])

struct SWAN_ALIGNED(2) StrBuf
{
	u16 charCapacity;
	u16 charCount;
	u32 magic;
	u16 string[];
};

extern "C" u32 fixed_round(u32 value, u32 ratio);

extern u32 g_GameBeaconSys;
// W1: gameData sits at offset 0 of the beacon-sys, NOT at +4 like on B2/W2. With +4 you read the first
// word of an inline sub-struct as if it were a pointer → garbage (this is what made GetLvlCap abort).
// Verified against the W1 arm9: 33 sites use the global, none of them reads a pointer at +4, and
// GameData_GetSaveControl is called with *(beaconSys+0) — see 0x20271b2.
#define GAME_DATA *(GameData**)(g_GameBeaconSys)

struct PassPowerState
{
    u32 remainFrames[16];
    u8 effectSrcIDs[16];
    u16 effectValues[16];
    u8 lastUsed;
    u8 field_71;
    u16 field_72;
};
extern PassPowerState g_PassPowerState;
static u32* PASSPOWER_EXPLORING_CHANCES = (u32*)0x208FE4C;
#define PASSPOWER_EFF_EXPLORING 0xD

#endif // __DEFS_H
