# PW1Code

Gen 6+ gameplay on **Pokémon White** (White 1, game code IRAO) — Fairy type, the full Gen 6 battle
engine, Mega Evolution, level caps and the rest.

This is basically PW2Code brought over to White 1. The whole thing is inspired by and built on
[Paideieitor](https://github.com/Paideieitor)'s [PW2Code](https://github.com/Paideieitor/PW2Code) — all
the actual features and the patch framework are their work. The catch is that PW2Code only targets Black 2
/ White 2, and White 1 isn't just a shifted version of White 2: the arm9 hooks are ARM instead of Thumb,
the battle overlay is ov93 instead of ov167, and the overlay/heap layout is different. So to get it running
I had to redo the symbol database and the PMC targeting for W1. That's what this repo is.

Once it's set up you get the full feature set on White 1 — same as PW2Code, nothing cut. It runs on both
DS and DSi mode; I'd go with DSi, you get a ~1.4 MB module heap so the whole engine plus any new content
fits comfortably. DS mode works too but RAM is tight, so don't pile on Mega + new moves there or it'll run
out and crash.

## What you need

- A **Pokémon White (USA/Europe, DSi-enhanced)** ROM — game code IRAO. Bring your own, it's not here.
- [CTRMap-CE](https://github.com/kingdom-of-ds-hacking/CTRMap-CE) with the latest
  [CTRMapV](https://github.com/kingdom-of-ds-hacking/CTRMapV) plugin.
- PW2Builder (the patch compiler) and an `arm-none-eabi` GCC toolchain.

## Building it

Open your White 1 ROM in CTRMap so it extracts everything and makes the `vfs`/`base`. Then you need a PMC
targeted for W1 — bake the constants from `IRAO.yml` into it (the arm9 hook remaps, the ARM/BLX sites, the
byte patches, the DSi heap patches — they're all in there, each one commented with why it's there) and
install it through CTRMap. Point the project at the `Patches`, `Global`, `Headers`, `Assets`, `Libraries`
folders plus `ESDB.yml` and `settings.h`, set what you want in `settings.h`, and build with PW2Builder.
Play it in DSi mode for the full thing.

If you want the gory details of how W1 differs, `PORTING-W1.md` walks through every remap, and
`W1_BATTLE_SYMBOLS_REGISTRY.md` lists all 91 battle symbols I resolved (including a bunch of weather-ability
handlers that the build was silently skipping before).

## Credits

Everything here stands on [Paideieitor](https://github.com/Paideieitor)'s
[PW2Code](https://github.com/Paideieitor/PW2Code) — the features, the framework, all of it is their work,
and this wouldn't exist without it. Full respect. Their original credits:

- **Hello007** — CTRMap and the Gen V code-injection system
- **PlatinumMaster** — Gen V code-injection system & the PMC adaptation of the Fairy patch
- **totally_anonymous** — IDB documentation
- **SpagoAsparago** — original Gen 6 ability expansion
- **BlueRosie & Sunk** — original Fairy type implementation

What I did on top is the White 1 side: reverse-engineering the W1 addresses, the symbol database, the PMC
targeting and the overlay/heap work to make it all run on IRAO.
