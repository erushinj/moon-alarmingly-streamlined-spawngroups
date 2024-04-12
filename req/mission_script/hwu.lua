-- avalon's shadow, version 12, https://modworkshop.net/mod/34760
local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local get_table_index_func = ASS:require("get_table_index_func", true)

-- "spawn guard X" 1 to 10 are secret service, 11 to 16 are cops
-- 17 to 31 is security 1, 32 is security 3

local cops_ids = { 100721, 100722, 100723, 100724, 100725, 100726, }
local cops = clone(tweak_data.levels:moon_units("cops"))
local original_num_cops = #cops
while #cops < #cops_ids do
	table.insert(cops, cops[math.random(original_num_cops)])
end

cops_ids = get_table_index_func(cops_ids)
cops = get_table_index_func(cops)

local securitys_no_mp5 = tweak_data.levels:moon_units("securitys_no_mp5")  -- security 2 is not loaded for some reason

local civs_worker = {
	Idstring("units/payday2/characters/civ_male_worker_1/civ_male_worker_1"),
	Idstring("units/payday2/characters/civ_male_worker_3/civ_male_worker_3"),
}
local warehouse_worker = table.random(civs_worker)
civs_worker = get_table_index_func(civs_worker)

local cameraman_worker = civs_worker()
local smoker_worker = civs_worker()

local civs_casual_male = get_table_index_func({
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_14/civ_male_casual_14"),
})
local civ_casual_male_pos1 = civs_casual_male()
local civ_casual_male_pos2 = civs_casual_male()
local civ_casual_female = table.random({
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_4/civ_female_casual_4"),
})

return {
	[100019] = {  -- players spawned
		reinforce = {
			{
				name = "safehouse_grounds1",
				force = 2,
				position = Vector3(-2450, 1400, 0),
			},
			{
				name = "safehouse_grounds2",
				force = 2,
				position = Vector3(-1100, -2700, 0),
			},
			{
				name = "safehouse_grounds3",
				force = 2,
				position = Vector3(1850, -950, 50),
			},
			{
				name = "safehouse_grounds4",
				force = 2,
				position = Vector3(2050, 3400, 100),
			},
			{
				name = "warehouse_catwalk1",
				force = 2,
				position = Vector3(-8050, -3050, 400),
			},
			{
				name = "warehouse_catwalk2",
				force = 2,
				position = Vector3(-6100, 100, 400),
			},
			{
				name = "warehouse_catwalk3",
				force = 2,
				position = Vector3(-4750, 2400, 400),
			},
			{
				name = "warehouse_exterior1",
				force = 3,
				position = Vector3(-5300, -4500, 0),
			},
			{
				name = "warehouse_exterior2",
				force = 3,
				position = Vector3(-8400, -6250, 0),
			},
		},
	},
	[101727] = {  -- enable ai remove
		reinforce = {
			{ name = "safehouse_grounds1", },
			{ name = "safehouse_grounds2", },
			{ name = "safehouse_grounds3", },
			{ name = "safehouse_grounds4", },
			{ name = "warehouse_catwalk1", },
			{ name = "warehouse_catwalk2", },
			{ name = "warehouse_catwalk3", },
			{ name = "warehouse_exterior1", },
			{ name = "warehouse_exterior2", },
			{
				name = "underground1",
				force = 3,
				position = Vector3(-9300, -6450, -2200),
			},
			{
				name = "underground2",
				force = 3,
				position = Vector3(-10400, -8750, -2400),
			},
			{
				name = "underground3",
				force = 3,
				position = Vector3(-14050, -9450, -2150),
			},
			{
				name = "underground4",
				force = 3,
				position = Vector3(-13450, -6700, -1950),
			},
		},
	},
	[102096] = {  -- escape, stairs group
		values = {
			interval = 30,
		},
	},
	[102096] = {  -- near the open-hatch objective group
		values = {
			interval = 15,
		},
	},
	[102280] = {  -- default chance of warehouse exterior catwalk being broken
		values = {
			chance = normal and 5 or hard and 25 or 45,
		},
	},
	[102281] = {  -- additional chance of warehouse exterior catwalk being broken per purchased asset
		values = {
			chance = normal and 3 or hard and 5 or 10,
		},
	},
	[100453] = {  -- cams, no titan
		values = {
			enabled = false,
		},
	},
	[cops_ids()] = { enemy = cops(), },  -- guards, warehouse
	[cops_ids()] = { enemy = cops(), },
	[cops_ids()] = { enemy = cops(), },
	[cops_ids()] = { enemy = cops(), },
	[cops_ids()] = { enemy = cops(), },
	[cops_ids()] = { enemy = cops(), },
	[100747] = { enemy = securitys_no_mp5, },
	[100748] = { enemy = securitys_no_mp5, },
	[100749] = { enemy = securitys_no_mp5, },
	[100750] = { enemy = securitys_no_mp5, },
	[100751] = { enemy = securitys_no_mp5, },
	[100752] = { enemy = securitys_no_mp5, },
	[100753] = { enemy = securitys_no_mp5, },
	[101418] = { enemy = securitys_no_mp5, },  -- spawn security 003
	[101775] = { enemy = securitys_no_mp5, },  -- underground
	[101776] = { enemy = securitys_no_mp5, },
	[101777] = { enemy = securitys_no_mp5, },
	[101778] = { enemy = securitys_no_mp5, },
	[101779] = { enemy = securitys_no_mp5, },
	[101780] = { enemy = securitys_no_mp5, },
	[101781] = { enemy = securitys_no_mp5, },
	[101925] = { enemy = securitys_no_mp5, },
	[102551] = { enemy = securitys_no_mp5, },
	[100571] = { enemy = civ_casual_female, },  -- civs, safehouse, civ group 1
	[100597] = { enemy = civ_casual_male_pos1, },
	[100612] = { enemy = civ_casual_male_pos2, },
	[100615] = { enemy = civ_casual_male_pos1, },  -- civ group 2
	[100614] = { enemy = civ_casual_female, },
	[100613] = { enemy = civ_casual_male_pos2, },  -- reused in next
	[100616] = { enemy = civ_casual_female, },  -- civ group 3
	[100617] = { enemy = civ_casual_male_pos1, },
	[100618] = { enemy = civ_casual_male_pos1, },  -- civ group 4
	[100619] = { enemy = civ_casual_female, },
	[100620] = { enemy = civ_casual_male_pos2, },
	[100623] = { enemy = smoker_worker, },
	[100624] = { enemy = smoker_worker, },
	[100625] = { enemy = smoker_worker, },
	[100626] = { enemy = smoker_worker, },
	[100627] = { enemy = smoker_worker, },
	[100628] = { enemy = smoker_worker, },
	[100629] = { enemy = smoker_worker, },
	[100426] = { enemy = cameraman_worker, },
	[100427] = { enemy = cameraman_worker, },
	[101020] = { enemy = warehouse_worker, },  -- warehouse, guy at a pc
}
