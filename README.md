# PW1Code

Gen 6+ gameplay on **Pokémon White** (White 1, game code IRAO) — Fairy type, the full Gen 6 battle
engine, Mega Evolution, level caps and the rest.

This is basically PW2Code brought over to White 1. It's inspired by and built on
[Paideieitor](https://github.com/Paideieitor)'s [PW2Code](https://github.com/Paideieitor/PW2Code) — all
the actual features and the patch framework are their work. The catch is that PW2Code only targets Black 2
/ White 2, and White 1 isn't just a shifted version of White 2: the arm9 hooks are ARM instead of Thumb,
the battle overlay is ov93 instead of ov167, and the overlay/heap layout is different. So to get it running
I had to redo the symbol database and the PMC targeting for W1. That's what this repo is.

Once it's set up you get the full feature set on White 1 — same as PW2Code, nothing cut.

> **Heads up:** White 1's heap is smaller than White 2's, so there's less headroom. Piling on a lot of new
> content (new moves and the like) on top of everything can overrun it — keep that in mind if you go heavy.

## What's in here

- `ESDB.yml` — the W1 symbol database (91/91 battle hooks resolved, including 22 weather-ability handlers
  the build was silently skipping before).
- `Patches`, `Libraries`, `Global`, `Headers`, `settings.h` — the patch sources.
- `Assets` — the edited data for the new content.
- `PORTING-W1.md` and `W1_BATTLE_SYMBOLS_REGISTRY.md` — what's W1-specific, and the symbol register.

This is the patch side only — you need a PMC built for W1 to load it. No ROM in here either: bring your
own White 1, nothing from the game binary is distributed.

## Credits

Everything here stands on [Paideieitor](https://github.com/Paideieitor)'s
[PW2Code](https://github.com/Paideieitor/PW2Code) — the features, the framework, all of it is their work,
and this wouldn't exist without it. Full respect. Their original credits:

- **Hello007** — CTRMap and the Gen V code-injection system
- **PlatinumMaster** — Gen V code-injection system & the PMC adaptation of the Fairy patch
- **totally_anonymous** — IDB documentation
- **SpagoAsparago** — original Gen 6 ability expansion
- **BlueRosie & Sunk** — original Fairy type implementation

The White 1 side — reverse-engineering the addresses, the symbol database, the PMC targeting — is my part.
