local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local friends = {  -- vips
	Idstring("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"),
	Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"),
	Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"),
}
local cartel_security = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_security_1/ene_cartel_security_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_security_2/ene_cartel_security_2"),
}

return {
	[100029] = {  -- unit type is set to federales after spawning cartel units normally, probably not good
		on_executed_reorder = { 100279, },
	},
	[100386] = { enemy = cartel_security, },
	[100252] = { enemy = cartel_security, },
	[100253] = { enemy = cartel_security, },
	[100254] = { enemy = cartel_security, },
	[100251] = { enemy = cartel_security, },
	[100385] = { enemy = cartel_security, },
	[100385] = { enemy = cartel_security, },
	[100062] = { enemy = cartel_security, },
	[100027] = { enemy = cartel_security, },
	[100063] = { enemy = cartel_security, },
	[100025] = { enemy = cartel_security, },
	[100023] = { enemy = cartel_security, },
	[100024] = { enemy = cartel_security, },
	[100064] = { enemy = cartel_security, },
	[100028] = { enemy = cartel_security, },
	[100007] = { enemy = cartel_security, },
	[100022] = { enemy = cartel_security, },
	[100049] = { enemy = cartel_security, },
	[100026] = { enemy = cartel_security, },
	[100073] = { enemy = cartel_security, },
	[100077] = { enemy = cartel_security, },
	[100079] = { enemy = cartel_security, },
	[100081] = { enemy = cartel_security, },
	[100083] = { enemy = cartel_security, },
	[100085] = { enemy = cartel_security, },
	[100087] = { enemy = cartel_security, },
	[100090] = { enemy = cartel_security, },
	[100092] = { enemy = cartel_security, },
	[100094] = { enemy = cartel_security, },
	[100096] = { enemy = cartel_security, },
	[100098] = { enemy = cartel_security, },
	[100100] = { enemy = cartel_security, },
	[100102] = { enemy = cartel_security, },
	[100241] = { enemy = friends, },
	[100242] = { enemy = friends, },
	[100243] = { enemy = friends, },
	[100244] = { enemy = friends, },
	-- [100433] = { enemy = friends, },
	[100205] = { enemy = friends, },
	[100234] = { enemy = friends, },
	[100235] = { enemy = friends, },
	[100236] = { enemy = friends, },
	[100237] = { enemy = friends, },
	[100239] = { enemy = friends, },
	[100015] = { enemy = friends, },
	[100016] = { enemy = friends, },
	[100017] = { enemy = friends, },
	[100018] = { enemy = friends, },
	[100019] = { enemy = friends, },
	[100020] = { enemy = friends, },
	[100021] = { enemy = friends, },
	[100150] = { enemy = friends, },
	[100151] = { enemy = friends, },
	[100183] = { enemy = friends, },
	[100184] = { enemy = friends, },
	[100185] = { enemy = friends, },
	[100275] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100280] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100274] = { enemy = tweak_data.levels:moon_random_unit("specials_shield_clk"), },
	[100277] = { enemy = tweak_data.levels:moon_random_unit("specials_shield_clk"), },
	[100431] = { enemy = tweak_data.levels:moon_random_unit("specials_no_clk"), },
	[100432] = { enemy = tweak_data.levels:moon_random_unit("specials_no_clk"), },
}
