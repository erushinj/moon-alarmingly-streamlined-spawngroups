# Alarmingly Streamlined Spawngroups

Simultaneously simplifies and complexifies enemy spawn groups

Also known as ASS, since it probably is

-----

An enemy spawn group mod, crafted and refined for this one's tastes over half a year, with two distinct sets of simple yet alarming groups

Both sets of groups mix in occasional specials with regular spawns, allow dangerous pairings of specials, and make liberal use of enemy types neglected in vanilla

Designed for full out-of-box compatibility with (and plays best with) [Streamlined Heisting](https://modworkshop.net/mod/29713) - not all changes may be fully ideal for a vanilla game

-----

### Settings:
- Enable the ASS: When enabled, the mod does the thing.
- Level Mod: When enabled, makes some levels use a fixed response faction regardless of difficulty.
- Minigun Dozers on Death Wish: When enabled, reenables Minigun Dozers on Death Wish difficulty.
- Captain Winters: When enabled, reenables Captain Winters.
- Escapes: When enabled, reenables escapes.
- Vanilla Styled Assaults: When enabled, uses a different set of spawn groups made in the style of the modern spawn groups.
- Max Intensity: When enabled, makes special spawn limits, spawn groups, and task data use Death Sentence values.

### Notes (vanilla and [Streamlined Heisting](https://modworkshop.net/mod/29713)):
- Only works as host
- Default spawn group set is made in the style of the original spawn groups
- Vanilla Styled Assaults are a tweaked version of Streamlined Heisting's default groups
- Marshal Marksmen are more common and (re)spawn sooner on higher difficulties; Marshal Shields are rare spawns
- Very Hard has a mixed response of SWAT and FBI
- Mayhem has a mixed response of FBI and GenSec
- Dozer types are tweaked on difficulties below Death Sentence
- Captain Winters is removed
- Escapes (seen only on heists up to Armored Transport) are disabled
- Includes [Give Random Arms to Scripted Spawns](https://modworkshop.net/mod/42111)

### Notes (vanilla only):
- Light and heavy units of all tiers will be statistically identical on any given difficulty in a way that should sync to clients
- Units use difficulty-appropriate weaponry (eg, SWAT and FBI use G36s and Benellis on Mayhem and Death Wish) as weapon scaling is messed up
- Russian and zombie Tasers are given yellow M4s
- Special unit spawn limits are revised
- The timeout between enemies using grenades decreases with difficulty (enemies should be a bit more aggressive on high difficulties)

### Notes ([Streamlined Heisting](https://modworkshop.net/mod/29713) only):
- Tasers and Bulldozers use faction-appropriate weaponry where possible - this is cosmetic

-----

### "Level Mod" list:

#### SWAT:
- Jewelry Store
- Four Stores
- Nightclub
- Mallcrasher
- Ukrainian Job
- Bank Heist: Deposit
- Bank Heist: Cash
- Bank Heist: Random
- Bank Heist: Gold
- Stealing Xmas
- First World Bank
- Heat Street
- Counterfeit
- Dragon Heist

#### SWAT-FBI:
- Panic Room
- Green Bridge
- Ukrainian Prisoner

#### FBI:
- GO Bank
- Firestarter
- Rats
- Watchdogs
- Framing Frame
- Big Oil
- Hotline Miami
- Art Gallery
- Hoxton Breakout
- Hoxton Revenge (also featuring the Ready Team guards)
- Meltdown
- Biker Heist
- Safehouse Raid
- Lab Rats
- Prison Nightmare
- White Xmas
- Santa's Workshop
- Undercover
- Black Cat
- Midland Ranch

#### FBI-GenSec:
- Slaughterhouse
- No Mercy
- Mountain Master
- Lost in Transit

#### GenSec:
- Transport: Park
- Transport: Downtown
- Transport: Underpass
- Transport: Crossroads
- Transport: Harbor
- Transport: Train Heist
- Alesso Heist
- Diamond Heist
- Hostile Takeover

### Incompatibilities:
- [Little Intelligence EnhancementS](https://modworkshop.net/mod/37304) (probable, **not tested and not interested** in making ASS compatible if it isn't)
- Any mods causing different enemy tiers to have different health values will cause Level Mod not to function as intended

-----

### For modders:

- Mod has global name `ASS` and uses similar names in added hooks and menu-related things
- Hooks into `lib/managers/mission/elementspawnenemydummy`, `lib/tweak_data/groupaitweakdata`, `lib/units/enemies/cop/copbase`
- Has priority 0
- Mod will probably be confusing to modify - it has a, to say the least, unique setup to make everything work

-----

If any crashes or other issues occur, report them

This was mostly only tested in singleplayer before release
