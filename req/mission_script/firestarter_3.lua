local normal, hard, overkill = ASS:difficulty_groups()

return {
	-- cop car stuff
	[103879] = {  -- amount per time cars pull in (vanilla is 1)
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[104730] = {  -- car 4 done
		on_executed = {
			{ id = 100370, },
		},
	},
	-- gas heli now loops like tweaked undercover
	[105496] = {  -- ovk and below heli chance (vanilla is 50)
		values = {
			chance = 100,
		},
	},
	[100631] = {
		on_executed = {
			{ id = 101747, delay = 180, delay_rand = overkill and 120 or 240, },
		},
		func = function(self)
			self:chance_operation_reset()
		end,
	},
	[101424] = {
		values = {
			trigger_times = 0,
		},
	},
	[102297] = {  -- disable gas SO after deployment
		func = function(self)
			local element = self:get_mission_element(102296)

			if element then
				element:set_enabled(false)
			end
		end,
	},
	-- cams amount
	[101318] = {
		values = {
			amount = normal and 4 or hard and 6 or 8,
		},
	},
	-- titan cams
	[104328] = {
		values = {
			enabled = false,
		},
	},
	-- snipers amount
	[101200] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	-- chance of no safe in manager's office (vanilla is 75)
	[102194] = {
		values = {
			chance = normal and 5 or hard and 15 or 25,
		},
	},
	-- forced skylights, "overkill" difficulty group only
	[101930] = {
		values = {
			difficulty_easy_wish = false,
		},
	},
	[101934] = {
		values = {
			difficulty_easy_wish = true,
		},
	},
	-- tear gas (3 locations always active, theres 3 more but only 1 of those is active based on escape location)
	[102195] = {
		values = {
			amount = overkill and 4 or 2,
		}
	},
	[101355] = {
		values = {
			amount = overkill and 4 or 2,
		}
	},
	-- reenforce
	[100369] = {  -- street
		values = {
			amount = 3,
		},
	},
	[102091] = {
		values = {
			amount = 3,
		},
	},
	[100370] = {
		values = {
			amount = 3,
		},
	},
	[101125] = {  -- on the lance. kindly fuck off.
		values = {
			enabled = false,
		},
	},
	[101126] = {
		values = {
			enabled = false,
		},
	},
	[105331] = {  -- by the furthest escape. no other escape has reenforce, and sh already adds reenforce to escapes automatically.
		values = {
			enabled = false,
		},
	},
	-- security guards
	[100294] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100296] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100297] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101063] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101219] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },  -- surv guys
	[105100] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	-- chopper swats
	[101432] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },
	[105621] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },
	-- chopper heavies
	[101433] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },
	[105620] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },
	-- chopper dozers
	[101785] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[101786] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
}

