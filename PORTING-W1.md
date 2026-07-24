# PW2Code on Pokémon White 1 (IRAO)

I ported PW2Code to White 1. Stock PW2Code only targets Black 2 / White 2, and White 1 is not a clean
shift of White 2 — different arm9 hook sites (they're ARM in W1, Thumb in W2), a different battle overlay
(ov93 instead of ov167), a different overlay/heap layout, different SDK globals. So it needs a PMC with
W1 constants, plus a per-address map for the tables that moved.

This folder has everything that's *mine*: the symbol database, the W1 targeting map, and the patch
sources. It does not contain the ROM, anything extracted from the ROM, or the PMC — the PMC is yours, you
already build it, you just need to bake the W1 values below into it.

## What's here

- `ESDB.yml` — the W1 symbol database. It's the W2 one with the addresses corrected for White 1; every
  battle hook resolves, nothing skipped. Battle overlay is ov93, BattleUpgrade hooks sit in segment 0x5D.
  The last stragglers were the ones that aren't a clean shift of W2 — `DayCare_CalcNewLevel` for instance
  lives in the BLZ-compressed ov21, and its address doesn't line up by a constant offset with W2, so I
  pulled it out by decompressing the overlay and matching the call graph rather than trusting a delta.
- `IRAO.yml` — the W1 targeting map. This is the important file: it's where all the PMC-side remaps live,
  each one commented with why the value is what it is. More on it below.
- `Patches/`, `Libraries/`, `Global/`, `Headers/`, `settings.h` — the patch sources. Same layout as a
  normal PW2Code project.
- `Assets/` — only my own files (the Fairy type chart and palette map, and the whitelist). No extracted
  NARCs in here.
- `W1_BATTLE_SYMBOLS_REGISTRY.md` — the 69 battle hooks with their W1 and W2 addresses side by side, in
  case you want to check my work.

Not here, on purpose: the ROM, the extracted NARC assets, the generated `vfs/`/`base/`, and the PMC blob.

## Bringing the PMC to W1

Everything the PMC needs is in `IRAO.yml`. Read the comments there rather than trusting a summary — I got
bitten a few times and wrote down exactly why each value is what it is. The short version:

- `Arm9HookRemap` — the four hook sites baked into the PMC, remapped W2 → W1: AdjustHeapStart, GFL_OvlLoad,
  GFL_OvlEntryUnload, UncapOverlayMaximum. In W1 the arm9 hooks are ARM, so two of them (GFL_OvlLoad /
  GFL_OvlEntryUnload, listed in `Arm9ArmBlxSites`) need a BLX into the Thumb handler instead of a BL.
- `Arm9StubCallRemap` + `Arm9BytePatches` — the boot stub calls and the one byte patch at 0x02078D8F.
  That byte patch is bug #7: it forces sys_read_overlay_header down the FS-context fallback, otherwise the
  overlay header comes back as garbage after the intro movie and the game crashes when BattleUpgrade loads
  its overlay.
- `OverlayBaseExtra: 0x4000` — W1 parks its FAT/FNT buffer right at maxOverlayBase, which is exactly where
  the PMC overlay would mount, so it gets clobbered during FS operations. Bumping it 0x4000 up gets it
  clear of the buffer and still under the heap region.
- `PmcHeapPatches` — the DSi heap. Apply these to the PMC.rpm *before* injection, not to the final ROM —
  patching the ROM afterwards breaks the DSi digest and you get a white screen. They move the heap window
  to 0x02220000..0x02380000 (1408 KB) and skip the ARM7 clamp on the DSi branch only. Each patch has an
  `Expect` guard so it fails loudly if your PMC layout differs from mine instead of writing to the wrong
  offset.

There's also `HardcodedMap` (the vanilla move/ability/item event tables — mind the base/END pairs, if you
remap a base without its END you get a runaway loop into the next table), `SafestackKeep` (the 24 hooks
kept for the full engine), `StripNames: selective` (keeps the resident set inside W1's 141 KB DS heap),
and `AbsentSymbols` (two symbols that genuinely don't exist in W1, so their hook is skipped on purpose).

## DS vs DSi

DSi mode gets the full 1408 KB heap window (the DSi frees the lower 4 MB), so the whole battle engine plus
Mega Evolution plus new content fits with room to spare. DS mode boots and plays too — modules stay
resident so the second battle doesn't run the heap dry — but there's only ~141 KB total and roughly 20 KB
left for battle content, so adding new moves or Mega on top of a DS build will overrun it and crash.
Build for DSi if you want the new content.

## Building it

Open the White 1 (IRAO) ROM in CTRMap with the CTRMapV plugin so it generates `vfs/`/`base/`, install
your PMC with the `IRAO.yml` constants baked in, drop these sources into the project, set what you want in
`settings.h`, and build with PW2Builder. Play it in DSi mode for the full set.
