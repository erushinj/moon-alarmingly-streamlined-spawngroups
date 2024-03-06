local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local rooftop_swats = tweak_data.levels:moon_random_unit(normal and "swats_far" or hard and "swats_heavys_far" or "marshals_far")
local rooftop_swats_close = tweak_data.levels:moon_random_unit("marshals_far")
local rooftop_swats_escape = tweak_data.levels:moon_random_unit("marshals_far")
local dozers_escape = tweak_data.levels:moon_random_unit("dozers_any")
local dozers_heli = tweak_data.levels:moon_random_unit("dozers_no_mini")
local chopper_spawns = tweak_data.levels:moon_random_unit(normal and "swats_close" or hard and "swats_heavys_close" or "heavys")
local taxman_code_chance = normal and 10 or hard and 7 or 5
local harassers_amount = overkill and 6 or 3
local snipers_amount = normal and 5 or hard and 10 or 15
local switch_undercover_agents = math.random() < 0.5
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

return {
	-- multiple interrupts once more
	[102978] = {
		on_executed = {
			{ id = 103385, delay = 0, },
		}
	},
	-- fence should be here more often
	[100174] = {
		chance = normal and 70 or hard and 40 or 10,
	},
	-- escape units
	[102423] = {
		values = set_difficulty_groups("normal_above"),
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
	[102268] = {
		values = {
			amount = harassers_amount,
		},
	},
	[103247] = {
		values = {
			counter_target = harassers_amount,
		},
	},
	[102946] = {
		values = {
			counter_target = harassers_amount,
		},
	},
	[103833] = {
		on_executed = {
			{ id = 103832, delay = 15, delay_rand = overkill and 15 or 45, },
		},
	},
	[103832] = {
		values = {
			amount = harassers_amount,
		},
	},
	[103837] = {
		values = {
			counter_target = harassers_amount,
		},
	},
	[103835] = {
		values = {
			counter_target = harassers_amount,
		},
	},
	-- vent cloaker group
	[102153] = {
		interval = 15,
	},
	[103801] = {  -- disable this non-vent spawn point
		values = {
			enabled = false,
		},
	},
	-- taxman code chances, taken from pdth
	[102876] = {  -- n (vanilla is 15)
		chance = taxman_code_chance,
	},
	[102875] = {  -- h/vh (vanilla is 10)
		chance = taxman_code_chance,
	},
	[102864] = {  -- ovk+ (vanilla is 5)
		chance = taxman_code_chance,
	},
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
	-- planks (vanilla is 10, pdth is 23)
	[101661] = {
		values = {
			amount = 20,
		},
	},
	--  keep close roof harassers after sawing the limo open
	[102989] = {
		values = {
			enabled = false,
		},
	},
	-- limo fall stuff
	[101645] = {  -- chance for limo to land on the roof rather than the balcony
		chance = normal and 20 or hard and 50 or 80,
	},
	[102943] = {  -- chance for limo to stay on the roof rather than fall through
		chance = normal and 20 or hard and 50 or 80,
	},
	-- flashlights
	[100756] = {
		flashlight = true,
	},
	[101801] = {
		flashlight = false,
	},
	-- sniper stuff
	[102167] = {  -- amount, n (vanilla is 2)
		values = {
			amount = snipers_amount,
		},
	},
	[102168] = {  -- h (vanilla is 3)
		values = {
			amount = snipers_amount,
		},
	},
	[102169] = {  -- vh (vanilla is 4)
		values = {
			amount = snipers_amount,
		},
	},
	[102170] = {  -- ovk (vanilla is 5)
		values = {
			amount = snipers_amount,
		},
	},
	[102171] = {  -- mh+ (vanilla is 6)
		values = {
			amount = snipers_amount,
		},
	},
	[101267] = {  -- disables 7, yes, 7 of the 15 sniper spawns when limo lands on balcony
		values = {
			enabled = false,
		},
	},
	--  this disables multiple spawn points when limo lands on the balcony, which is weird, to say the least
	[101898] = {
		values = {
			enabled = false,
		},
	},
	[102160] = {  -- sniper spawn points that are usually enabled based on where the limo lands
		values = {
			enabled = true,
		},
	},
	[101815] = {
		values = {
			enabled = false,
		},
	},
	[101816] = {
		values = {
			enabled = false,
		},
	},
	[102155] = {
		values = {
			enabled = true,
		},
	},
	[102156] = {
		values = {
			enabled = true,
		},
	},
	[102157] = {
		values = {
			enabled = true,
		},
	},
	[102238] = {
		values = {
			enabled = true,
		},
	},
	[102232] = {
		values = {
			enabled = true,
		},
	},
	[102191] = {
		values = {
			enabled = true,
		},
	},
	-- gas heli stuff
	[104041] = {
		values = set_difficulty_groups("normal_above"),
	},
	[104042] = {
		values = set_difficulty_groups("disable"),
	},
	[104043] = {
		values = set_difficulty_groups("disable"),
	},
	[104044] = {
		values = set_difficulty_groups("disable"),
	},
	[103302] = {
		pre_func = function(self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({ "tank", })
			end
		end,
	},
	[103295] = {  -- some delay stuff
		on_executed = {
			{ id = 103298, delay = 24, delay_rand = 0, },
		},
	},
	[103298] = {
		on_executed = {
			{ id = 101716, delay = 1.5, delay_rand = 0, },
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
	[103302] = {  -- disable gas SO. its honestly worthless.
		values = {
			enabled = false,
		},
	},
	[103434] = {
		values = set_difficulty_groups("normal_above"),
		on_executed = {
			{ id = 101608, delay = 240, delay_rand = overkill and 240 or 480, },
		},
	},
	-- vent cloaker stuff
	[103792] = {
		values = set_difficulty_groups("normal_above"),
	},
	[103798] = {
		func = function(self)
			self._values.enabled = false
		end,
	},
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
	-- wall c4 stuff, allow every wall to be blown up at around the same time
	[102088] = {
		values = {
			amount = 5,
			trigger_times = 1,
		},
	},
	-- street heli spawn amounts (it's only used one time)
	[102629] = {  -- n/h
		values = {
			amount = 4,
			amount_random = 0,
		},
	},
	[100431] = {  -- vh/ovk
		values = {
			amount = 4,
			amount_random = 0,
		},
	},
	[102628] = {  -- mh/dw
		values = {
			amount = 4,
			amount_random = 0,
		},
	},
	[104067] = {  -- ds
		values = {
			amount = 4,
			amount_random = 0,
		},
	},
	-- undercover agents
	[101609] = switch_undercover_agents and {
		enemy = Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
	} or nil,
	[103078] = {
		enemy = switch_undercover_agents and Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1") or nil,
		values = {
			team = "law1",
		},
	},
	[101612] = switch_undercover_agents and {
		enemy =  Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
	} or nil,
	[103079] = {
		enemy = switch_undercover_agents and Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2") or nil,
		values = {
			team = "law1",
		},
	},
	-- fbis
	[101614] = { enemy = fbis, },
	[102633] = { enemy = fbis, },
	[102634] = { enemy = fbis, },
	[102591] = { enemy = fbis, },
	[102592] = { enemy = fbis, },
	[102586] = { enemy = fbis, },
	[102588] = { enemy = fbis, },
	-- chopper spawns on the street
	[102599] = { enemy = chopper_spawns, },  -- n/h
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
	-- rooftop swats
	[103839] = { enemy = rooftop_swats, },  -- across the street
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
	-- escape dozers
	[102433] = { enemy = dozers_escape, },
	[102434] = { enemy = dozers_escape, },
	-- gassers
	[103293] = { enemy = dozers_heli, },  -- n/h
	[103294] = { enemy = dozers_heli, },
	[104045] = { enemy = dozers_heli, },  -- vh/ovk
	[104046] = { enemy = dozers_heli, },
	[104047] = { enemy = dozers_heli, },  -- mh/dw
	[104048] = { enemy = dozers_heli, },
	[104049] = { enemy = dozers_heli, },  -- ds
	[104050] = { enemy = dozers_heli, },
}
