local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local van_spawns = ASS.utils.scripted_swat_squads({
	hard_target = normal and 1 or hard and 2 or 3,
	hard_spawn = "dozers_no_mini",
	normal_spawn = "specials_any",
})

local thug_fex = {
	enemy = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
	run_func_on_unit = function(unit)
		local unit_data = alive(unit) and unit:unit_data()

		if unit_data then
			unit_data.has_alarm_pager = true
		end
	end,
}


return {
	[103275] = { enemy = van_spawns(), },
	[103276] = { enemy = van_spawns(), },
	[103277] = { enemy = van_spawns(), },
	[100673] = thug_fex,
	[100674] = thug_fex,
	[100675] = thug_fex,
	[100676] = thug_fex,
	[100677] = thug_fex,
	[100678] = thug_fex,
	[100679] = thug_fex,
	[101135] = thug_fex,
	[101137] = thug_fex,
	[101139] = thug_fex,
	[101143] = thug_fex,
	[101149] = thug_fex,
	[101809] = thug_fex,
	[101812] = thug_fex,
	[101814] = thug_fex,
	[101817] = thug_fex,
	[101819] = thug_fex,
	[101746] = thug_fex,
	[101748] = thug_fex,
	[101750] = thug_fex,
	[101828] = thug_fex,
	[101832] = thug_fex,
	[101864] = thug_fex,
	[101865] = thug_fex,
	[101853] = thug_fex,
	[101884] = thug_fex,
	[101861] = thug_fex,
	[101867] = thug_fex,
	[101889] = thug_fex,
	[101902] = thug_fex,
	[101957] = thug_fex,
	[101960] = thug_fex,
	[101963] = thug_fex,
	[101966] = thug_fex,
	[101968] = thug_fex,
	[102750] = thug_fex,  -- basement american guy
}
