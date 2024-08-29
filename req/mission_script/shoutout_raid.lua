local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
-- local gate_so = {
-- 	so_access_filter = "any",
-- }
local disable = {
	values = {
		enabled = false,
	},
}
local starting_murky_amounts = {  -- vanilla is 10 n/h, 11 vh, 13 ovk, 15 mh+
	values = {
		amount = normal and 12 or hard and 18 or 24,
	},
}
local roof_murky_amounts = {  -- vanilla is 8 n/vh, 10 ovk+
	values = {
		amount = 10,
	},
}
local room_murky_amounts = roof_murky_amounts  -- same deal
local snipers_amount = {  -- 5 is stupid, actually, you can get 2 in the docks and only ever have 3 in the warehouse area for the rest of the heist if youre lucky, make it 3 but disable dock snipers
	values = {
		amount = 3,
	},
}

return {
	[100109] = {  -- police
		reinforce = {
			{
				name = "catwalk",
				force = 2,
				position = Vector3(-3650, -1850, 1400),
			},
			{
				name = "warehouse_entrance_container",
				force = 2,
				position = Vector3(-650, -2100, 1250),
			},
			{
				name = "central",
				force = 4,
				position = Vector3(2650, -125, 975),
			},
			{
				name = "near_longfellow1",
				force = 2,
				position = Vector3(-1925, 25, 975),
			},
			{
				name = "near_longfellow2",
				force = 2,
				position = Vector3(-3000, 150, 975),
			},
		},
	},
	[100123] = {  -- end assault
		on_executed = {
			{ name = "pick_murky_groups", delay = 0, },
		},
	},
	[100358] = snipers_amount,
	[100359] = snipers_amount,
	[100360] = snipers_amount,
	[100361] = snipers_amount,
	[100362] = snipers_amount,
	[103232] = starting_murky_amounts,
	[103229] = starting_murky_amounts,
	[103224] = starting_murky_amounts,
	[103222] = starting_murky_amounts,
	[103240] = roof_murky_amounts,
	[103243] = roof_murky_amounts,
	[103144] = room_murky_amounts,
	[103234] = room_murky_amounts,
	-- [105474] = gate_so,  -- hard to say if these gate SOs only being flagged to let cloakers and shields through is intentional
	-- [104643] = gate_so,
	-- [104647] = gate_so,
	-- [104649] = gate_so,
	-- [105476] = gate_so,
	-- [104525] = gate_so,
	-- [104639] = gate_so,
	-- [104640] = gate_so,
	[100374] = disable,  -- disable dock snipers, apparently harassers and turrets arent enough
	[100370] = disable,
}
