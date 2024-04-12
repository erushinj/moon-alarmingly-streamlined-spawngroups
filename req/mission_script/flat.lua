local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local cops = tweak_data.levels:moon_units("cops")
local gangsters = {
	Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
	Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
	Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"),
	Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"),
	Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"),
	Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"),
	Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"),
	Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"),
	-- Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"),  -- why are they using russians ?
	-- Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"),
}
local roof_spawn_interval = {
	values = {
		interval = 30,
	},
}
local dealer_voicelines = {
	pre_func = function(self)
		if not self._moon_tweaked then
			self._moon_tweaked = true

			local elements = self._values.elements
			for i, element_id in pairs(elements) do
				if element_id == 102456 then
					elements[i] = 104782

					break
				end
			end
		end
	end,
}
local disable = {
	values = {
		enabled = false,
	},
}
local enable = {
	values = {
		enabled = true,
	},
}
local gangsters_amounts_2 = {
	values = {
		amount = 2,
		amount_random = 0,
	},
}
local gangsters_amounts_3 = {
	values = {
		amount = 3,
		amount_random = 0,
	},
}
local sniper_kill_target = {
	values = {
		counter_target = normal and 8 or hard and 10 or 12,
	},
}

return {
	[102656] = enable,  -- "link to close roof doors"
	[100297] = enable,  -- "close roof doors"
	[103487] = {
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = deep_clone(self._values.on_executed)

				local close_roof_doors_chance = normal and 0.3 or hard and 0.5 or 0.7
				if math.random() < close_roof_doors_chance then
					table.insert(self._values.on_executed, { id = 102656, delay = 0, })
				end
			end
		end,
	},
	[101745] = enable,  -- reenable harassers, but remove the dumb swarm heavies
	[100150] = disable,
	[100385] = disable,
	[100387] = disable,
	[100389] = disable,
	[100391] = disable,
	[100392] = disable,
	[103348] = disable,  -- disable last reenforce point, really not needed on this heist
	[102840] = {  -- diff curve, "start diff" (0.25)
		values = {
			difficulty = 0.35,
		},
	},
	[102841] = {  -- "all drills" (1)
		values = {
			difficulty = 0.7,
		},
	},
	[102842] = {  -- "bag drops" (0.75)
		values = {
			difficulty = 0.7,
		},
	},
	[102843] = {  -- "explosion" (1)
		values = {
			difficulty = 1,
		},
	},
	[103455] = {
		values = {
			amount = normal and 2 or hard and 1 or 0,
			amount_random = normal and 0 or hard and 1 or 2,
		},
	},
	[103618] = {
		values = {
			amount = normal and 2 or hard and 1 or 0,
			amount_random = normal and 1 or hard and 2 or 3,
		},
	},
	[102261] = {  -- c4 alley drop on high difficulties
		on_executed = {
			{ id = 100350, delay = 0, },
		},
	},
	[104516] = sniper_kill_target,  -- tweak objective sniper amount, n/h (vanilla is 7)
	[104692] = sniper_kill_target,  -- vh/ovk (vanilla is 10)
	[104693] = sniper_kill_target,  -- mh+ (vanilla is 15)
	[104556] = disable,  -- re-allow sniper respawns
	[101599] = enable,  -- also allow a disabled sniper spawn
	[101521] = enable,  -- and corresponding so
	[104650] = roof_spawn_interval,  -- slow down roof spawns, these are really fucking annoying
	[100504] = roof_spawn_interval,
	[100505] = roof_spawn_interval,
	[100509] = roof_spawn_interval,
	[100396] = roof_spawn_interval,
	[102593] = gangsters_amounts_3,  -- gangster amounts
	[102597] = gangsters_amounts_2,
	[102604] = gangsters_amounts_2,
	[102612] = gangsters_amounts_2,
	[101744] = gangsters_amounts_2,
	[101867] = gangsters_amounts_3,
	[103090] = {  -- more loot
		values = {
			amount = 8,
			amount_random = normal and 0 or hard and 4 or 8,
		},
	},
	[103002] = {
		on_executed = {
			{ id = 103014, remove = true, },
		}
	},
	[100501] = {  -- ambush line fix ?  hasnt been working for me since forever
		values = {
			use_play_func = true,
		},
	},
	[102329] = {  -- reduce delay on mask up when ambushed (this triggers loud)
		on_executed = {
			{ id = 102332, delay = 1.5, },
		},
	},
	[101797] = dealer_voicelines,  -- dealer voice fix
	[101798] = dealer_voicelines,
	[101832] = dealer_voicelines,
	[104782] = { enemy = Idstring("units/pd2_dlc_flat/characters/npc_jamaican/npc_jamaican"), },  -- gangsters
	[102456] = { enemy = gangsters, },
	[100081] = { enemy = gangsters, },
	[100085] = { enemy = gangsters, },
	[100169] = { enemy = gangsters, },
	[100234] = { enemy = gangsters, },
	[100236] = { enemy = gangsters, },
	[100253] = { enemy = gangsters, },
	[100305] = { enemy = gangsters, },
	[100406] = { enemy = gangsters, },
	[100409] = { enemy = gangsters, },
	[100418] = { enemy = gangsters, },
	[100431] = { enemy = gangsters, },
	[100767] = { enemy = gangsters, },
	[101200] = { enemy = gangsters, },
	[101375] = { enemy = gangsters, },
	[101401] = { enemy = gangsters, },
	[101421] = { enemy = gangsters, },
	[101422] = { enemy = gangsters, },
	[101425] = { enemy = gangsters, },
	[101434] = { enemy = gangsters, },
	[101435] = { enemy = gangsters, },
	[101438] = { enemy = gangsters, },
	[101441] = { enemy = gangsters, },
	[101442] = { enemy = gangsters, },
	[101512] = { enemy = gangsters, },
	[101661] = { enemy = gangsters, },
	[101668] = { enemy = gangsters, },
	[101743] = { enemy = gangsters, },
	[101746] = { enemy = gangsters, },
	[101749] = { enemy = gangsters, },
	[101881] = { enemy = gangsters, },
	[102170] = { enemy = gangsters, },
	[102197] = { enemy = gangsters, },
	[102330] = { enemy = gangsters, },
	[102332] = { enemy = gangsters, },
	[102333] = { enemy = gangsters, },
	[102335] = { enemy = gangsters, },
	[102558] = { enemy = gangsters, },
	[102562] = { enemy = gangsters, },
	[102563] = { enemy = gangsters, },
	[102564] = { enemy = gangsters, },
	[102586] = { enemy = gangsters, },
	[102592] = { enemy = gangsters, },
	[102596] = { enemy = gangsters, },
	[102718] = { enemy = gangsters, },
	[103061] = { enemy = gangsters, },
	[103231] = { enemy = gangsters, },
	[103232] = { enemy = gangsters, },
	[103234] = { enemy = gangsters, },
	[103235] = { enemy = gangsters, },
	[103236] = { enemy = gangsters, },
	[103450] = { enemy = gangsters, },
	[104781] = { enemy = gangsters, },
	[104889] = { enemy = gangsters, },
	[104930] = { enemy = gangsters, },
	[104932] = { enemy = gangsters, },
	[103103] = { enemy = gangsters, },
	[103102] = { enemy = gangsters, },
	[103103] = { enemy = gangsters, },
	[103104] = { enemy = gangsters, },
	[103179] = { enemy = gangsters, },
	[103180] = { enemy = gangsters, },
	[101540] = { enemy = gangsters, },
	[101395] = { enemy = gangsters, },
	[101433] = { enemy = gangsters, },
	[101437] = { enemy = gangsters, },
	[101539] = { enemy = gangsters, },
	[101802] = { enemy = gangsters, },
	[101804] = { enemy = gangsters, },
	[104793] = { enemy = gangsters, },
	[102717] = { enemy = gangsters, },
	[100512] = { enemy = gangsters, },
	[100513] = { enemy = gangsters, },
	[100516] = { enemy = gangsters, },
	[100407] = { enemy = gangsters, },
	[102165] = { enemy = gangsters, },
	[102193] = { enemy = gangsters, },
	[100484] = { enemy = gangsters, },
	[100025] = { enemy = gangsters, },
	[100494] = { enemy = gangsters, },
	[100495] = { enemy = gangsters, },
	[100496] = { enemy = gangsters, },
	[100039] = { enemy = gangsters, },
	[102192] = { enemy = gangsters, },
	[100050] = { enemy = gangsters, },
	[102191] = { enemy = gangsters, },
	[100055] = { enemy = gangsters, },
	[100056] = { enemy = gangsters, },
	[100057] = { enemy = gangsters, },
	[103703] = { enemy = gangsters, },
	[103702] = { enemy = gangsters, },
	[100135] = { enemy = cops, },  -- "random swat 1" (not actually swat, is a bronco cop, kicks down the front door)
	[100027] = { enemy = cops, },  -- cops, initial
	[100028] = { enemy = cops, },
	[100035] = { enemy = cops, },
	[100037] = { enemy = cops, },
	[100038] = { enemy = cops, },
	[100040] = { enemy = cops, },
	[102020] = { enemy = cops, },  -- "blockade" (swarm)
	[102021] = { enemy = cops, },
}
