# Alarmingly Streamlined Spawngroups

Simultaneously simplifies and complexifies enemy spawn groups

Also known as ASS, since it probably is

-----

An enemy spawn group mod, crafted and refined for this one's tastes over the course of around a year, with two distinct sets of simple yet alarming groups

Requires [Streamlined Heisting](https://github.com/segabl/pd2-streamlined-heisting) - also compatible with [Super Serious Shooter](https://github.com/segabl/pd2-super-serious-shooter)

The default Original group set is a modernized and tweaked restoration of the original spawn groups, while the Streamlined group set is a spicier version of Streamlined Heisting's default spawn groups

In addition, scripted spawns on several maps are tweaked for better guard, SWAT, and special variety

The mod is more difficult than base Streamlined Heisting, but its difficulty is customizable

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
            Make levels use a fixed response faction on any difficulty.
        </td>
    </tr>
    <tr>
        <th>
            Assault Style
        </th>
        <td>
            Choose between original styled and Streamlined Heisting styled spawn groups.
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
            Marshal Groups
        </th>
        <td>
            Adjust how many Marshal groups can be present at the same time.
        </td>
    </tr>
    <tr>
        <th>
            Super Serious Dominations
        </th>
        <td>
            Disallows dominating enemies during assaults.
        </td>
    </tr>
    <tr>
        <th>
            Death Sentence Values
        </th>
        <td>
            Sets values that scale with chosen difficulty to use Death Sentence values.
        </td>
    </tr>
    <tr>
        <th>
            Toughest Assault Always
        </th>
        <td>
            Always uses task data corresponding to 100% heist difficulty progression.
        </td>
    </tr>
    <tr>
        <th>
            Full Lobby Spawns Always
        </th>
        <td>
            Always uses enemy spawn limits corresponding to a full crew, regardless of how many players there are.
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
            Allow Captain Winters to spawn.
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
- Only works as host
- Values (eg, frequency of tougher units) scales with chosen difficulty
- Some difficulties and Level Mods have a mixed response of two different police factions
- Minigun Dozers are added to some scripted spawns and will spawn regardless of the Minigun Dozers setting on Death Wish
- Includes [Give Random Arms to Scripted Spawns](https://modworkshop.net/mod/42111)
- Certain special enemies are given faction-appropriate weaponry - this is cosmetic

-----

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
                <li>Assaults last up to around 4.5 minutes.</li>
                <li>Assault breaks are 25% longer.</li>
                <li>The cooldown between enemies using the same grenade type again is increased by 15%.</li>
                <li>The cooldown between enemies using any grenade is 15 seconds.</li>
                <li>Enemies are more hesitant to push when no grenade is available.</li>
                <li>Cooldown between enemy spawns is increased to 110%.</li>
                <li>Smoke bombs last up to 12 seconds.</li>
                <li>Gas grenade chance builds up much more slowly.</li>
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
                <li>Assaults last up to around 5 minutes.</li>
                <li>The cooldown between enemies using any grenade is 15 seconds.</li>
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
                <li>Assaults last up to around 5 minutes.</li>
                <li>The cooldown between enemies using any grenade is 15 seconds.</li>
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
                <li>Assaults last up to around 6 minutes.</li>
                <li>Assault breaks are 15% shorter.</li>
                <li>The cooldown between enemies using the same grenade type again is decreased by 25%.</li>
                <li>The cooldown between enemies using any grenade is 12 seconds.</li>
                <li>Enemies are slightly less hesitant to push when no grenade is available.</li>
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
                <li>Assaults last up to around 8 minutes.</li>
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
                <li>Assaults will only end by killing enough cops.</li>
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

### Level Mods:

A specific Level Mod can also be forced on any regular American map.

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
                <li>Stealing Xmas</li>
                <li>First World Bank</li>
                <li>Heat Street</li>
                <li>Counterfeit</li>
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
                <li>Ukrainian Prisoner</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            FBI
        </th>
        <td>
            <ul>
                <li>GO Bank</li>
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
                <li>Undercover</li>
                <li>Biker Heist</li>
                <li>Safehouse Raid</li>
                <li>Scarface Mansion</li>
                <li>Prison Nightmare</li>
                <li>Brooklyn 10-10</li>
                <li>Reservoir Dogs</li>
                <li>Alaskan Deal</li>
                <li>Brooklyn Bank</li>
                <li>Shacklethorne Auction</li>
                <li>Black Cat</li>
                <li>Midland Ranch</li>
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
                <li>Lost in Transit</li>
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
                <li>Hostile Takeover</li>
                <li>Crude Awakening</li>
            </ul>
        </td>
    </tr>
</table>

-----

### For modders:

- Mod has global name `ASS` and uses similar names in added hooks and menu-related things
- Mods sets field `ASS.been_there_fucked_that = true` once scripts start running - check for this if checking if the mod is doing its thing
- Hooks into `lib/managers/group_ai_states/groupaistatebase`, `lib/managers/mission/elementspawnenemydummy`, `lib/managers/mission/elementjobstagealternative`, `lib/managers/skirmishmanager`, `lib/modifiers/modifierdozermedic`, `lib/modifiers/modifierdozerminigun`, `lib/modifiers/modifierskulldozers`, `lib/tweak_data/groupaitweakdata`, `lib/tweak_data/skirmishtweakdata`, `lib/units/enemies/cop/copbase`
- Has priority 0

-----

Be trans, shoot pigs - especially on Independence Day

Every month is pride month, motherfucker
