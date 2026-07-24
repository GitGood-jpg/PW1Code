#ifndef __ENCOUNTER_H
#define __ENCOUNTER_H

#include "defs.h"

#include "save/save_control.h"

struct SWAN_ALIGNED(4) RoamingPokemon
{
    u16 nowZoneID;
    u8 nature;
    u32 ivs;
    u32 PID;
    u16 species;
    u16 currentHP;
    u8 level;
    u8 u8_11;
    u8 status;
    u8 u8_13;
};

// [W1] In White 1 `repelSteps` sta a 0x31, non a 0x2D come in White 2:
// verificato su EncountSave_SetRepelSteps (W2 0x200ddb1 fa `adds r0,#0x2d`;
// W1 0x200d55d fa `adds r0,#0x31`) e su EncountSave_DecrementRepelSteps.
struct SWAN_ALIGNED(2) EncountSave
{
    RoamingPokemon roamingPokemon[2];   // 0x00
    u8 roamingPokemonZoneClock[2];      // 0x28
    u8 field_2A[2];                     // 0x2A
    u8 currentSwarmLocation;            // 0x2C
    u8 gap2D[4];                        // 0x2D  [W1] 4 byte in più rispetto a W2
    u8 repelSteps;                      // 0x31  (W2: 0x2D)
    u16 nowRepelItemID;                 // 0x32
    u32 field_34;
};

static_assert(__builtin_offsetof(EncountSave, repelSteps) == 0x31,
              "EncountSave.repelSteps spostato: layout W1 non valido");

extern "C" EncountSave * SaveControl_GetEncountSave(SaveControl* saveCtrl);

#endif // __ENCOUNTER_H
