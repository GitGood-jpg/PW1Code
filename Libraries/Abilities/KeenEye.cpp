#include "settings.h"
#if EXPAND_ABILITIES

#include "server_flow.h"

// KEEN EYE
extern "C" void HandlerKeenEyeCheck(BattleEventItem * item, ServerFlow * serverFlow, u32 pokemonSlot, u32 * work);
extern "C" void HandlerKeenEyeGuard(BattleEventItem * item, ServerFlow * serverFlow, u32 pokemonSlot, u32 * work);
extern "C" void HandlerKeenEyeEvasion(BattleEventItem * item, ServerFlow * serverFlow, u32 pokemonSlot, u32 * work) {
    // W1 FIX (Patrat/KeenEye crash when attacking and missing): EVENT_MOVE_ACCURACY_STAGE is aliased to
    // EVENT_ACCURACY_MISS (0x33), fired by ServerEvent_AccuracyMiss WITHOUT VAR_EVASION_STAGE in the
    // frame. On W1 the unsafe GetValue on a missing var leads to an out-of-frame write
    // (RewriteValue) → corruption → crash. (On W2 the var is present and works; no regression here.)
    // GetValueIfExist returns false if the var is not in the frame → the handler does nothing.
    u32 evasionStage;
    if (pokemonSlot == BattleEventVar_GetValue(VAR_ATTACKING_MON) &&
        BattleEventVar_GetValueIfExist(VAR_EVASION_STAGE, &evasionStage) && evasionStage > 6) {
        BattleEventVar_RewriteValue(VAR_EVASION_STAGE, 6);
    }
}
BattleEventHandlerTableEntry KeenEyeHandlers[]{
    {EVENT_STAT_STAGE_CHANGE_LAST_CHECK, HandlerKeenEyeCheck},
    {EVENT_STAT_STAGE_CHANGE_FAIL, HandlerKeenEyeGuard},
    {EVENT_MOVE_ACCURACY_STAGE, HandlerKeenEyeEvasion},
};
extern "C" BattleEventHandlerTableEntry * EventAddKeenEyeUpdated(u32 * handlerAmount) {
    *handlerAmount = ARRAY_COUNT(KeenEyeHandlers);
    return KeenEyeHandlers;
}
#endif // EXPAND_ABILITIES