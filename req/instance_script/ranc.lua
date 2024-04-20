local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local scripted_swat_squads = ASS:require("scripted_swat_squads", true)
local filters_disable = set_difficulty_groups("disable")
local filters_normal_above = set_difficulty_groups("normal_above")
local patches = {
	ranc_security_room = table.set(100030),
	ranc_helicopter_spawn_enemies = table.list_to_set({
		100010,
		100040,
		100019,
		100032,
		100011,
		100047,
		100008,
		100033,
		100012,
		100048,
		100021,
		100034,
		100013,
		100049,
		100020,
		100035,
	}),
}

return {
	["levels/instances/unique/ranc/ranc_security_room/world/world"] = function(result)
		local ranc_security = {
			Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"),
			Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"),
		}

		for _, element in pairs(result.default.elements) do
			if patches.ranc_security_room[element.id] then
				element.values.moon_data = {
					enemy = ranc_security,
				}
			end
		end
	end,
	["levels/instances/unique/ranc/ranc_helicopter_spawn_enemies/world/world"] = function(result)
		local spawns = scripted_swat_squads({
			hard_target = overkill and 2 or 1,
			hard_spawn = "dozers_no_cs",
			normal_spawn = "specials_any",
		})

		for _, element in pairs(result.default.elements) do
			if patches.ranc_helicopter_spawn_enemies[element.id] then
				element.values.moon_data = {
					enemy = spawns(),
				}
			end
		end
	end,
}
