local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local filters_normal_above = ASS.utils.set_difficulty_groups("normal_above")
local filters_disable = ASS.utils.set_difficulty_groups("disable")
local civs_casino = ASS.utils.try_pick_bobblehead_bob(nil, {
	Idstring("units/pd2_dlc_casino/characters/civ_male_business_casino_2/civ_male_business_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_1/civ_male_casino_1"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_2/civ_male_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_3/civ_male_casino_3"),
})
local patches = {
	gambling_table = table.set(100008, 100010),
	spa = table.set(100099),
	security_room = table.set(100030),
	control_room = {
		civ = table.set(100067),
		triad = table.set(100030),
	},
	harasser = table.set(100016, 100017, 100018),
	helicopter_enemies = {
		filters_disable = table.set(100027, 100028, 100041),
		filters_normal_above = table.set(100026),
		swats = table.set(100010, 100011, 100012, 100013),
	},
}


local function control_room_func(result)
	local control_room = patches.control_room
	local civs = {
		Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
		Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
		Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
		Idstring("units/pd2_dlc_chas/characters/civ_male_asian_casual_2/civ_male_asian_casual_2"),
	}
	local triads = {
		Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"),
		Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"),
		Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"),
	}

	for _, element in pairs(result.default.elements) do
		local id = element.id

		if control_room.civ[id] then
			element.values.moon_data = {
				enemy = civs,
			}
		elseif control_room.triad[id] then
			element.values.moon_data = {
				enemy = triads,
			}
		end
	end
end

local function gambling_table_func(result)
	for _, element in pairs(result.default.elements) do
		if patches.gambling_table[element.id] then
			element.values.moon_data = {
				enemy = civs_casino(),
			}
		end
	end
end

local function spa_func(result)
	local civs = {
		Idstring("units/pd2_dlc_chca/characters/civ_female_bathhouse_1/civ_female_bathhouse_1"),
		Idstring("units/pd2_dlc_chca/characters/civ_female_bathhouse_2/civ_female_bathhouse_2"),
	}

	for _, element in pairs(result.default.elements) do
		if patches.spa[element.id] then
			element.values.moon_data = {
				enemy = civs,
			}
		end
	end
end


return {
	["levels/instances/unique/chca/chca_control_room_1/world/world"] = control_room_func,
	["levels/instances/unique/chca/chca_control_room_2/world/world"] = control_room_func,
	["levels/instances/unique/chca/chca_craps_table/world/world"] = gambling_table_func,
	["levels/instances/unique/chca/chca_roulette_table/world/world"] = gambling_table_func,
	["levels/instances/unique/chca/chca_spa_1/world/world"] = spa_func,
	["levels/instances/unique/chca/chca_spa_2/world/world"] = spa_func,
	["levels/instances/unique/chca/chca_security_room/world/world"] = function(result)
		local cruise_securitys = {
			Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"),
			Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"),
			Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"),
		}

		for _, element in pairs(result.default.elements) do
			if patches.security_room[element.id] then
				element.values.moon_data = {
					enemy = cruise_securitys,
				}
			end
		end
	end,
	["levels/instances/unique/chca/chca_helicopter_enemies/world/world"] = function(result)
		local helicopter_enemies = patches.helicopter_enemies
		local heli_spawns = ASS.utils.scripted_swat_squads({  -- 2 choppers come in but half the time half the units disappear because ??? but only half the time
			hard_target = overkill and 2 or 1,
			hard_spawn = "dozers_no_cs",
			normal_spawn = "specials_any",
		})

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if helicopter_enemies.swats[id] then
				element.values.participate_to_group_ai = true
				element.values.moon_data = {
					enemy = heli_spawns(),
				}
			elseif helicopter_enemies.filters_normal_above[id] then
				table.map_append(element.values, filters_normal_above)
			elseif helicopter_enemies.filters_disable[id] then
				table.map_append(element.values, filters_disable)
			end
		end
	end,
	["levels/instances/shared/harasser/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.harasser[element.id] then
				element.values.moon_data = {
					enemy = tweak_data.moon.units.marshals_far,
				}
			end
		end
	end,
}
