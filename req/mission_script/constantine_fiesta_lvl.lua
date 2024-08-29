-- fiesta, https://modworkshop.net/mod/43578
local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local cartel_rebels = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_1/ene_cartel_rebel_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_2/ene_cartel_rebel_2"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_3/ene_cartel_rebel_3"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_4/ene_cartel_rebel_4"),
}

return {
	[100042] = {  -- unit type is set to federales after spawning a gazillion cartel units normally, not good
		on_executed_reorder = { 100131, },
	},
	[100172] = {
		values = {
			enabled = false,
		},
	},
	[100199] = {
		on_executed = {
			{ id = 100190, delay = normal and 90 or hard and 60 or 30, delay_rand = normal and 0 or hard and 30 or 60, },
		},
	},
	[100190] = {
		static_spawn = {
			continent = "america",
			tier = "overkill_290",
		},
		enemy = tweak_data.moon.units.marshal_1,
	},
	[100191] = {
		pre_func = function(self)
			local values = self._values

			if values.so_action == "AI_sniper" then
				return
			end

			values.so_action = "AI_sniper"
			values.position = Vector3(7950, -5550, 1650)
			values.rotation = mrotation.yaw(Rotation(90, 0, 0))
			values.align_position = true
			values.align_rotation = true
			values.needs_pos_rsrv = true
			values.path_style = table.get_vector_index(self._PATHING_STYLES, "destination")
			values.path_haste = nil
			values.path_stance = table.get_vector_index(self._POSES, "hos")
			values.forced = nil
			values.repeatable = nil
			values.attitude = table.get_vector_index(self._ATTITUDES, "engage")
		end,
	},
	[100035] = { enemy = tweak_data.moon.units.dozers_no_cs, },
	[100036] = { enemy = tweak_data.moon.units.dozers_no_cs, },
	[100014] = { enemy = cartel_rebels, },
	[100015] = { enemy = cartel_rebels, },
	[100016] = { enemy = cartel_rebels, },
	[100016] = { enemy = cartel_rebels, },
	[100017] = { enemy = cartel_rebels, },
	[100018] = { enemy = cartel_rebels, },
	[100020] = { enemy = cartel_rebels, },
	[100021] = { enemy = cartel_rebels, },
	[100022] = { enemy = cartel_rebels, },
	[100023] = { enemy = cartel_rebels, },
	[100024] = { enemy = cartel_rebels, },
	[100025] = { enemy = cartel_rebels, },
	[100026] = { enemy = cartel_rebels, },
	[100027] = { enemy = cartel_rebels, },
	[100028] = { enemy = cartel_rebels, },
	[100029] = { enemy = cartel_rebels, },
	[100030] = { enemy = cartel_rebels, },
	[100031] = { enemy = cartel_rebels, },
	[100032] = { enemy = cartel_rebels, },
	[100033] = { enemy = cartel_rebels, },
}
