local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local undercover_agents_normal = ASS.utils.gen_remove_random_value({ 101609, 101612, })
local undercover_agents_early_loud = ASS.utils.gen_remove_random_value({ 103078, 103079, })
local filters_normal_above = ASS.utils.set_difficulty_groups("normal_above")
local filters_disable = ASS.utils.set_difficulty_groups("disable")
local rooftop_swats = tweak_data.moon.units[normal and "swats_far" or hard and "swats_heavys_far" or "marshals_far"]
local rooftop_swats_close = tweak_data.moon.units.marshals_far
local rooftop_swats_escape = tweak_data.moon.units.marshals_far
local dozers_escape = tweak_data.moon.units.dozers_any
local dozers_heli = tweak_data.moon.units.dozers_no_mini
local chopper_spawns = tweak_data.moon.units[normal and "swats_close" or hard and "swats_heavys_close" or "heavys"]
local taxman_code_chance = {
	values = {
		chance = normal and 10 or hard and 7 or 5,
	},
}
local harassers = overkill and 6 or 3
local harassers_amount = {
	values = {
		amount = harassers,
	},
}
local harassers_counter = {
	values = {
		counter_target = harassers,
	},
}
local snipers_amount = {
	values = {
		amount = normal and 5 or hard and 10 or 15,
	},
}
local fbis = {
	Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
	Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	-- Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"),
	Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"),
	Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"),
	Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"),
	Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"),
	Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"),
	Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"),
	Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"),
	Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"),
}
local enable = {
	values = {
		enabled = true,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}
local street_heli = {
	values = {
		amount = 4,
		amount_random = 0,
	},
}

return {
	-- multiple interrupts once more
	[102978] = {
		on_executed = {
			{ id = 103385, delay = 0, },
		}
	},
	-- fence should be here more often
	[100174] = {
		values = {
			chance = normal and 70 or hard and 50 or 30,
		},
	},
	-- escape units
	[102423] = {
		values = filters_normal_above,
	},
	[102424] = {  -- which unit groups will be selected (shields, cloaker, dozer)
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102430] = {  -- which shield group will be selected (now both of them on high difficulties)
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[102435] = {  -- which dozer will be selected (now both of them on high difficulties)
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[102444] = {  -- escape harassers amount
		values = {
			amount = 8,
		},
	},
	-- regular harasser stuff
	[102269] = {
		on_executed = {
			{ id = 102268, delay = 15, delay_rand = overkill and 15 or 45, },
		},
	},
	[101731] = {
		on_executed = {
			{ id = 102269, delay = 0, },
		},
	},
	[102268] = harassers_amount,
	[103247] = harassers_counter,
	[102946] = harassers_counter,
	[103833] = {
		on_executed = {
			{ id = 103832, delay = 15, delay_rand = overkill and 15 or 45, },
		},
	},
	[103832] = harassers_amount,
	[103837] = harassers_counter,
	[103835] = harassers_counter,
	[103801] = disable,  -- vent cloaker group, disable this non-vent spawn point
	[102153] = {  -- decrease interval
		values = {
			interval = overkill and 60 or 120,
		},
	},
	-- taxman code chances, taken from pdth
	[102876] = taxman_code_chance,  -- n (vanilla is 15)
	[102875] = taxman_code_chance,  -- h/vh (vanilla is 10)
	[102864] = taxman_code_chance,  -- ovk+ (vanilla is 5)
	[102872] = {  -- executed each 3 hits on taxman, reset for each hack (changed to execute every hit but behave more like pdth)
		values = {
			counter_target = 1,
		},
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self.default_pass_out_chance = normal and 0.1 or hard and 0.2 or 0.35
				self.pass_out_chance = self.default_pass_out_chance
				self._original_value = 1
			end

			if math.random() > self.pass_out_chance then
				self.pass_out_chance = self.pass_out_chance + 0.1  -- didn't pass out, increase chance for next strike
				self._values.on_executed = {}
			else
				self.pass_out_chance = self.default_pass_out_chance  -- passed out, reset pass out chance
				self._values.on_executed = self._values.on_executed_original
			end
		end,
		func = function(self)
			if self._values.counter_target == 0 then
				self:counter_operation_reset()
			end
		end,
	},
	[102874] = {
		values = {
			counter_target = 1,
		},
		func = function(self)
			local element = self:get_mission_element(102872)

			if element then
				element.pass_out_chance = element.default_pass_out_chance
			end
		end,
	},
	--  keep close roof harassers after sawing the limo open
	[102989] = disable,
	-- limo fall stuff
	[101645] = {  -- chance for limo to land on the roof rather than the balcony
		values = {
			chance = 67,
		},
	},
	[102943] = {  -- chance for limo to stay on the roof rather than fall through
		values = {
			chance = 50,
		},
	},
	-- flashlights
	[100756] = {
		flashlight = true,
	},
	[101801] = {
		flashlight = false,
	},
	-- sniper stuff
	[102167] = snipers_amount,  -- amount, n (vanilla is 2)
	[102168] = snipers_amount,  -- h (vanilla is 3)
	[102169] = snipers_amount,  -- vh (vanilla is 4)
	[102170] = snipers_amount,  -- ovk (vanilla is 5)
	[102171] = snipers_amount,  -- mh+ (vanilla is 6)

	[101267] = disable,  -- disables 7, yes, 7 of the 15 sniper spawns when limo lands on balcony
	--  this disables multiple spawn points when limo lands on the balcony, which is weird, to say the least
	[101898] = disable,
	[102160] = enable,  -- sniper spawn points that are usually enabled based on where the limo lands
	[101815] = disable,
	[101816] = disable,
	[102155] = enable,
	[102156] = enable,
	[102157] = enable,
	[102238] = enable,
	[102232] = enable,
	[102191] = enable,
	-- gas heli stuff
	[104041] = {
		values = filters_normal_above,
	},
	[104042] = {
		values = filters_disable,
	},
	[104043] = {
		values = filters_disable,
	},
	[104044] = {
		values = filters_disable,
	},
	[103302] = {
		pre_func = function(self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({ "tank", })
			end
		end,
	},
	[103295] = {
		on_executed = {
			{ id = 103298, delay = 24, },  -- door open delay (normally 27)
		},
	},
	[103298] = {
		on_executed = {
			{ id = 101716, delay = 1.5, },  -- enemy spawn delay (normally 0, causing them to spawn before the door opens)
			{ id = 103299, delay = 6, },  -- flyaway delay (normally 20)
		},
	},
	[100131] = {  -- police called, starts dozer spawn loop
		on_executed = {
			{ id = 101608, delay = overkill and 150 or 225, },  -- dozers
		},
	},
	[101608] = {
		values = {
			trigger_times = 0,
		},
	},
	[102010] = {
		on_executed = {
			{ id = 101608, remove = true, },
		},
	},
	[103302] = disable,  -- disable gas SO. its honestly worthless.
	[103434] = {
		values = filters_normal_above,
		on_executed = {
			{ id = 101608, delay = 240, delay_rand = overkill and 240 or 480, },
		},
	},
	[103792] = {  -- vent cloaker stuff
		values = filters_normal_above,
	},
	-- [103798] = {  -- dont remember what this was for lol
	-- 	values = {
	-- 		trigger_times = 1,
	-- 	},
	-- },
	[103366] = {  -- why do cloakers have gas masks if the masks cant handle gas ?
		on_executed = {
			{ id = 103458, remove = true, },
		},
	},
	[103441] = {
		on_executed = {
			{ id = 103794, remove = true, },
		},
	},
	[102088] = {  -- wall c4 stuff, allow every wall to be blown up at around the same time
		values = {
			amount = 5,
			trigger_times = 1,
		},
	},
	[102629] = street_heli,  -- street heli spawn amounts (it's only used one time), n/h
	[100431] = street_heli,  -- vh/ovk
	[102628] = street_heli,  -- mh/dw
	[104067] = street_heli,  -- ds
	[undercover_agents_early_loud()] = {  -- undercover agents
		enemy = Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
		values = {
			team = "law1",
		},
	},
	[undercover_agents_early_loud()] = {
		enemy = Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
		values = {
			team = "law1",
		},
	},
	[undercover_agents_normal()] = { enemy = Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"), },
	[undercover_agents_normal()] = { enemy = Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"), },
	[101614] = { enemy = fbis, },  -- fbis
	[102633] = { enemy = fbis, },
	[102634] = { enemy = fbis, },
	[102591] = { enemy = fbis, },
	[102592] = { enemy = fbis, },
	[102586] = { enemy = fbis, },
	[102588] = { enemy = fbis, },
	[102599] = { enemy = chopper_spawns, },  -- chopper spawns on the street, n/h
	[102600] = { enemy = chopper_spawns, },
	[102601] = { enemy = chopper_spawns, },
	[102602] = { enemy = chopper_spawns, },
	[103315] = { enemy = chopper_spawns, },  -- vh/ovk
	[104051] = { enemy = chopper_spawns, },
	[104052] = { enemy = chopper_spawns, },
	[104053] = { enemy = chopper_spawns, },
	[104054] = { enemy = chopper_spawns, },  -- mh/dw
	[104055] = { enemy = chopper_spawns, },
	[104056] = { enemy = chopper_spawns, },
	[104057] = { enemy = chopper_spawns, },
	[104058] = { enemy = chopper_spawns, },  -- ds
	[104059] = { enemy = chopper_spawns, },
	[104060] = { enemy = chopper_spawns, },
	[104061] = { enemy = chopper_spawns, },
	[103839] = { enemy = rooftop_swats, },  -- rooftop swats, across the street
	[103841] = { enemy = rooftop_swats, },
	[103843] = { enemy = rooftop_swats, },
	[103845] = { enemy = rooftop_swats, },
	[103847] = { enemy = rooftop_swats, },
	[103849] = { enemy = rooftop_swats, },
	[103228] = { enemy = rooftop_swats_close, },  -- close
	[103237] = { enemy = rooftop_swats_close, },
	[103236] = { enemy = rooftop_swats_close, },
	[103235] = { enemy = rooftop_swats_close, },
	[102097] = { enemy = rooftop_swats_close, },
	[103234] = { enemy = rooftop_swats_close, },
	[102450] = { enemy = rooftop_swats_escape, },  -- escape
	[102448] = { enemy = rooftop_swats_escape, },
	[102446] = { enemy = rooftop_swats_escape, },
	[102443] = { enemy = rooftop_swats_escape, },
	[102436] = { enemy = rooftop_swats_escape, },
	[102437] = { enemy = rooftop_swats_escape, },
	[102438] = { enemy = rooftop_swats_escape, },
	[102439] = { enemy = rooftop_swats_escape, },
	[102433] = { enemy = dozers_escape, },  -- dozers
	[102434] = { enemy = dozers_escape, },
	[103293] = { enemy = dozers_heli, },  -- gassers, n/h
	[103294] = { enemy = dozers_heli, },
	[104045] = { enemy = dozers_heli, },  -- vh/ovk
	[104046] = { enemy = dozers_heli, },
	[104047] = { enemy = dozers_heli, },  -- mh/dw
	[104048] = { enemy = dozers_heli, },
	[104049] = { enemy = dozers_heli, },  -- ds
	[104050] = { enemy = dozers_heli, },
}
