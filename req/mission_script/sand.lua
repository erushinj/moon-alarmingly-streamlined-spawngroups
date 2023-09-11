local special_chance = ASS:get_var("difficulty_index") * 0.05
local dozer_chance = special_chance * 0.1

local function scripted_swat_squads()
	local rand = math.random()

	return ASS:random_unit(rand < dozer_chance and "dozers_no_cs" or rand < special_chance and "specials_any" or "swats")
end

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
return {
	-- triads
	[101782] = { enemy = triads },  -- conversation havers
	[101768] = { enemy = triads },
	[101724] = { enemy = triads },
	[101719] = { enemy = triads },
	[101785] = { enemy = triads },
	[101776] = { enemy = triads },
	[102368] = { enemy = triads_red },  -- in warehouses
	[102709] = { enemy = triads_red },
	[102956] = { enemy = triads_red },
	[104901] = { enemy = triads_red },  -- one spot for gassed guy (others instanced ?)
	[104647] = { enemy = triads_light },  -- patrollers near beginning
	[104706] = { enemy = triads_light },
	[105626] = { enemy = triads_light },
	[104744] = { enemy = triads_light },
	[102863] = { enemy = triads_light },
	[104219] = { enemy = triads },  -- patrollers in middle
	[102897] = { enemy = triads },

	[101790] = { enemy = triads },  -- triads

	-- guards
	[100670] = { enemy = ASS:random_unit("securitys_light") },  -- outside/office/storehouse (beginning)
	[102693] = { enemy = ASS:random_unit("securitys_light") },
	[102679] = { enemy = ASS:random_unit("securitys_light") },
	[102227] = { enemy = ASS:random_unit("securitys_light") },
	[102558] = { enemy = ASS:random_unit("securitys_light") },
	[102272] = { enemy = ASS:random_unit("securitys_light") },
	[102772] = { enemy = ASS:random_unit("securitys_light") },
	[100675] = { enemy = ASS:random_unit("securitys_light") },  -- checkpoint after retrieving vlad
	[102297] = { enemy = ASS:random_unit("securitys_light") },  -- first fork in the road
	[102631] = { enemy = ASS:random_unit("securitys_light") },
	[102424] = { enemy = ASS:random_unit("securitys_light") },  -- leading up to office/storehouse
	[102536] = { enemy = ASS:random_unit("securitys_light") },
	[102746] = { enemy = ASS:random_unit("securitys_light") },
	[102590] = { enemy = ASS:random_unit("securitys_light") },
	[102794] = { enemy = ASS:random_unit("securitys_light") },  -- office/storehouse (middle)
	[102480] = { enemy = ASS:random_unit("securitys_light") },
	[102985] = { enemy = ASS:random_unit("securitys_light") },  -- second fork in the road
	[102415] = { enemy = ASS:random_unit("securitys_light") },  -- leading up to dock
	[102927] = { enemy = ASS:random_unit("securitys_light") },
	[102351] = { enemy = ASS:random_unit("securitys_light") },
	[102527] = { enemy = ASS:random_unit("securitys_light") },
	[102817] = { enemy = ASS:random_unit("securitys_light") },  -- dock (end)
	[102463] = { enemy = ASS:random_unit("securitys_light") },

	-- scripted swat squads
	-- though..this doesnt seem like it does anything ?
	-- are these unused or set up funky ?
	[105017] = { enemy = scripted_swat_squads() },
	[105016] = { enemy = scripted_swat_squads() },
	[105015] = { enemy = scripted_swat_squads() },
	[105014] = { enemy = scripted_swat_squads() },
	[105043] = { enemy = scripted_swat_squads() },
	[105044] = { enemy = scripted_swat_squads() },
	[105045] = { enemy = scripted_swat_squads() },
	[105046] = { enemy = scripted_swat_squads() },
	[105066] = { enemy = scripted_swat_squads() },
	[105067] = { enemy = scripted_swat_squads() },
	[105068] = { enemy = scripted_swat_squads() },
	[105069] = { enemy = scripted_swat_squads() },
	[105021] = { enemy = scripted_swat_squads() },
	[105020] = { enemy = scripted_swat_squads() },
	[105018] = { enemy = scripted_swat_squads() },
	[105019] = { enemy = scripted_swat_squads() },
	[105047] = { enemy = scripted_swat_squads() },
	[105048] = { enemy = scripted_swat_squads() },
	[105049] = { enemy = scripted_swat_squads() },
	[105050] = { enemy = scripted_swat_squads() },
	[105058] = { enemy = scripted_swat_squads() },
	[105059] = { enemy = scripted_swat_squads() },
	[105060] = { enemy = scripted_swat_squads() },
	[105061] = { enemy = scripted_swat_squads() },
	[105025] = { enemy = scripted_swat_squads() },
	[105024] = { enemy = scripted_swat_squads() },
	[105023] = { enemy = scripted_swat_squads() },
	[105022] = { enemy = scripted_swat_squads() },
	[105051] = { enemy = scripted_swat_squads() },
	[105052] = { enemy = scripted_swat_squads() },
	[105053] = { enemy = scripted_swat_squads() },
	[105054] = { enemy = scripted_swat_squads() },
	[103785] = { enemy = scripted_swat_squads() },
	[105055] = { enemy = scripted_swat_squads() },
	[105056] = { enemy = scripted_swat_squads() },
	[105057] = { enemy = scripted_swat_squads() },
	[105009] = { enemy = scripted_swat_squads() },
	[105008] = { enemy = scripted_swat_squads() },
	[105006] = { enemy = scripted_swat_squads() },
	[105007] = { enemy = scripted_swat_squads() },
	[105035] = { enemy = scripted_swat_squads() },
	[105036] = { enemy = scripted_swat_squads() },
	[105037] = { enemy = scripted_swat_squads() },
	[105038] = { enemy = scripted_swat_squads() },
	[105062] = { enemy = scripted_swat_squads() },
	[105063] = { enemy = scripted_swat_squads() },
	[105064] = { enemy = scripted_swat_squads() },
	[105065] = { enemy = scripted_swat_squads() },
	[105013] = { enemy = scripted_swat_squads() },
	[105012] = { enemy = scripted_swat_squads() },
	[105011] = { enemy = scripted_swat_squads() },
	[105010] = { enemy = scripted_swat_squads() },
	[105039] = { enemy = scripted_swat_squads() },
	[105040] = { enemy = scripted_swat_squads() },
	[105041] = { enemy = scripted_swat_squads() },
	[105042] = { enemy = scripted_swat_squads() },
	[105037] = { enemy = scripted_swat_squads() },
	[105039] = { enemy = scripted_swat_squads() },
	[105032] = { enemy = scripted_swat_squads() },
	[103784] = { enemy = scripted_swat_squads() },

	-- ambush dozers
	[101764] = { enemy = ASS:random_unit("dozers_no_mini") },
	[101777] = { enemy = ASS:random_unit("dozers_no_mini") },
	[101766] = { enemy = ASS:random_unit("dozers_no_mini") },
	[101774] = { enemy = ASS:random_unit("dozers_no_mini") },
	[101767] = { enemy = ASS:random_unit("dozers_no_mini") },
	[101772] = { enemy = ASS:random_unit("dozers_no_mini") },
	[101770] = { enemy = ASS:random_unit("dozers_no_mini") },
	[101771] = { enemy = ASS:random_unit("dozers_no_mini") },
}
