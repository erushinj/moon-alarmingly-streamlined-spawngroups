# Alarmingly Streamlined Spawngroups

Simultaneously simplifies and complexifies enemy spawn groups

Also known as ASS, since it probably is

-----

An enemy spawn group mod, crafted and refined for this one's tastes over the course of a year, with three distinct sets of simple yet alarming groups

Requires [Streamlined Heisting](https://github.com/segabl/pd2-streamlined-heisting) - also compatible with [Super Serious Shooter](https://github.com/segabl/pd2-super-serious-shooter)

The mod is more difficult than base Streamlined Heisting, but its difficulty is customizable

-----

### Custom Heist Support:

In version 6, the mod has received improved compatibility with custom heists.

Not all may work out of the box, mostly if a given heist uses a custom faction, so leave a comment if needed.

Custom heists that have been played from start to finish with the mod, in loud, on Death Wish difficulty:

- [Avalon's Shadow v12](https://modworkshop.net/mod/34760)
- [Crashing Capitol v1.0.2.3](https://modworkshop.net/mod/44630)
- [GenSec H.I.V.E. Heist v1.5](https://modworkshop.net/mod/36368): requires [Custom Heist Fixes](https://modworkshop.net/mod/41562)
- [Bank Heist: Russia v2](https://modworkshop.net/mod/30389): requires [Custom Heist Fixes](https://modworkshop.net/mod/41562)
- [Constantine Heists Archive v5](https://modworkshop.net/mod/43578): heists with the custom FSB or cartel factions; Scarlett Resort; Penthouse Crasher
- [Stalk Fraud v3.4](https://modworkshop.net/mod/24638): uses the Bo-force faction at all times
- [BOWORKS v1.5](https://modworkshop.net/mod/31560): day 3 requires [Custom Heist Fixes](https://modworkshop.net/mod/41562)

-----

### Settings:
<table>
    <tr>
        <th>
            Enable the ASS
        </th>
        <td>
            Make the mod do the thing.
        </td>
    </tr>
    <tr>
        <th>
            Level Mod
        </th>
        <td>
            Make levels use a fixed response faction on any difficulty. Disabled in Holdout. ZEAL Level Mods activate an additional matchmaking lock.
        </td>
    </tr>
    <tr>
        <th>
            Assault Style
        </th>
        <td>
            Choose which set of spawn groups to face.
        </td>
    </tr>
    <tr>
        <th>
            Skill Level
        </th>
        <td>
            Tweaks base values used for scaling.
        </td>
    </tr>
    <tr>
        <th>
            Resistive Responders
        </th>
        <td>
            All dominatable enemies are better at resisting domination on higher difficulties.
        </td>
    </tr>
    <tr>
        <th>
            Difficult Dominations
        </th>
        <td>
            All dominatable enemies are as adept at resisting domination as a heavy unit.
        </td>
    </tr>
    <tr>
        <th>
            Super Serious Surrenders
        </th>
        <td>
            All dominatable enemies will only give up between assault waves. Effectively always active in Super Serious Shooter.
        </td>
    </tr>
    <tr>
        <th>
            Absolute Values
        </th>
        <td>
            Sets values that scale with chosen difficulty to use Death Sentence values.
        </td>
    </tr>
    <tr>
        <th>
            Maxed Assault Strength
        </th>
        <td>
            Always uses task data corresponding to 100% heist difficulty progression.
        </td>
    </tr>
    <tr>
        <th>
            Maxed Law Multipliers
        </th>
        <td>
            Always uses enemy spawn limits corresponding to a full crew, regardless of how many players there are.
        </td>
    </tr>
    <tr>
        <th>
            Grace Period
        </th>
        <td>
            Tweak the grace period duration for yourself only. Has no effect in Super Serious Shooter.
        </td>
    </tr>
    <tr>
        <th>
            Shield Arms
        </th>
        <td>
            Determine the weapon type used by Shield units. Has no effect in Super Serious Shooter.
        </td>
    </tr>
    <tr>
        <th>
            Taser Dazers
        </th>
        <td>
            Determine the weapon type used by Tasers.
        </td>
    </tr>
    <tr>
        <th>
            Cloaker Balance
        </th>
        <td>
            Determine the weapon type used by Cloakers.
        </td>
    </tr>
    <tr>
        <th>
            Medic Ordnance
        </th>
        <td>
            Determine the weapon type used by rifle Medics.
        </td>
    </tr>
    <tr>
        <th>
            Medical Ordinance
        </th>
        <td>
            Determine the weapon type used by shotgun Medics. Yes, those are two different words.
        </td>
    </tr>
    <tr>
        <th>
            Shiny Riflemen
        </th>
        <td>
            Allow SMG SWATs for supported factions to spawn in the assault, if available.
        </td>
    </tr>
    <tr>
        <th>
            Minigun Dozers
        </th>
        <td>
            Allow Minigun Dozers to spawn in the assault on Death Wish difficulty.
        </td>
    </tr>
    <tr>
        <th>
            Captain Winters
        </th>
        <td>
            Allow Captain Winters to spawn. Effectively always inactive in Super Serious Shooter.
        </td>
    </tr>
    <tr>
        <th>
            True Patriots
        </th>
        <td>
            Allow police to deploy gas grenades even when hostages are in the area.
        </td>
    </tr>
    <tr>
        <th>
            Escapes
        </th>
        <td>
            Allow escapes to occur.
        </td>
    </tr>
</table>

### Notes:
- Majority of features only work as host
- Values (eg, frequency of tougher units) scale with chosen difficulty
- Some difficulties and Level Mods have a mixed response of two different police factions
- Minigun Dozers are added to some scripted spawns and will spawn regardless of the Minigun Dozers setting on Death Wish
- Marshal Marksmen are added to some scripted spawns to compensate for their removal from the assaults
- Includes a tweaked version of [Give Random Arms to Scripted Spawns](https://modworkshop.net/mod/42111)
- Certain special enemies are given appropriate weaponry for faction consistency
- Certain unique characters (bosses, friendly NPCs) are also given different weapons
- Mission scripting for several maps has been tweaked - both to improve scripted spawn variety, and to improve game flow
- Some enemy-related modifiers and mutators have been tweaked to better work with the mod

-----

### Assault Styles:

<table>
    <tr>
        <th>
            Original (default)
        </th>
        <td>
            <ul>
                <li>Modernized and tweaked restoration of the game's pre-Crimefest 2016 spawn groups.</li>
                <li>New enemy combos; riflemen and shotgunners spawn together; light and heavy units spawn separately.</li>
                <li>Scales up shotgunner and flanker presence with difficulty; light and heavy unit presence is always approximately 1:1.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Streamlined++
        </th>
        <td>
            <ul>
                <li>Spicier version of Streamlined Heisting's default groups.</li>
                <li>New enemy combos; more shotgunners.</li>
                <li>Scales up heavy presence with difficulty, to approximately 1:1 with light units on Death Sentence - this ratio varies with the chosen Skill Level.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Default Streamlined
        </th>
        <td>
            <ul>
                <li>Tweaks Streamlined Heisting's default groups to work with the Level Mod and Skill Level settings.</li>
                <li>Does not add new units to the groups; all other aspects of the mod, such as mission script tweaks, still apply.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Chicken Plate
        </th>
        <td>
            <ul>
                <li>Experimental - enemies spawn solo, but faster than normal.</li>
                <li>Higher heavy unit presence than normal - 5:2 heavy-to-light ratio in the toughest assault waves.</li>
            </ul>
        </td>
    </tr>
</table>

### Skill Levels:

<table>
    <tr>
        <th>
            I'm Too Young to Die
        </th>
        <td>
            <ul>
                <li>Pussy.</li>
                <li>Tougher units are less likely to spawn.</li>
                <li>Assaults last up to around 5 minutes.</li>
                <li>Assault breaks are 10% longer.</li>
                <li>The cooldown between enemies using the same grenade type again is increased by 15%.</li>
                <li>The cooldown between enemies using any grenade is 15 seconds.</li>
                <li>Enemies are more hesitant to push when no grenade is available.</li>
                <li>Cooldown between enemy spawns is increased to 110%.</li>
                <li>Smoke bombs last up to 15 seconds.</li>
                <li>Gas grenade chance builds up more slowly.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Hey, Not Too Rough (default)
        </th>
        <td>
            <ul>
                <li>Probably won't hurt.</li>
                <li>Tougher units are less likely to spawn.</li>
                <li>Assaults last up to around 5.5 minutes. Length varies slightly.</li>
                <li>The cooldown between enemies using any grenade is 13.5 seconds.</li>
                <li>Smoke bombs last up to 15 seconds.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Hurt Me Plenty (recommended)
        </th>
        <td>
            <ul>
                <li>May hurt.</li>
                <li>Original values.</li>
                <li>Assaults last up to around 5.5 minutes. Length varies slightly.</li>
                <li>The cooldown between enemies using any grenade is 13.5 seconds.</li>
                <li>Smoke bombs last up to 15 seconds.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Ultra-Violence
        </th>
        <td>
            <ul>
                <li>Will hurt.</li>
                <li>Tougher units are more likely to spawn.</li>
                <li>Assaults last up to around 6.5 minutes. Length varies.</li>
                <li>Assault breaks are 15% shorter.</li>
                <li>The cooldown between enemies using the same grenade type again is decreased by 25%.</li>
                <li>The cooldown between enemies using any grenade is 12 seconds.</li>
                <li>Enemies are less hesitant to push when no grenade is available.</li>
                <li>Cooldown between enemy spawns is decreased to 75%.</li>
                <li>Smoke bombs last up to 20 seconds.</li>
                <li>Gas grenade chance builds up faster.</li>
                <li>Special limits are increased by about 25%.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Nightmare!
        </th>
        <td>
            <ul>
                <li>Doable bullshit.</li>
                <li>Not playtested. It's just a "fuck you" thing.</li>
                <li>Tougher units are more likely to spawn.</li>
                <li>Assaults last up to around 9 minutes. Length varies a lot.</li>
                <li>Assault breaks are 15% shorter.</li>
                <li>The cooldown between enemies using the same grenade type again is decreased by 75%.</li>
                <li>The cooldown between enemies using any grenade is 6 seconds.</li>
                <li>Enemies are much less hesitant to push when no grenade is available.</li>
                <li>Cooldown between enemy spawns is decreased to 25%.</li>
                <li>Smoke bombs last up to 30 seconds.</li>
                <li>Gas grenade chance builds up nearly instantly.</li>
                <li>Special limits are increased by 100%.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Ultra-Nightmare!!
        </th>
        <td>
            <ul>
                <li>Less doable bullshit.</li>
                <li>Not playtested. It's just a "fuck you and your mother" thing.</li>
                <li>Tougher units are exponentially more likely to spawn.</li>
                <li>Assaults will only end by killing enough cops, or from map scripting.</li>
                <li>Assault breaks may as well not exist.</li>
                <li>The cooldown between enemies using the same grenade type again is removed.</li>
                <li>The cooldown between enemies using any grenade is 3 seconds.</li>
                <li>Enemies won't wait to use a grenade before pushing.</li>
                <li>Cooldown between enemy spawns is removed.</li>
                <li>Smoke bombs last 60 seconds.</li>
                <li>Gas grenades are always used if available.</li>
                <li>Special limits are increased by 300%.</li>
            </ul>
        </td>
    </tr>
</table>

### Level Mod Map:

These are used when the Level Mod setting is set to Per-Level.
GenSec-ZEAL and ZEAL Level Mods require an additional matchmaking lock to function online, and thus have no associated levels and will not be picked when Level Mod is set to Random.
For alternate factions like Murkywater, this will use their version of equivalent American units - they may not be visually different without other mods, though.

<table>
    <tr>
        <th>
            SWAT
        </th>
        <td>
            <ul>
                <li>Jewelry Store</li>
                <li>Four Stores</li>
                <li>Nightclub</li>
                <li>Mallcrasher</li>
                <li>Ukrainian Job</li>
                <li>Bank Heist: Deposit</li>
                <li>Bank Heist: Cash</li>
                <li>Bank Heist: Random</li>
                <li>Bank Heist: Gold</li>
                <li>Diamond Store</li>
                <li>Hotline Miami</li>
                <li>Art Gallery</li>
                <li>First World Bank</li>
                <li>Beneath the Mountain</li>
                <li>Counterfeit</li>
                <li>Brooklyn 10-10</li>
                <li>Stealing Xmas</li>
                <li>Heat Street</li>
                <li>Reservoir Dogs</li>
                <li>Alaskan Deal</li>
                <li>Brooklyn Bank</li>
                <li>San Martin Bank</li>
                <li>Dragon Heist</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            SWAT-FBI
        </th>
        <td>
            <ul>
                <li>Election Day</li>
                <li>Big Bank</li>
                <li>The Diamond</li>
                <li>Goat Simulator</li>
                <li>Panic Room</li>
                <li>Green Bridge</li>
                <li>Cursed Kill Room</li>
                <li>Ukrainian Prisoner</li>
                <li>Midland Ranch</li>
                <li>Bank Heist: Russia (custom)</li>
                <li>Cold Stones (custom)</li>
                <li>A House of Pleasure (custom)</li>
                <li>Flatline (custom)</li>
                <li>Stalk Fraud (custom)</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            FBI
        </th>
        <td>
            <ul>
                <li>Firestarter</li>
                <li>Rats</li>
                <li>Watchdogs</li>
                <li>Framing Frame</li>
                <li>Big Oil</li>
                <li>Hoxton Breakout</li>
                <li>Hoxton Revenge</li>
                <li>White Xmas</li>
                <li>Bomb: Dockyard</li>
                <li>Bomb: Forest</li>
                <li>Cook Off</li>
                <li>Meltdown</li>
                <li>Golden Grin Casino</li>
                <li>Aftershock</li>
                <li>Lab Rats</li>
                <li>Santa's Workshop</li>
                <li>Birth of Sky</li>
                <li>Boiling Point</li>
                <li>Undercover</li>
                <li>Biker Heist</li>
                <li>Safehouse Raid</li>
                <li>Scarface Mansion</li>
                <li>Prison Nightmare</li>
                <li>Henry's Rock</li>
                <li>Shacklethorne Auction</li>
                <li>Breakfast in Tijuana</li>
                <li>Black Cat</li>
                <li>Lost in Transit</li>
                <li>GO Bank</li>
                <li>Scorched Earth (custom)</li>
                <li>Crime and Punishment (custom)</li>
                <li>Hunter and Hunted (custom)</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            FBI-GenSec
        </th>
        <td>
            <ul>
                <li>Slaughterhouse</li>
                <li>Mountain Master</li>
                <li>Hostile Takeover</li>
                <li>Crashing Capitol (custom)</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            GenSec
        </th>
        <td>
            <ul>
                <li>Transport: Park</li>
                <li>Transport: Downtown</li>
                <li>Transport: Underpass</li>
                <li>Transport: Crossroads</li>
                <li>Transport: Harbor</li>
                <li>Transport: Train Heist</li>
                <li>Alesso Heist</li>
                <li>Diamond Heist</li>
                <li>No Mercy</li>
                <li>The White House</li>
                <li>Hell's Island</li>
                <li>Border Crossing</li>
                <li>Border Crystals</li>
                <li>Buluc's Mansion</li>
                <li>Crude Awakening</li>
                <li>Avalon's Shadow (custom)</li>
                <li>Penthouse Crasher (custom)</li>
                <li>Scarlett Resort (custom)</li>
                <li>GenSec H.I.V.E. Heist (custom)</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Unique
        </th>
        <td>
            <ul>
                <li>BOWORKS (custom) rotates from SWAT to FBI to GenSec tiers with each heist day</li>
            </ul>
        </td>
    </tr>
</table>

-----

### For modders:

- Mod has global name `ASS` and uses similar names in added hooks and menu-related things
- Mods sets field `ASS.been_there_fucked_that = true` once scripts start running - check for this if checking if the mod is doing its thing
- Hooks into `core/lib/managers/coreworldinstancemanager`, `lib/managers/group_ai_states/groupaistatebase`, `lib/managers/group_ai_states/groupaistatebesiege`, `lib/managers/mission/elementjobstagealternative`, `lib/managers/mission/elementspawncivilian`, `lib/managers/mission/elementspawnenemydummy`, `lib/managers/mission/elementspawnenemygroup`, `lib/managers/missionmanager`, `lib/managers/modifiersmanager`, `lib/managers/mutatorsmanager`, `lib/managers/skirmishmanager`, `lib/network/base/networkmanager`, `lib/setups/gamesetup`, `lib/tweak_data/charactertweakdata`, `lib/tweak_data/groupaitweakdata`, `lib/tweak_data/levelstweakdata`, `lib/tweak_data/mutatortweakdata`, `lib/tweak_data/playertweakdata`, `lib/tweak_data/skirmishtweakdata`, `lib/units/enemies/cop/copbase`
- Has priority 0

-----

Be trans, shoot pigs

Every month is pride month, motherfucker
