local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local filters_disable = {
	values = ASS.utils.set_difficulty_groups("disable"),
}
local filters_normal_above = {
	values = ASS.utils.set_difficulty_groups("normal_above"),
}
local bikers = {
	Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"),
	Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"),
	Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"),
	Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"),
}
local gangsters = {
	Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
	Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
	Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"),
	Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"),
}
local weapons_amount = {
	values = {
		amount = 5 + math.random(overkill and 10 or 5) - 1,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}

local to_keep = normal and 0 or hard and 1 or 2
local bad_intel = {
	blueprints = { 102928, 102939, 102945, },
	guard = { 102929, 102943, 102949, },
	rossy = { 102930, 102944, 102950, },
}
while to_keep > 0 do
	to_keep = to_keep - 1

	bad_intel[table.random_key(bad_intel)] = nil
end

local i = 0
local function get_filtered_intel()
	i = i + 1

	local to_remove = {}
	for _, ids in pairs(bad_intel) do
		local id = ids[i]

		if not id then
			return nil
		end

		table.insert(to_remove, { id = id, remove = true, })
	end

	return {
		on_executed = to_remove,
	}
end

return {
	[103145] = disable,  -- reenforce, placed only on top of interruptable objectives that already jam randomly, fuck off, not interesting
	[103146] = disable,
	[103149] = disable,
	[103150] = disable,
	[103153] = disable,
	[103154] = disable,
	[103157] = disable,
	[102888] = get_filtered_intel(),  -- remove some useless intel
	[102938] = get_filtered_intel(),
	[102970] = get_filtered_intel(),
	[103021] = {  -- planks amount (vanilla is 7)
		values = {
			amount = overkill and 2 or 4,
			amount_random = overkill and 2 or 4,
		},
	},
	[103216] = weapons_amount,  -- counter operators used for weapons amount
	[103218] = weapons_amount,
	[103219] = weapons_amount,
	[103220] = weapons_amount,
	[103221] = weapons_amount,
	[100422] = { enemy = gangsters, },  -- drug deal cobras
	[103255] = { enemy = gangsters, },
	[103256] = { enemy = gangsters, },
	[103257] = { enemy = gangsters, },
	[102068] = { enemy = bikers, },  -- bikers
	[102069] = { enemy = bikers, },
	[101711] = { enemy = bikers, },
	[101712] = { enemy = bikers, },
	[101713] = { enemy = bikers, },
	[101779] = { enemy = bikers, },
	[101765] = { enemy = bikers, },
	[101766] = { enemy = bikers, },
	[103336] = { enemy = bikers, },
	[103337] = { enemy = bikers, },
	[103338] = { enemy = bikers, },
	[103339] = { enemy = bikers, },
	[101714] = { enemy = bikers, },
	[101716] = { enemy = bikers, },
	[103258] = { enemy = bikers, },
	[103260] = { enemy = bikers, },
	[103261] = { enemy = bikers, },
	[103276] = { enemy = bikers, },
	[103277] = { enemy = bikers, },
	[103278] = { enemy = bikers, },
	[101577] = { enemy = bikers, },
	[101596] = { enemy = bikers, },
	[101609] = { enemy = bikers, },
	[101614] = { enemy = bikers, },
	[101619] = { enemy = bikers, },
	[100950] = { enemy = bikers, },
}
