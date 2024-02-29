local try_pick_bobblehead_bob = ASS:require("try_pick_bobblehead_bob", nil, nil, {
	Idstring("units/pd2_dlc_casino/characters/civ_male_business_casino_2/civ_male_business_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_1/civ_male_casino_1"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_2/civ_male_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_3/civ_male_casino_3"),
})
local patches = {
	gambling_table = table.set(100008, 100010),
	spa = table.set(100099),
	control_room = {
		[100067] = function(element)  -- civ
			element.values.possible_enemies = {
				Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
				Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
				Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
				Idstring("units/pd2_dlc_chas/characters/civ_male_asian_casual_2/civ_male_asian_casual_2"),
			}
		end,
		[100030] = function(element)  -- triad
			element.values.possible_enemies = {
				Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"),
				Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"),
				Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"),
			}
		end,
	},
	harasser = table.set(100016, 100017, 100018),
	helicopter_enemies = table.list_to_set({
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
	})
}

local function control_room(result)
	for _, element in pairs(result.default.elements) do
		if patches.control_room[element.id] then
			patches.control_room[element.id](element)
		end
	end
end
local function gambling_table(result)
	for _, element in pairs(result.default.elements) do
		if patches.gambling_table[element.id] then
			local result = try_pick_bobblehead_bob()
			result = type(result) ~= "table" and { result, } or result

			element.values.possible_enemies = result
		end
	end
end
local function spa(result)
	for _, element in pairs(result.default.elements) do
		if patches.spa[element.id] then
			element.values.possible_enemies = {
				Idstring("units/pd2_dlc_chca/characters/civ_female_bathhouse_1/civ_female_bathhouse_1"),
				Idstring("units/pd2_dlc_chca/characters/civ_female_bathhouse_2/civ_female_bathhouse_2"),
			}
		end
	end
end

local special_chance = ASS:get_var("difficulty_index") * 0.05
local dozer_chance = special_chance * 0.1
local function scripted_swat_squads()
	local rand = math.random()

	return tweak_data.levels:moon_random_unit(rand < dozer_chance and "dozers_no_cs" or rand < special_chance and "specials_any" or "swats")
end

return {
	["levels/instances/unique/chca/chca_control_room_1/world/world"] = control_room,
	["levels/instances/unique/chca/chca_control_room_2/world/world"] = control_room,
	["levels/instances/unique/chca/chca_security_room/world/world"] = control_room,
	["levels/instances/unique/chca/chca_craps_table/world/world"] = gambling_table,
	["levels/instances/unique/chca/chca_roulette_table/world/world"] = gambling_table,
	["levels/instances/unique/chca/chca_spa_1/world/world"] = spa,
	["levels/instances/unique/chca/chca_spa_2/world/world"] = spa,
	["levels/instances/unique/chca/chca_helicopter_enemies/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.helicopter_enemies[element.id] then
				element.values.possible_enemies = scripted_swat_squads()
			end
		end
	end,
	["levels/instances/shared/harasser/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.harasser[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("marshals_far")
			end
		end
	end,
}
