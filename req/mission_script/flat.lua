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

return {
	-- more oppressive open door amounts
	[103455] = {
		values = {
			amount = 0,
			amount_random = 3,
		},
	},
	[103490] = {
		values = {
			amount = 0,
			amount_random = 2,
		},
	},
	[103618] = {
		values = {
			amount = 0,
			amount_random = 4,
		},
	},
	-- c4 alley drop
	[102261] = {
		pre_func = function(self)
			for _, v in pairs(self._values.on_executed) do
				if v.id == 100350 then
					return
				end
			end

			table.insert(self._values.on_executed, { id = 100350, delay = 0, })
		end,
	},
	-- re-allow sniper respawns
	[104556] = {
		values = {
			enabled = false,
		},
	},
	[101599] = {  -- also allow a disabled sniper spawn
		values = {
			trigger_times = 0,
			enabled = true,
		},
	},
	[101521] = {  -- and corresponding so
		values = {
			enabled = true,
		},
	},
	[103143] = {
		values = {
			trigger_times = 0,
		},
	},
	[103134] = {
		values = {
			trigger_times = 0,
		},
	},
	[103137] = {
		values = {
			trigger_times = 0,
		},
	},
	[103130] = {
		values = {
			trigger_times = 0,
		},
	},
	[103126] = {
		values = {
			trigger_times = 0,
		},
	},
	[102833] = {
		values = {
			trigger_times = 0,
		},
	},
	[101801] = {
		values = {
			trigger_times = 0,
		},
	},
	[102614] = {
		values = {
			trigger_times = 0,
		},
	},
	[102612] = {
		values = {
			trigger_times = 0,
		},
	},
	[103148] = {
		values = {
			trigger_times = 0,
		},
	},
	[103168] = {
		values = {
			trigger_times = 0,
		},
	},
	[100793] = {
		values = {
			trigger_times = 0,
		},
	},
	[100645] = {
		values = {
			trigger_times = 0,
		},
	},
	[103111] = {
		values = {
			trigger_times = 0,
		},
	},
	[100693] = {
		values = {
			trigger_times = 0,
		},
	},
	-- slow down roof spawns, these are really fuckng annoying
	[104650] = {
		values = {
			interval = 40,
		},
	},
	[100504] = {
		values = {
			interval = 40,
		},
	},
	[100505] = {
		values = {
			interval = 40,
		},
	},
	[100509] = {
		values = {
			interval = 40,
		},
	},
	[100396] = {
		values = {
			interval = 40,
		},
	},
	-- gangster amounts
	[102593] = {
		values = {
			amount = 3,
			amount_random = 0,
		},
	},
	[102597] = {
		values = {
			amount = 2,
			amount_random = 0,
		},
	},
	[102604] = {
		values = {
			amount = 2,
			amount_random = 0,
		},
	},
	[102612] = {
		values = {
			amount = 2,
			amount_random = 0,
		},
	},
	[101744] = {
		values = {
			amount = 2,
			amount_random = 0,
		},
	},
	[101867] = {
		values = {
			amount = 3,
			amount_random = 0,
		},
	},
	-- remove planks
	[104032] = {
		values = {
			amount = 0,
		},
	},
	[104034] = {
		values = {
			amount = 0,
		},
	},
	[104036] = {
		values = {
			amount = 0,
		},
	},
	-- more loot
	[103090] = {
		values = {
			amount = 8,
			amount_random = 8,
		},
	},
	[103002] = {
		on_executed = {
			{ id = 103014, remove = true, },
		}
	},
	-- disable panic room reenforce (sh disables the other two points, and this heist doesnt really need it)
	[103348] = {
		values = {
			enabled = false,
		},
	},
	-- gangsters + dealer fix
	[101797] = {
		pre_func = function(self)
			for i, element_id in pairs(self._values.elements) do
				if element_id == 102456 then
					self._values.elements[i] = 104782

					break
				end
			end
		end,
	},
	[101798] = {
		pre_func = function(self)
			for i, element_id in pairs(self._values.elements) do
				if element_id == 102456 then
					self._values.elements[i] = 104782

					break
				end
			end
		end,
	},
	[101832] = {
		pre_func = function(self)
			for i, element_id in pairs(self._values.elements) do
				if element_id == 102456 then
					self._values.elements[i] = 104782

					break
				end
			end
		end,
	},
	[104782] = { enemy = Idstring("units/pd2_dlc_flat/characters/npc_jamaican/npc_jamaican"), },
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
	-- [102456] = { enemy = gangsters, },
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
	-- [104782] = { enemy = gangsters, },
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
	-- initial cops
	[100027] = { enemy = ASS:random_unit("cops_no_r870"), },
	[100028] = { enemy = ASS:random_unit("cops_no_r870"), },
	[100035] = { enemy = ASS:random_unit("cops_no_r870"), },
	[100037] = { enemy = ASS:random_unit("cops_no_r870"), },
	[100038] = { enemy = ASS:random_unit("cops_no_r870"), },
	[100040] = { enemy = ASS:random_unit("cops_no_r870"), },
	-- blockade cops (swarm)
	[102020] = { enemy = ASS:random_unit("cops"), },
	[102021] = { enemy = ASS:random_unit("cops"), },
}
