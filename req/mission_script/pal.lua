local dozers_any = tweak_data.moon.units.dozers_any
local specials_def = tweak_data.moon.units.specials_def
local heavys = tweak_data.moon.units.heavys

return {
	[100770] = { enemy = heavys, },  -- van swats, van 1
	[100771] = { enemy = heavys, },
	[100772] = { enemy = heavys, },
	[100775] = { enemy = heavys, },
	[100776] = { enemy = heavys, },
	[100779] = { enemy = heavys, },  -- van 2
	[100780] = { enemy = heavys, },
	[100781] = { enemy = heavys, },
	-- [100783] = { enemy = heavys, },  -- thats a cloaker ?
	[100785] = { enemy = heavys, },
	[100786] = { enemy = heavys, },
	[100797] = { enemy = heavys, },  -- van 3
	[100798] = { enemy = heavys, },
	[100800] = { enemy = heavys, },
	[100801] = { enemy = heavys, },
	[100826] = { enemy = heavys, },
	[100829] = { enemy = heavys, },  -- van 4
	[100830] = { enemy = heavys, },
	[100833] = { enemy = heavys, },
	[100834] = { enemy = heavys, },
	[100835] = { enemy = heavys, },
	[101733] = { enemy = heavys, },  -- "harasser" spawns on mitchell/wilson's roofs
	[101735] = { enemy = heavys, },
	[101716] = { enemy = heavys, },
	[101718] = { enemy = heavys, },
	[101747] = { enemy = heavys, },  -- destroyed pool chopper spawns
	[101748] = { enemy = heavys, },
	[101749] = { enemy = specials_def, },
	[101750] = { enemy = specials_def, },
	[101652] = { enemy = specials_def, },  -- crashed van, shields
	[101653] = { enemy = specials_def, },
	[102704] = { enemy = specials_def, },
	[102733] = { enemy = specials_def, },
	[102758] = { enemy = specials_def, },
	[102760] = { enemy = specials_def, },
	[101651] = { enemy = dozers_any, },  -- dozers
	[102703] = { enemy = dozers_any, },
	[102745] = { enemy = dozers_any, },
}
