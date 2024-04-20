local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local patches = {
	control_room = {
		murkies = table.set(100103, 100104),
		dozer = table.set(100044, 100079, 100066),
		dozer_chance = table.set(100118),
	},
	mountain_surface = {
		groups = table.set(101414, 101415),
		murkies = table.list_to_set({
			101423,
			101420,
			101424,
			101425,
			101426,
			101431,
			101432,
			101434,
			101435,
			101436,
			101437,
			101438,
			101439,
			101440,
			101441,
			101442,
			101443,
			101444,
			101445,
			101446,
			101447,
			101464,
			101476,
			101477,
			101478,
			101479,
			101480,
			101481,
			101482,
			101483,
			101484,
		}),
		dozers = table.list_to_set({
			100250,
			100254,
			100255,
			100270,
			100272,
			100274,
			100276,
			100244,
			100253,
			100256,
			100271,
			100273,
			100275,
			100277,
		}),
		snipers = table.list_to_set({
			101333,  -- locke, why does he participate to groupai
			100214,
			100215,
			100216,
			100217,
			100218,
			100219,
			100220,
			100221,
			101466,
			101468,
			101469,
			101470,
			101471,
			100000,
			100011,
			100013,
			100014,
			100015,
		}),
	},
}
local murkies_far = {
	Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"),
	Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"),
}
local murkies = table.list_add(murkies_far, {
	Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"),
})

return {
	["levels/instances/unique/pbr/pbr_mountain_control_room/world/world"] = function(result)
		local control_room = patches.control_room
		local dozers_no_med = tweak_data.levels:moon_units("dozers_no_med")
		local dozer_chance = normal and 25 or hard and 45 or 65

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if control_room.murkies[id] then
				element.values.moon_data = {
					enemy = murkies,
				}
			elseif control_room.dozer[id] then
				element.values.moon_data = {
					enemy = dozers_no_med,
				}
			elseif control_room.dozer_chance[id] then
				element.values.chance = dozer_chance
			end
		end
	end,
	["levels/instances/unique/pbr/pbr_mountain_surface/world/world"] = function(result)
		local mountain_surface = patches.mountain_surface
		local no_shields_dozers = tweak_data.group_ai:moon_preferred_list("no_shields_dozers")
		local dozers_any = tweak_data.levels:moon_units("dozers_any")

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if mountain_surface.groups[id] then
				element.values.preferred_spawn_groups = no_shields_dozers
			elseif mountain_surface.murkies[id] then
				element.values.moon_data = {
					enemy = murkies,
				}
			elseif mountain_surface.dozers[id] then
				element.values.moon_data = {
					enemy = dozers_any,
				}
			elseif mountain_surface.snipers[id] then
				element.values.participate_to_group_ai = false
			end
		end
	end,
}
