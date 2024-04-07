local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local get_table_index_func = ASS:require("get_table_index_func", true)
local scripted_swat_squads = ASS:require("scripted_swat_squads", true)

local outside_cops = tweak_data.levels:moon_random_unit("swats_heavys")
local inside_cops_ids = get_table_index_func({
	100821,
	100822,
	100825,
	100827,
	100829,
	100831,
	100834,
	100836,
	100838,
	100840,
	100842,
	100844,
	100845,
})
local inside_cops = scripted_swat_squads({
	hard_target = overkill and 4 or 2,
	hard_spawn = "dozers_no_cs",
	normal_spawn = "heavys",
})
local inside_cops_so = { so_access_filter = "any", }

local prisoners = {
	Idstring("units/pd2_dlc_wwh/characters/ene_male_crew_01/ene_male_crew_01"),
	Idstring("units/pd2_dlc_wwh/characters/ene_male_crew_02/ene_male_crew_02"),
}
local prisoners_1 = get_table_index_func(clone(prisoners))
local prisoners_2 = get_table_index_func(clone(prisoners))
local prisoners_3 = get_table_index_func(clone(prisoners))
local prisoners_4 = get_table_index_func(prisoners)
local prisoners_ids_1 = get_table_index_func({ 101076, 101074, })
local prisoners_ids_2 = get_table_index_func({ 101077, 101078, })
local prisoners_ids_3 = get_table_index_func({ 101079, 101080, })
local prisoners_ids_4 = get_table_index_func({ 101081, 101082, })
local constantine_backup = {
	enemy = tweak_data.levels:moon_random_unit("swats"),
	static_spawn = {
		continent = "actual_russia",
		tier = "normal",
	},
}

return {
	[100448] = {  -- players spawned
		on_executed = {
			-- { id = 100691, delay = 0, },  -- diff 0.5 (normally 0s)
			{ id = 100692, remove = true, },  -- diff 0.75 (normally 30s)
			{ id = 100693, remove = true, },  -- diff 1 (normally 80s)
		},
	},
	[100132] = {  -- all trucks opened
		on_executed = {
			{ id = 100692, delay = 0, },
		},
	},
	[100405] = {  -- "delay second objective" (in the warehouse)
		on_executed = {
			{ id = 100693, delay = 0, },
		},
	},
	[100790] = {  -- add warehouse spawn points, also spawns..28 swats for some reason
		on_executed = {
			{ id = 101123, remove = true, },
			{ id = 101184, remove = true, },
			{ id = 101189, remove = true, },
			{ id = 101194, remove = true, },
			{ id = 101199, remove = true, },
			{ id = 101204, remove = true, },
			{ id = 101209, remove = true, },
		},
	},
	[100823] = inside_cops_so,
	[100824] = inside_cops_so,
	[100826] = inside_cops_so,
	[100828] = inside_cops_so,
	[100830] = inside_cops_so,
	[100832] = inside_cops_so,
	[100833] = inside_cops_so,
	[100835] = inside_cops_so,
	[100837] = inside_cops_so,
	[100839] = inside_cops_so,
	[100841] = inside_cops_so,
	[100843] = inside_cops_so,
	[100846] = inside_cops_so,
	[101117] = {  -- sniper delay
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self._original_on_executed = {
					{ id = 101114, delay = 45, delay_rand = overkill and 15 or 45, },
				}
			end
		end,
	},
	[101114] = {  -- sniper
		values = {
			participate_to_group_ai = false,
		},
	},
	[101140] = constantine_backup,
	[101141] = constantine_backup,
	[101142] = constantine_backup,
	[101143] = constantine_backup,
	[101213] = constantine_backup,
	[101214] = constantine_backup,
	[101215] = constantine_backup,
	[101216] = constantine_backup,
	[100435] = { enemy = outside_cops, },
	[100437] = { enemy = outside_cops, },
	[100442] = { enemy = outside_cops, },
	[100443] = { enemy = outside_cops, },
	[100444] = { enemy = outside_cops, },
	[100445] = { enemy = outside_cops, },
	[100446] = { enemy = outside_cops, },
	[100564] = { enemy = outside_cops, },
	[100565] = { enemy = outside_cops, },
	[100566] = { enemy = outside_cops, },
	[100567] = { enemy = outside_cops, },
	[100568] = { enemy = outside_cops, },
	[100569] = { enemy = outside_cops, },
	[100819] = { enemy = outside_cops, },
	[100820] = { enemy = outside_cops, },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[inside_cops_ids()] = { enemy = inside_cops(), },
	[prisoners_ids_1()] = { enemy = prisoners_1(), },
	[prisoners_ids_1()] = { enemy = prisoners_1(), },
	[prisoners_ids_2()] = { enemy = prisoners_2(), },
	[prisoners_ids_2()] = { enemy = prisoners_2(), },
	[prisoners_ids_3()] = { enemy = prisoners_3(), },
	[prisoners_ids_3()] = { enemy = prisoners_3(), },
	[prisoners_ids_4()] = { enemy = prisoners_4(), },
	[prisoners_ids_4()] = { enemy = prisoners_4(), },
}
