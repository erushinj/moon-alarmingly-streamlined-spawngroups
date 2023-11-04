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

local special_chance = ASS:get_var("difficulty_index") * 0.05
local dozer_chance = special_chance * 0.1

local function scripted_swat_squads()
	local rand = math.random()

	return tweak_data.levels:moon_random_unit(rand < dozer_chance and "dozers_no_cs" or rand < special_chance and "specials_any" or "swats")
end

return {
	["levels/instances/unique/ranc/ranc_security_room/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.ranc_security_room[element.id] then
				element.values.possible_enemies = {
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"),
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"),
				}
			end
		end
	end,
	["levels/instances/unique/ranc/ranc_helicopter_spawn_enemies/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.ranc_helicopter_spawn_enemies[element.id] then
				element.values.possible_enemies = scripted_swat_squads()
			end
		end
	end,
}
