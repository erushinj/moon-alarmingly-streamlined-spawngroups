local special_chance = ASS:get_difficulty_index() * 0.05
local dozer_chance = special_chance * 0.1

local function scripted_swat_squads()
	local rand = math.random()

	return ASS:random_unit(rand < dozer_chance and "dozers_no_cs" or rand < special_chance and "specials_any" or "swats")
end

local left_ambush_dozer_not_medic = math.random() < 0.5
local left_ambush_dozer = left_ambush_dozer_not_medic and "dozers_no_cs" or "dozers_no_mini"
local right_ambush_dozer_not_medic = not left_ambush_dozer_not_medic
local right_ambush_dozer = right_ambush_dozer_not_medic and "dozers_no_cs" or "dozers_no_mini"

-- no security 3. yay.
return {
	-- outside/office/storehouse guards (beginning)
	[100670] = { enemy = ASS:random_unit("securitys_light") },
	[102693] = { enemy = ASS:random_unit("securitys_light") },
	[102679] = { enemy = ASS:random_unit("securitys_light") },
	[102227] = { enemy = ASS:random_unit("securitys_light") },
	[102558] = { enemy = ASS:random_unit("securitys_light") },
	[102272] = { enemy = ASS:random_unit("securitys_light") },
	[102772] = { enemy = ASS:random_unit("securitys_light") },

	-- checkpoint after retrieving vlad
	[100675] = { enemy = ASS:random_unit("securitys_light") },

	-- first choice
	[102297] = { enemy = ASS:random_unit("securitys_light") },
	[102631] = { enemy = ASS:random_unit("securitys_light") },

	-- leading up to office/storehouse
	[102424] = { enemy = ASS:random_unit("securitys_light") },
	[102536] = { enemy = ASS:random_unit("securitys_light") },
	[102746] = { enemy = ASS:random_unit("securitys_light") },
	[102590] = { enemy = ASS:random_unit("securitys_light") },

	-- office/storehouse (middle)
	[102794] = { enemy = ASS:random_unit("securitys_light") },
	[102480] = { enemy = ASS:random_unit("securitys_light") },

	-- second choice
	[102985] = { enemy = ASS:random_unit("securitys_light") },

	-- leading up to dock
	[102415] = { enemy = ASS:random_unit("securitys_light") },
	[102927] = { enemy = ASS:random_unit("securitys_light") },
	[102351] = { enemy = ASS:random_unit("securitys_light") },
	[102527] = { enemy = ASS:random_unit("securitys_light") },

	-- dock (end)
	[102817] = { enemy = ASS:random_unit("securitys_light") },
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
	[101764] = { enemy = ASS:random_unit(left_ambush_dozer) },
	[101777] = { enemy = ASS:random_unit(right_ambush_dozer) },
	[101766] = { enemy = ASS:random_unit(left_ambush_dozer) },
	[101774] = { enemy = ASS:random_unit(right_ambush_dozer) },
	[101767] = { enemy = ASS:random_unit(left_ambush_dozer) },
	[101772] = { enemy = ASS:random_unit(right_ambush_dozer) },
	[101770] = { enemy = ASS:random_unit(left_ambush_dozer) },
	[101771] = { enemy = ASS:random_unit(right_ambush_dozer) },
}
