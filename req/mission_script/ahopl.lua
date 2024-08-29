-- a house of pleasure, https://modworkshop.net/mod/43578
local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

local no_participate_to_group_ai = {
	values = {
		participate_to_group_ai = false,
	},
}
local mobsters_pager = {
	Idstring("units/payday2/characters/ene_gang_mobster_1_pager/ene_gang_mobster_1_pager"),
	Idstring("units/payday2/characters/ene_gang_mobster_3_pager/ene_gang_mobster_3_pager"),
	Idstring("units/payday2/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager"),
	Idstring("units/payday2/characters/ene_gang_mobster_5_pager/ene_gang_mobster_5_pager"),
	Idstring("units/payday2/characters/ene_gang_mobster_6_pager/ene_gang_mobster_6_pager"),
}

return {
	[100212] = {  -- dont trigger turret on timelock jam, letting the player buy their way out of fighting it
		on_executed = {
			{ id = 101168, remove = true, },
		},
	},
	[100215] = {  -- instead trigger it on door opening
		on_executed = {
			{ id = 101168, delay = 0, },
		},
	},
	[101168] = {  -- make sure it can only be activated once anyway
		values = {
			trigger_times = 1,
		},
	},
	[100227] = {  -- escape available
		hunt = true,
	},
	[100038] = {  -- loud time
		reinforce = {
			{
				name = "entrance",
				force = 3,
				position = Vector3(-3050, -150, 0),
			},
			{
				name = "lower_pole1",
				force = 2,
				position = Vector3(-2500, 5550, -50),
			},
			{
				name = "lower_pole2",
				force = 2,
				position = Vector3(-3450, 5550, -50),
			},
			{
				name = "upper_pole1",
				force = 2,
				position = Vector3(-2950, 5200, 750),
			},
			{
				name = "upper_pole2",
				force = 2,
				position = Vector3(-2950, 5800, 750),
			},
		},
		on_executed = {
			-- { id = 100976, delay = 0, },  -- diff 0.35 (normally 0s)
			{ id = 100977, delay = 240, },  -- diff 0.7 (normally 50s)
			{ id = 100979, delay = 480, },  -- diff 1 (normally 60s)
		},
	},
	[100068] = {  -- titan doors, saw does not jam randomly
		reinforce = {
			{
				name = "titan",
				force = 2,
				position = Vector3(-1050, 3300, 650),
			},
		},
	},
	[100166] = {
		reinforce = {
			{ name = "titan", },
		},
	},
	[100074] = {
		reinforce = {
			{
				name = "titan",
				force = 2,
				position = Vector3(-5050, 3300, 650),
			},
		},
	},
	[100076] = {
		reinforce = {
			{ name = "titan", },
		},
	},
	[100156] = {  -- open door (server room)
		reinforce = {
			{
				name = "server1",
				force = 2,
				position = Vector3(-2700, 9550, 0),
			},
			{
				name = "server2",
				force = 2,
				position = Vector3(-3250, 9550, 0),
			},
		},
	},
	[100124] = {  -- titan safe, same deal, no random jams
		reinforce = {
			{
				name = "titan",
				force = 2,
				position = Vector3(-3350, 12000, 0),
			},
		},
	},
	[100125] = {
		reinforce = {
			{ name = "titan", },
		},
	},
	[100976] = {  -- difficulty 0.35 element
		values = {
			difficulty = 0.5,
		},
	},
	[100977] = {  -- difficulty 0.7 element
		values = {
			difficulty = 0.75,
		},
	},
	[101396] = {  -- bring in the snipers (first spawn delay)
		on_executed = {
			{ id = 101388, delay = overkill and 50 or 70, },  -- normally 70s
			{ id = 101392, delay = overkill and 55 or 80, },  -- normally 80s
		},
	},
	[101390] = {  -- sniper respawn delays
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self._original_on_executed = {
					{ id = 101388, delay = 30, delay_rand = overkill and 30 or 60, },
				}
			end
		end,
	},
	[101393] = {
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self._original_on_executed = {
					{ id = 101392, delay = 30, delay_rand = overkill and 30 or 60, },
				}
			end
		end,
	},
	[100013] = { enemy = mobsters_pager, },
	[100321] = { enemy = mobsters_pager, },
	[100325] = { enemy = mobsters_pager, },
	[100329] = { enemy = mobsters_pager, },
	[100335] = { enemy = mobsters_pager, },
	[100338] = { enemy = mobsters_pager, },
	[100341] = { enemy = mobsters_pager, },
	[100346] = { enemy = mobsters_pager, values = no_participate_to_group_ai.values, },
	[100353] = { enemy = mobsters_pager, },
	[100359] = { enemy = mobsters_pager, },
	[100362] = { enemy = mobsters_pager, },
	[100367] = { enemy = mobsters_pager, },
	[100373] = { enemy = mobsters_pager, values = no_participate_to_group_ai.values, },
	[100376] = { enemy = mobsters_pager, },
	[100379] = { enemy = mobsters_pager, },
	[100386] = { enemy = mobsters_pager, values = no_participate_to_group_ai.values, },
	[100391] = { enemy = mobsters_pager, },
	[100396] = { enemy = mobsters_pager, },
	[100401] = { enemy = mobsters_pager, },
	[100405] = { enemy = mobsters_pager, },
	[100408] = { enemy = mobsters_pager, },
	[100620] = { enemy = mobsters_pager, },
	[100623] = { enemy = mobsters_pager, },
	[101347] = { enemy = mobsters_pager, },
	[101350] = { enemy = mobsters_pager, },
	[101307] = { enemy = mobsters_pager, },
	[101370] = { enemy = mobsters_pager, },
	[101373] = { enemy = mobsters_pager, },
	[101376] = { enemy = mobsters_pager, },
}
