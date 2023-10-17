local normal, hard, overkill = ASS:difficulty_groups()
local rooftop_swats = normal and ASS:random_unit("swats_far") or hard and ASS:random_unit("swats_heavys_far") or ASS:units().heavy_1
local rooftop_swats_close = normal and ASS:random_unit("swats") or hard and ASS:random_unit("swats_heavys") or ASS:random_unit("heavys")
local taxman_code_chance = normal and 10 or hard and 7 or 5

return {
	-- multiple interrupts once more
	[102978] = {
		on_executed = {
			{ id = 103385, },
		}
	},
	-- fence should be here more often
	[100174] = {
		values = {
			chance = normal and 70 or hard and 40 or 10,
		},
	},
	-- escape units
	[102423] = {
		values = table.set("difficulty_easy", "difficulty_normal"),
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
	-- [102269] = {
	-- 	on_executed = {
	-- 		{ id = 102268, delay = 15, delay_rand = 15 },
	-- 	},
	-- },
	-- [102268] = {
	-- 	values = {
	-- 		amount = 6,
	-- 	},
	-- },
	-- [103833] = {
	-- 	on_executed = {
	-- 		{ id = 103832, delay = 15, delay_rand = 15 },
	-- 	},
	-- },
	-- [103832] = {
	-- 	values = {
	-- 		amount = 6,
	-- 	},
	-- },

	-- vent cloaker group interval (default 240s)
	[102153] = {
		values = {
			interval = 15,
		},
	},

	-- taxman code chances, taken from pdth
	[102876] = {  -- n (vanilla is 15)
		values = {
			chance = taxman_code_chance,
		},
		pre_func = function(self)
			if self._values.chance ~= taxman_code_chance then
				self._values.chance = taxman_code_chance
				self._chance = taxman_code_chance
			end
		end,
	},
	[102875] = {  -- h/vh (vanilla is 10)
		values = {
			chance = taxman_code_chance,
		},
		pre_func = function(self)
			if self._values.chance ~= taxman_code_chance then
				self._values.chance = taxman_code_chance
				self._chance = taxman_code_chance
			end
		end,
	},
	[102864] = {  -- ovk+ (vanilla is 5)
		values = {
			chance = taxman_code_chance,
		},
		pre_func = function(self)
			if self._values.chance ~= taxman_code_chance then
				self._values.chance = taxman_code_chance
				self._chance = taxman_code_chance
			end
		end,
	},
	[102872] = {  -- executed each 3 hits on taxman, reset for each hack (changed to execute every hit but behave more like pdth)
		values = {
			counter_target = 1,
		},
		pre_func = function(self)
			if not self._values.old_on_executed then
				self._values.old_on_executed = self._values.on_executed
				self.default_pass_out_chance = normal and 0.1 or hard and 0.2 or 0.35
				self.pass_out_chance = self.default_pass_out_chance
				self._original_value = 1
			end

			if math.random() > self.pass_out_chance then
				self.pass_out_chance = self.pass_out_chance + 0.1  -- didn't pass out, increase chance for next strike
				self._values.on_executed = {}
			else
				self.pass_out_chance = self.default_pass_out_chance  -- passed out, reset pass out chance
				self._values.on_executed = self._values.old_on_executed
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
			local element = managers.mission:get_element_by_id(102872)

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
			amount = 3,
		},
	},
	[102168] = {  -- h (vanilla is 3)
		values = {
			amount = 3,
		},
	},
	[102169] = {  -- vh (vanilla is 4)
		values = {
			amount = 3,
		},
	},
	[102170] = {  -- ovk (vanilla is 5)
		values = {
			amount = 6,
		},
	},
	[102171] = {  -- mh+ (vanilla is 6)
		values = {
			amount = overkill and 9 or 6,
		},
	},
	[102160] = {  -- unused spawn points
		values = {
			enabled = true,
			trigger_times = 0,
		},
	},
	[102155] = {
		values = {
			enabled = true,
			trigger_times = 0,
		},
	},
	[102156] = {
		values = {
			enabled = true,
			trigger_times = 0,
		},
	},
	[102157] = {
		values = {
			enabled = true,
			trigger_times = 0,
		},
	},
	[102238] = {
		values = {
			enabled = true,
			trigger_times = 0,
		},
	},
	[102232] = {
		values = {
			enabled = true,
			trigger_times = 0,
		},
	},
	[102191] = {
		values = {
			enabled = true,
			trigger_times = 0,
		},
	},
	[102143] = {
		values = {
			trigger_times = 0,
		},
	},
	[102145] = {
		values = {
			trigger_times = 0,
		},
	},
	[102146] = {
		values = {
			trigger_times = 0,
		},
	},
	[102148] = {
		values = {
			trigger_times = 0,
		},
	},
	[102150] = {
		values = {
			trigger_times = 0,
		},
	},
	[102151] = {
		values = {
			trigger_times = 0,
		},
	},
	[102152] = {
		values = {
			trigger_times = 0,
		},
	},
	[102153] = {
		values = {
			trigger_times = 0,
		},
	},

	-- gas heli stuff
	[104041] = {
		values = table.set("difficulty_normal"),
	},
	[103302] = {
		pre_func = function(self)
			if not self._values.old_SO_access then
				self._values.old_SO_access = self._values.SO_access
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
	[100131] = {  -- police called, starts dozer and cloaker spawn loops
		on_executed = {
			{ id = 101608, delay = overkill and 150 or 225, },  -- dozers
			{ id = 103791, delay = overkill and 120 or 180, },  -- cloakers
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
		values = table.set("difficulty_easy", "difficulty_normal"),
		on_executed = {
			{ id = 101608, delay = 240, delay_rand = overkill and 240 or 480, },
		},
	},

	-- vent cloaker stuff
	[103795] = {
		on_executed = {
			{ id = 103791, remove = true, },
		},
	},
	[103792] = {
		values = table.set("difficulty_easy", "difficulty_normal", "difficulty_hard"),
		on_executed = {
			{ id = 103793, delay = overkill and 45 or 90, delay_rand = overkill and 45 or 90, },
		},
	},
	[103793] = {
		pre_func = function(self)
			local amount = 1

			if self._values.amount ~= amount then
				self._group_data.amount = amount
				self._values.amount = amount
				self._values.preferred_spawn_groups = {}
			end
		end,
		on_executed = {
			{ id = 103792, },
		},
	},
	[103798] = {
		func = function(self)
			self._values.enabled = false
		end,
	},
	[103801] = {
		values = {
			enabled = false,
		},
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
	-- chopper spawns on the street
	[102599] = { enemy = ASS:random_unit("swats") },  -- n/h
	[102600] = { enemy = ASS:random_unit("swats") },
	[102601] = { enemy = ASS:random_unit("swats") },
	[102602] = { enemy = ASS:random_unit("swats") },
	[103315] = { enemy = ASS:random_unit("swats") },  -- vh/ovk
	[104051] = { enemy = ASS:random_unit("swats") },
	[104052] = { enemy = ASS:random_unit("swats") },
	[104053] = { enemy = ASS:random_unit("swats") },
	[104054] = { enemy = ASS:random_unit("swats") },  -- mh/dw
	[104055] = { enemy = ASS:random_unit("swats") },
	[104056] = { enemy = ASS:random_unit("swats") },
	[104057] = { enemy = ASS:random_unit("swats") },
	[104058] = { enemy = ASS:random_unit("swats") },  -- ds
	[104059] = { enemy = ASS:random_unit("swats") },
	[104060] = { enemy = ASS:random_unit("swats") },
	[104061] = { enemy = ASS:random_unit("swats") },

	-- rooftop swats
	[103839] = { enemy = rooftop_swats },  -- across the street
	[103841] = { enemy = rooftop_swats },
	[103843] = { enemy = rooftop_swats },
	[103845] = { enemy = rooftop_swats },
	[103847] = { enemy = rooftop_swats },
	[103849] = { enemy = rooftop_swats },
	[103228] = { enemy = rooftop_swats_close },  -- close
	[103237] = { enemy = rooftop_swats_close },
	[103236] = { enemy = rooftop_swats_close },
	[103235] = { enemy = rooftop_swats_close },
	[102097] = { enemy = rooftop_swats_close },
	[103234] = { enemy = rooftop_swats_close },
	[102450] = { enemy = rooftop_swats_close },  -- escape
	[102448] = { enemy = rooftop_swats_close },
	[102446] = { enemy = rooftop_swats_close },
	[102443] = { enemy = rooftop_swats_close },
	[102436] = { enemy = rooftop_swats_close },
	[102437] = { enemy = rooftop_swats_close },
	[102438] = { enemy = rooftop_swats_close },
	[102439] = { enemy = rooftop_swats_close },

	-- escape dozers
	[102433] = { enemy = ASS:random_unit("dozers_any") },
	[102434] = { enemy = ASS:random_unit("dozers_any") },

	-- gassers
	[103293] = { enemy = ASS:random_unit("dozers_no_mini") },  -- n/h
	[103294] = { enemy = ASS:random_unit("dozers_no_mini") },
	[104045] = { enemy = ASS:random_unit("dozers_no_mini") },  -- vh/ovk
	[104046] = { enemy = ASS:random_unit("dozers_no_mini") },
	[104047] = { enemy = ASS:random_unit("dozers_no_mini") },  -- mh/dw
	[104048] = { enemy = ASS:random_unit("dozers_no_mini") },
	[104049] = { enemy = ASS:random_unit("dozers_no_mini") },  -- ds
	[104050] = { enemy = ASS:random_unit("dozers_no_mini") },
}
