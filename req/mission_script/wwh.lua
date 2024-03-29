local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local get_table_index_func = ASS:require("get_table_index_func", true)
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local filters_disable = set_difficulty_groups("disable")
local filters_normal_above = set_difficulty_groups("normal_above")
local participate_to_group_ai = {
	participate_to_group_ai = true,
}
local no_participate_to_group_ai = {
	participate_to_group_ai = false,
}

local rope_hunt = {
	hunt = true,
}
local intro_dozer_walk_spot_so = {
	so_access_filter = "any",
}
local intro_sniper_so = {
	so_access_filter = "snipers",
}
local intro_sniper_unit = {
	enemy = tweak_data.levels:moon_units().marshal_1,
	values = no_participate_to_group_ai,
}

local leo_kate_static_spawn = { continent = "america", tier = "normal", }
local leo_kate_ids = get_table_index_func({ 101243, 101244, })
local leo_kate = get_table_index_func(clone(tweak_data.levels:moon_random_unit("cops")))
local function get_leo_kate()
	return {
		enemy = leo_kate(),
		static_spawn = leo_kate_static_spawn,
		values = no_participate_to_group_ai,
	}
end

local ambush_shields = { values = no_participate_to_group_ai, }
local ambush_dozers_close = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), }
local ambush_dozers_sniper = ambush_dozers_close

return {
	[100718] = rope_hunt,  -- mooring ropes, trigger endless assault on completing interaction with any of them
	[100719] = rope_hunt,
	[100722] = rope_hunt,
	[100759] = rope_hunt,
	[100240] = {  -- ambush hunt so, add missing dozers
		modify_list_value = {
			spawn_instigator_ids = {
				[100427] = true,
				[100428] = true,
				[100431] = true,
				[100432] = true,
			},
		},
	},
	[100329] = {  -- beginning harassers amount on the ship
		values = {
			amount = overkill and 8 or 4,
			amount_random = 2,
		},
	},
	[100297] = intro_dozer_walk_spot_so,
	[100307] = intro_dozer_walk_spot_so,
	[100361] = {  -- start ambush
		on_executed = {
			{ id = 100367, delay = 0, },  -- snipers
			{ id = 100369, delay = 0, },  -- "outside" dozers
		},
	},
	[100362] = {  -- random a event
		values = {
			amount = overkill and 2 or 1,
		},
		on_executed = {
			{ id = 100367, remove = true, },
			{ id = 100370, delay = 0, },  -- shield wall
		},
	},
	[100363] = {  -- random b event, disable and move all remaining events to random a event
		values = {
			enabled = false,
			on_executed = {},
		},
	},
	[100364] = {  -- random c event (smoke)
		pre_func = function(self)
			if self._values.on_executed_original then
				return
			end

			local smoke_id, no_smoke_id = 100373, 100392
			local smoke_chance = normal and 0.4 or hard and 0.6 or 0.8
			local id = math.random() < smoke_chance and smoke_id or no_smoke_id

			self._values.on_executed_original = self._values.on_executed
			self._values.on_executed = {
				{ id = id, delay = 0, },
			}
		end,
	},
	[100353] = { values = filters_disable, },  -- ambush filters, n/h
	[100354] = { values = filters_disable, },  -- vh/ovk
	[100355] = { values = filters_normal_above, },  -- mh/dw, lots of stuff connected, use this
	[100356] = { values = filters_disable, },  -- ds
	[100389] = {  -- snipers count (replaced with marshals)
		values = {
			amount = overkill and 6 or 3,
			amount_random = 3,
		},
	},
	[100390] = {  -- cloakers count
		values = {
			amount = 2,
			amount_random = overkill and 2 or 0,
		},
	},
	[100396] = intro_sniper_so,
	[100397] = intro_sniper_so,
	[100398] = intro_sniper_so,
	[100399] = intro_sniper_so,
	[100401] = intro_sniper_so,
	[100403] = intro_sniper_so,
	[100405] = intro_sniper_so,
	[100407] = intro_sniper_so,
	[100410] = intro_sniper_so,
	[100393] = intro_sniper_unit,
	[100394] = intro_sniper_unit,
	[100395] = intro_sniper_unit,
	[100400] = intro_sniper_unit,
	[100402] = intro_sniper_unit,
	[100404] = intro_sniper_unit,
	[100406] = intro_sniper_unit,
	[100408] = intro_sniper_unit,
	[100409] = intro_sniper_unit,
	[100464] = ambush_shields,  -- ambush, shields
	[100465] = ambush_shields,
	[100466] = ambush_shields,
	[100467] = ambush_shields,
	[100468] = ambush_shields,
	[100469] = ambush_shields,
	[100470] = ambush_shields,
	[100471] = ambush_shields,
	[100492] = ambush_dozers_close,  -- dozers
	[100498] = ambush_dozers_close,
	[100500] = ambush_dozers_close,
	[100501] = ambush_dozers_close,
	[100427] = ambush_dozers_sniper,  -- hidden dozers (they start closer to the players now and receive AI_sniper SO temporarily)
	[100428] = ambush_dozers_sniper,
	[100431] = ambush_dozers_sniper,
	[100432] = ambush_dozers_sniper,
	[leo_kate_ids()] = get_leo_kate(),  -- "There Was Room For Two" cops
	[leo_kate_ids()] = get_leo_kate(),
}
