local patches = {
	chew_train_car = {
		bikers = table.list_to_set({
			100209,
			100213,
			100215,
			100252,
			100255,
			100256,
			100271,
			100272,
			100273,
			100274,
			100275,
			100276,
			100277,
			100623,
		}),
		swats = table.list_to_set({
			100208,
			100212,
			100214,
			100216,
			100217,
			100251,
			100257,
			100258,
			100259,
			100262,
			100263,
			100264,
		}),
		dozers = table.list_to_set({
			100222,
			100226,
			100220,
			100221,
			100633,
			100634,
			100635,
			100227,
			100228,
		}),
	},
	chew_pursuit_car = table.set(100004, 100011, 100013, 100031, 100007, 100010, 100012, 100032),
}

return {
	["levels/instances/unique/chew/chew_train_car/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.chew_train_car.bikers[element.id] then
				element.values.possible_enemies = {
					Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"),
					Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"),
					Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"),
					Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"),
					Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"),
					Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"),
					Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"),
				}
			elseif patches.chew_train_car.swats[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("swats")
			elseif patches.chew_train_car.dozers[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("dozers_no_cs")
			end
		end
	end,
	["levels/instances/unique/chew/chew_pursuit_car/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.chew_pursuit_car[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("swats_heavys_far")
			end
		end
	end,
}
