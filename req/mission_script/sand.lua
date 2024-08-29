local triad_1 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1")
local triad_2 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2")
local triad_3 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3")
local triad_4 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4")
local triad_5 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5")
local triads = { triad_1, triad_2, triad_3, triad_4, triad_5, }
local triads_light = { triad_1, triad_2, triad_3, triad_4, }
local triads_heavy = { triad_2, triad_3, triad_5, }
local triads_grey = { triad_1, triad_4, }
local triads_red = { triad_2, triad_3, }

-- no security 3. yay.
local securitys_light = tweak_data.moon.units.securitys_light
local dozers_no_mini = tweak_data.moon.units.dozers_no_mini

return {
	[100549] = {  -- increase power cut delay from literally fucking 0
		on_executed = {
			{ id = 103658, delay = 10, delay_rand = 10, },
		}
	},
	[103827] = {
		on_executed = {
			{ id = 103828, delay = 10, delay_rand = 10, },
		}
	},
	[101782] = { enemy = triads, },  -- triads, conversation havers
	[101768] = { enemy = triads, },
	[101724] = { enemy = triads, },
	[101719] = { enemy = triads, },
	[101785] = { enemy = triads, },
	[101776] = { enemy = triads, },
	[102368] = { enemy = triads_red, },  -- in warehouses
	[102709] = { enemy = triads_red, },
	[102956] = { enemy = triads_red, },
	[104901] = { enemy = triads_red, },  -- gassed guy
	[104647] = { enemy = triads_light, },  -- patrollers near beginning
	[104706] = { enemy = triads_light, },
	[105626] = { enemy = triads_light, },
	[104744] = { enemy = triads_light, },
	[102863] = { enemy = triads_light, },
	[104219] = { enemy = triads, },  -- patrollers in middle
	[102897] = { enemy = triads, },
	[101790] = { enemy = triads, },  -- triads
	[100670] = { enemy = securitys_light, },  -- guards, outside/office/storehouse (beginning)
	[102693] = { enemy = securitys_light, },
	[102679] = { enemy = securitys_light, },
	[102227] = { enemy = securitys_light, },
	[102558] = { enemy = securitys_light, },
	[102272] = { enemy = securitys_light, },
	[102772] = { enemy = securitys_light, },
	[100675] = { enemy = securitys_light, },  -- checkpoint after retrieving vlad
	[102297] = { enemy = securitys_light, },  -- first fork in the road
	[102631] = { enemy = securitys_light, },
	[102424] = { enemy = securitys_light, },  -- leading up to office/storehouse
	[102536] = { enemy = securitys_light, },
	[102746] = { enemy = securitys_light, },
	[102590] = { enemy = securitys_light, },
	[102794] = { enemy = securitys_light, },  -- office/storehouse (middle)
	[102480] = { enemy = securitys_light, },
	[102985] = { enemy = securitys_light, },  -- second fork in the road
	[102415] = { enemy = securitys_light, },  -- leading up to dock
	[102927] = { enemy = securitys_light, },
	[102351] = { enemy = securitys_light, },
	[102527] = { enemy = securitys_light, },
	[102817] = { enemy = securitys_light, },  -- dock (end)
	[102463] = { enemy = securitys_light, },
	[101764] = { enemy = dozers_no_mini, },  -- ambush dozers
	[101777] = { enemy = dozers_no_mini, },
	[101766] = { enemy = dozers_no_mini, },
	[101774] = { enemy = dozers_no_mini, },
	[101767] = { enemy = dozers_no_mini, },
	[101772] = { enemy = dozers_no_mini, },
	[101770] = { enemy = dozers_no_mini, },
	[101771] = { enemy = dozers_no_mini, },
}
