# Alarmingly Streamlined Spawngroups

Simultaneously simplifies and complexifies enemy spawn groups

Also known as ASS, since it probably is

-----

An enemy spawn group mod, crafted and refined for this one's tastes, with two distinct sets of simple yet alarming groups

Both sets of groups mix in occasional specials with regular spawns, allow dangerous pairings of specials, and make liberal use of neglected enemy types

Requires [Streamlined Heisting](https://github.com/segabl/pd2-streamlined-heisting) - not all changes are ideal for a vanilla game

The mod's difficulty is also customizable to an extent.

-----

### Settings:
<table>
    <tr>
        <th>
            Name
        </th>
        <th>
            Description
        </th>
    </tr>
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
            Make some levels use a fixed response faction regardless of difficulty.
        </td>
    </tr>
    <tr>
        <th>
            Vanilla Styled Assaults
        </th>
        <td>
            Use a different set of spawn groups made in the style of Streamlined Heisting's default groups.
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
            Intensity
        </th>
        <td>
            Forces certain scaling values to the maximum.
        </td>
    </tr>
    <tr>
        <th>
            Minigun Dozers on Death Wish
        </th>
        <td>
            Allow Minigun Dozers to spawn on Death Wish difficulty.
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
- Values (eg, frequency of tougher units) scales with difficulty
- Default spawn group set is made in the style of the original spawn groups
- Marshal Marksmen are more common and spawn sooner on higher difficulties
- Some difficulties and Level Mods have a mixed response of two different police factions
- Includes [Give Random Arms to Scripted Spawns](https://modworkshop.net/mod/42111)
- Certain special enemies use faction-appropriate weaponry where possible - this is cosmetic

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
                <li>The cooldown between enemies using grenades is increased 15%.</li>
                <li>Enemies spawn 10% slower.</li>
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
                <li>The cooldown between enemies using grenades is decreased by 25%.</li>
                <li>Enemies spawn 25% faster.</li>
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
                <li>Tougher units are more likely to spawn.</li>
                <li>Assaults last up to around 8 minutes.</li>
                <li>Assault breaks are 15% shorter.</li>
                <li>The cooldown between enemies using grenades is decreased by 75%.</li>
                <li>Enemies spawn 75% faster.</li>
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
                <li>Tougher units are exponentially more likely to spawn.</li>
                <li>Assaults will only end by killing enough cops.</li>
                <li>Assault breaks may as well not exist.</li>
                <li>The cooldown between enemies using grenades is removed.</li>
                <li>Enemies spawn as fast as the game will allow.</li>
                <li>Smoke bombs last 60 seconds.</li>
                <li>Gas grenades are always used if available.</li>
                <li>Special limits are increased by 300%.</li>
            </ul>
        </td>
    </tr>
</table>

### Intensities:

<table>
    <tr>
        <th>
            No Soap Dropping (default)
        </th>
        <td>
            <ul>
                <li>Original values.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Drop the Soap
        </th>
        <td>
            <ul>
                <li>Uses Death Sentence values.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Pick Up the Soap
        </th>
        <td>
            <ul>
                <li>Uses Death Sentence values.</li>
                <li>Heist difficulty progression is always at max.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th>
            Fuck Me Sideways
        </th>
        <td>
            <ul>
                <li>Uses Death Sentence values.</li>
                <li>Heist difficulty progression is always at max.</li>
                <li>Always uses 4 player spawns.</li>
            </ul>
        </td>
    </tr>
</table>

### Level Mods:

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
                <li>Hotline Miami</li>
                <li>Art Gallery</li>
                <li>Hoxton Breakout</li>
                <li>Hoxton Revenge (also featuring the Ready Team guards)</li>
                <li>Meltdown</li>
                <li>Biker Heist</li>
                <li>Safehouse Raid</li>
                <li>Lab Rats</li>
                <li>Prison Nightmare</li>
                <li>White Xmas</li>
                <li>Santa's Workshop</li>
                <li>Undercover</li>
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
                <li>No Mercy</li>
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
                <li>Hostile Takeover</li>
            </ul>
        </td>
    </tr>
</table>

-----

### For modders:

- Mod has global name `ASS` and uses similar names in added hooks and menu-related things
- Hooks into `lib/managers/group_ai_states/groupaistatebase`, `lib/managers/mission/elementspawnenemydummy`, `lib/managers/mission/elementjobstagealternative`, `lib/tweak_data/groupaitweakdata`, `lib/units/enemies/cop/copbase`
- Has priority 0

-----

If any crashes or other issues occur, report them

This was mostly only tested in singleplayer before release
