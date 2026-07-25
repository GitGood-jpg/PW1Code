# What's White-1-specific

Notes on what had to change to get PW2Code running on White 1, in case you're looking at the sources and
wondering why something is the way it is. You need a PMC built for W1; this repo is the patch side only.

## Symbols

`ESDB.yml` is the W1 symbol database — the W2 one with the addresses redone for White 1. Every battle hook
resolves. The battle code lives in **ov93** (segment 0x5D) where W2 has it in ov167, so most of the battle
symbols moved wholesale; the rest were matched function by function.

Two symbols simply don't exist in White 1 — `PML_ItemGetType` and `PassPower_ApplyExploringChance`. Their
hooks are skipped, which is the correct outcome, not a failure. `QoLItems.cpp` is shared with B2/W2 where
they do exist.

`W1_BATTLE_SYMBOLS_REGISTRY.md` lists the battle symbols with their W1 and W2 addresses side by side, if
you want to check the work.

## ARM vs Thumb

Some arm9 functions are ARM on W1 where W2 has them in Thumb, so anything hooking or calling them has to
enter in the right mode — a Thumb `bl` into an ARM function goes off the rails. This bit us on
`GFL_HeapAllocate` in particular, where the wrong mode broke every allocation.

## Source changes worth knowing

- **New-move animations.** W1's animation system isn't extended the way W2's is, so a move ID past the
  vanilla range corrupts it. The patch passes a vanilla ID to the animation system and stashes the real
  move ID separately, then redirects the archive load. See `MoveAnimLoadW1` in `BattleEngine.S`.
- **Move effects are internalized.** They live in `Patches/BattleUpgrade/` with `dllName` set to `nullptr`
  instead of being loaded as DLLs at runtime — the kernel's DLL loader corrupts memory when it loads one
  mid-battle.
- **Don't make BattleUpgrade resident.** Putting an arm9 patch (a `FULL_COPY_255`) inside the module makes
  the PMC treat it as resident, which resolves its imports only once at boot; the Library modules reload at
  different addresses and you get a stale pointer. There's a longer note about this at the end of
  `BattleEngine.S`.

## Heap

White 1's heap is tighter than White 2's, so there's less room for battle content. The engine and the
standard feature set fit fine; piling on a lot of new content on top of everything can overrun it.
