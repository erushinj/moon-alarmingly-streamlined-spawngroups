local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

local swats_heavys = {
	enemy = tweak_data.moon.units.swats_heavys,
	static_spawn = {
		continent = "bo_scripted",
	},
}
local shield = {
	enemy = tweak_data.moon.units.shield,
	static_spawn = swats_heavys.static_spawn,
}
local dozers_any = {
	enemy = tweak_data.moon.units.dozers_any,
}
local dozers_no_med = {
	enemy = tweak_data.moon.units.dozers_no_med,
}
local diff = {
	values = {
		difficulty = 0.5,
	},
}
local round_spawn = {
	values = {
		amount = overkill and 2 or 1,
	},
}
local garage_dozer_chance_add = {
	values = {
		chance = normal and 0 or hard and 10 or 20,
	},
}
local garage_dozer_chance = {
	values = {
		chance = 15,
	},
}

return {
	[100030] = {  -- change diff trigger from startup to players spawned, always use bo faction
		on_executed = {
			{ id = 101379, delay = 0, },
			{ id = 100308, delay = 1.5, },
		},
	},
	[100000] = {
		on_executed = {
			{ id = 100308, remove = true, },
		},
	},
	[101534] = {
		on_executed = {
			{ id = 101379, remove = true, },
		},
	},
	[101104] = round_spawn,
	[101122] = round_spawn,
	[101110] = round_spawn,
	[101116] = round_spawn,
	[100467] = garage_dozer_chance_add,
	[100465] = garage_dozer_chance_add,
	[100462] = garage_dozer_chance_add,
	[100464] = garage_dozer_chance_add,
	[100451] = garage_dozer_chance,
	[100447] = garage_dozer_chance,
	[100455] = garage_dozer_chance,
	[100431] = garage_dozer_chance,
	[100435] = garage_dozer_chance,
	[100421] = garage_dozer_chance,
	[100426] = garage_dozer_chance,
	[100443] = garage_dozer_chance,
	[100439] = garage_dozer_chance,
	[100459] = garage_dozer_chance,
	[100308] = diff,  -- 100% difficulty from the start very epic
	[100309] = diff,
	[100310] = diff,
	[100311] = diff,
	[100497] = dozers_any,  -- bo backup dozers
	[101233] = dozers_any,
	[100449] = dozers_no_med,  -- garage dozers
	[100445] = dozers_no_med,
	[100453] = dozers_no_med,
	[100429] = dozers_no_med,
	[100433] = dozers_no_med,
	[100422] = dozers_no_med,
	[100424] = dozers_no_med,
	[100441] = dozers_no_med,
	[100437] = dozers_no_med,
	[100457] = dozers_no_med,
	[101053] = dozers_any,  -- "X round" dozers
	[101054] = dozers_any,
	[101094] = dozers_any,
	[101097] = dozers_any,
	[101063] = dozers_any,
	[101064] = dozers_any,
	[101078] = dozers_any,
	[101079] = dozers_any,
	[101057] = swats_heavys,
	[101058] = swats_heavys,
	[101059] = swats_heavys,
	[101060] = swats_heavys,
	[101061] = swats_heavys,
	[101090] = swats_heavys,
	[101091] = swats_heavys,
	[101099] = swats_heavys,
	[101101] = swats_heavys,
	[101102] = swats_heavys,
	[101068] = swats_heavys,
	[101070] = swats_heavys,
	[101072] = swats_heavys,
	[101074] = swats_heavys,
	[101069] = swats_heavys,
	[101082] = swats_heavys,
	[101084] = swats_heavys,
	[101085] = swats_heavys,
	[101088] = swats_heavys,
	[101076] = swats_heavys,
	[101048] = shield,
	[101049] = shield,
	[101050] = shield,
	[101051] = shield,
	[101052] = shield,
	[101092] = shield,
	[101093] = shield,
	[101098] = shield,
	[101100] = shield,
	[101103] = shield,
	[101066] = shield,
	[101067] = shield,
	[101071] = shield,
	[101073] = shield,
	[101075] = shield,
	[101081] = shield,
	[101083] = shield,
	[101086] = shield,
	[101087] = shield,
	[101089] = shield,
	[100500] = shield,
	[100501] = shield,
}
