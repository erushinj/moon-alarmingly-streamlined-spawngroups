# Alarmingly Streamlined Spawngroups

Simultaneously simplifies and complexifies enemy spawn groups

Also known as ASS, since it probably is

-----

An enemy spawn group mod, crafted and refined for this one's tastes over half a year, with two distinct sets of simple yet alarming groups

Both sets of groups mix in occasional specials with regular spawns, allow dangerous pairings of specials, and make liberal use of enemy types neglected in vanilla

Designed for full out-of-box compatibility with (and plays best with) [Streamlined Heisting](https://modworkshop.net/mod/29713)

-----

# Settings:
- Enable the ASS: When enabled, the mod does the thing.
- Level Mod: When enabled, makes some levels use a fixed response faction regardless of difficulty.
- Vanilla Styled Assaults: When enabled, uses a different set of spawn groups made in the style of the modern spawn groups.
- Max Intensity: When enabled, makes special spawn limits, spawn groups, and task data use Death Sentence values.

# Pedantic notes below:

Universal:
- Only works as host
- Default spawn group set is made in the style of (but is **not** a 1:1 port of) the pre-Hoxton's Housewarming Party spawn groups
- Marshal Marksmen are more common; Marshal Shields are infrequent
- Captain Winters is removed (he is not a fun mechanic)
- Various scripted spawns (eg, gangsters and security guards) have randomized weapons

Vanilla only:
- Light and heavy units of all tiers will be statistically identical on any given difficulty in a way that *should* sync to clients, using ZEAL stats on Death Sentence or otherwise FBI stats - this allows Level Mod to function in vanilla
- Units use difficulty-appropriate weaponry (eg, SWAT use G36s and Benellis on Mayhem and Death Wish) as weapon scaling and handling is very messed up
- Russian mercenaries always use FBI-tier light and heavy units; Murkywater and Federales always use GenSec-tier light and FBI-tier heavy units
- LMG Dozers are added to Mayhem
- Special unit spawn limits are revised
- Flashbang timers are appreciably shortened
- The timeout between enemies using grenades decreases rather than increases with difficulty (this means enemies should be a little more aggressive on high difficulties)

[Streamlined Heisting](https://modworkshop.net/mod/29713) only:
- Tasers use faction-appropriate rifles (MP5 for SWAT, zombies, and Federales; AK for Russian mercenaries; SCAR for Murkywater) - this is cosmetic
- Medic Dozers use faction-appropriate rifles (MPX for ZEAL; SCAR for Murkywater; MP5 for Federales) - this is cosmetic
- Murkywater R870 Dozers use the faction-appropriate shotgun (SPAS-12) - this is cosmetic

# "Level Mod" list:

SWAT:
- Jewelry Store
- Four Stores
- Nightclub
- Mallcrasher
- Ukrainian Job
- Bank Heist: Deposit
- Bank Heist: Cash
- Bank Heist: Random
- Bank Heist: Gold
- Cursed Kill Room (mixed with FBI)
- Stealing Xmas
- First World Bank
- Heat Street
- Counterfeit

FBI:
- GO Bank
- Firestarter
- Rats
- Watchdogs
- Framing Frame
- Big Oil
- Hotline Miami
- Art Gallery
- Hoxton Breakout
- Hoxton Revenge (featuring the Ready Team guards in place of light units)
- Meltdown
- Biker Heist
- Safehouse Raid
- Lab Rats
- Prison Nightmare
- Cursed Kill Room (mixed with SWAT)
- White Xmas
- Santa's Workshop
- Panic Room
- Green Bridge
- Undercover

GenSec:
- Transport: Park
- Transport: Downtown
- Transport: Underpass
- Transport: Crossroads
- Transport: Harbor
- Transport: Train Heist
- Alesso Heist
- Slaughterhouse
- Diamond Heist
- No Mercy

# Known incompatibilities:
- [Little Intelligence EnhancementS](https://modworkshop.net/mod/37304) (probable, **not tested and not interested** in making ASS compatible if it isn't)

-----

# Notes for modders:

Mod has global name `ASS` and uses similar names in added hooks and menu-related things

Hooks into:
- `lib/managers/mission/elementspawnenemydummy`
- `lib/tweak_data/groupaitweakdata`
- `lib/units/enemies/cop/copbase`

Has priority 0

Mod will probably be confusing to modify - it has a, to say the least, unique setup to make everything work

-----

If any crashes or other issues occur, report them

This was mostly only tested in singleplayer before release
