# Alarmingly Streamlined Spawngroups

Simultaneously simplifies and complexifies enemy spawn groups

Also known as ASS, since it probably is

-----

An enemy spawn group mod, crafted and refined for this one's tastes, with two distinct sets of simple yet alarming groups

Both sets of groups mix in occasional specials with regular spawns, allow dangerous pairings of specials, and make liberal use of neglected enemy types

Requires [Streamlined Heisting](https://modworkshop.net/mod/29713) - not all changes are ideal for a vanilla game

-----

### Settings:
- Enable the ASS: Make the mod do the thing.
- Level Mod: Make some levels use a fixed response faction regardless of difficulty.
- Vanilla Styled Assaults: Use a different set of spawn groups made in the style of Streamlined Heisting's default groups.
- Skill Level: Tweak how tough the mod is.
- Intensity: Optional further tweaks on the current Skill Level.
- Minigun Dozers on Death Wish: Reenable Minigun Dozers on Death Wish difficulty.
- Captain Winters: Reenable Captain Winters.
- Escapes: Reenable escapes.

### Notes:
- Only works as host
- Default spawn group set is made in the style of the original spawn groups
- Vanilla Styled Assaults are a tweaked version of Streamlined Heisting's default groups
- Marshal Marksmen are more common and spawn sooner on higher difficulties; Marshal Shields are rare spawns
- Very Hard has a mixed response of SWAT and FBI
- Mayhem has a mixed response of FBI and GenSec
- Dozer types are tweaked on difficulties below Death Sentence
- Captain Winters is removed by default
- Escapes (seen only on heists up to Armored Transport) are disabled by default
- Includes [Give Random Arms to Scripted Spawns](https://modworkshop.net/mod/42111)
- Certain special enemies use faction-appropriate weaponry where possible - this is cosmetic

-----

### Skill Levels

#### I'm Too Young to Die
- Pussy.
- Tougher units are less likely to spawn.
- Assaults are shorter.
- Assault breaks are longer.
- The cooldown between enemies using grenades is increased.
- Enemies spawn slightly slower.
- Smoke bombs last a shorter time.
- Gas grenades are less likely.
- Special limits are lowered.

#### Hey, Not Too Rough (default)
- Probably won't hurt.
- Tougher units are less likely to spawn.

#### Hurt Me Plenty (recommended)
- May hurt.
- Original values.

#### Ultra-Violence
- Will hurt.
- Tougher units are more likely to spawn.
- Assaults are longer.
- Assault breaks are shorter.
- The cooldown between enemies using grenades is decreased.
- Enemies spawn slightly faster.
- Smoke bombs last a longer time.
- Gas grenades are more likely.
- Special limits are higher.

#### Nightmare!
- Doable bullshit.
- Tougher units are more likely to spawn.
- Assaults are longer.
- Assault breaks are shorter.
- The cooldown between enemies using grenades is massively decreased.
- Enemies spawn far faster.
- Smoke bombs last a much longer time.
- Gas grenades are much, much more likely.
- Special limits are doubled.

#### Ultra-Nightmare!!
- Less doable bullshit.
- Tougher units are exponentially more likely to spawn.
- Assaults will only end by killing enough cops.
- Assault breaks may as well not exist.
- The cooldown between enemies using grenades is removed.
- Enemies spawn far, far faster.
- Smoke bombs last a full minute.
- Gas grenades are always used if available.
- Special limits are quadrupled.

### Intensities

#### No Soap Dropping
- Nothing is altered.

#### Drop the Soap
- Uses Death Sentence values.

#### Pick Up the Soap
- Uses Death Sentence values.
- In-heist "diff" is always 1.

#### Fuck Me Sideways
- Uses Death Sentence values.
- In-heist "diff" is always 1.
- Always uses 4 player spawns.

### Level Mods:

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

-----

### For modders:

- Mod has global name `ASS` and uses similar names in added hooks and menu-related things
- Hooks into `lib/managers/group_ai_states/groupaistatebase`, `lib/managers/mission/elementspawnenemydummy`, `lib/managers/mission/elementjobstagealternative`, `lib/tweak_data/groupaitweakdata`, `lib/units/enemies/cop/copbase`
- Has priority 0
- Mod may be confusing to modify

-----

If any crashes or other issues occur, report them

This was mostly only tested in singleplayer before release
