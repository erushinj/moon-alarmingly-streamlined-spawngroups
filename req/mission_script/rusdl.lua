-- cold stones, https://modworkshop.net/mod/43578
local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local get_table_index_func = ASS:require("get_table_index_func", true)
local try_pick_bobblehead_bob = ASS:require("try_pick_bobblehead_bob", true)

local securitys = {
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"),
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"),
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"),
}
local securitys_1 = get_table_index_func(clone(securitys))
local securitys_2 = get_table_index_func(clone(securitys))
local securitys_3 = get_table_index_func(securitys)
local securitys_ids_1 = get_table_index_func({ 100660, 100709, 100710, })
local securitys_ids_2 = get_table_index_func({ 100711, 100712, })
local securitys_ids_3 = get_table_index_func({ 100713, 100714, })
local dozers_no_cs = tweak_data.levels:moon_units("dozers_no_cs")

local staff_ids = { 100064, 100065, 100062, 100063, 100066, 100089, 100077, 100078, 100083, 100080, 100079, 100081, 100082, 100084, }
local staff = {
	Idstring("units/pd2_dlc2/characters/civ_female_bank_assistant_1/civ_female_bank_assistant_1"),
	Idstring("units/pd2_dlc2/characters/civ_female_bank_assistant_2/civ_female_bank_assistant_2"),
	Idstring("units/payday2/characters/civ_male_business_1/civ_male_business_1"),
	Idstring("units/payday2/characters/civ_male_business_2/civ_male_business_2"),
}
local original_num_staff = #staff
while #staff < #staff_ids do
	table.insert(staff, staff[math.random(original_num_staff)])
end

local civs_any = {
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"),
	Idstring("units/payday2/characters/civ_female_casual_5/civ_female_casual_5"),
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_7/civ_male_casual_7"),
	Idstring("units/payday2/characters/civ_male_casual_8/civ_male_casual_8"),
}

local function get_civs_function(func)
	return function()
		local civ = func()

		if type(civ) == "table" then
			civ = table.remove(civ, math.random(#civ))
		end

		return {
			enemy = civ,
			values = {
				state = false,
				rotation = Rotation(math.rand(360), 0, 0),
			},
		}
	end
end
local civs_left_ids = get_table_index_func({ 100074, 100075, 100088, 100073, 100072, 100076, 100085, })
local civs_right_ids = get_table_index_func({ 100087, 100067, 100086, 100068, 100069, 100070, 100071, })
local civs_staff_ids = get_table_index_func(staff_ids)
local civs_left = get_civs_function(try_pick_bobblehead_bob(nil, clone(civs_any)))
local civs_right = get_civs_function(try_pick_bobblehead_bob(nil, civs_any))
local civs_staff = get_civs_function(function() return staff end, true)

return {
	[100061] = {  -- open vault door
		hunt = true,
	},
	[100655] = {  -- players spawned
		reinforce = {
			{
				name = "left_escape",
				force = 4,  -- big navseg
				position = Vector3(3500, -1750, 0),
			},
			{
				name = "between_escapes",
				force = 2,
				position = Vector3(2250, -2050, 0),
			},
			{
				name = "right_escape",
				force = 2,
				position = Vector3(1100, -2000, 0),
			},
			{
				name = "by_gate",
				force = 2,
				position = Vector3(-200, -1500, 0),
			},
			{
				name = "right_side",
				force = 2,
				position = Vector3(-210, -3950, 0),
			},
		},
		on_executed = {
			-- { id = 100656, delay = 0, },  -- diff 0.4 (normally 0s)
			{ id = 100657, remove = true, },  -- diff 0.75 (normally 45s)
			{ id = 100658, remove = true, },  -- diff 1 (normally 90s)
			-- { id = 100749, delay = 80, },  -- ground sniper 1 (normally 80s)
			{ id = 100753, delay = overkill and 80 or 120, },  -- ground sniper 2 (normally 120s)
		},
	},
	[100656] = {  -- difficulty 0.4 element
		values = {
			difficulty = 0.5,
		},
	},
	[100233] = {  -- started timelock
		on_executed = {
			{ id = 100657, delay = 0, },
		},
	},
	[100114] = {  -- assembled thermite
		on_executed = {
			{ id = 100658, delay = 0, },
		},
	},
	[100751] = {  -- sniper respawn delays
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self._original_on_executed = {
					{ id = 100749, delay = 60, delay_rand = overkill and 30 or 60, },
				}
			end
		end,
	},
	[100754] = {
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self._original_on_executed = {
					{ id = 100753, delay = 60, delay_rand = overkill and 30 or 60, },
				}
			end
		end,
	},
	[100650] = { enemy = dozers_no_cs, },
	[100652] = { enemy = dozers_no_cs, },
	[100693] = { enemy = dozers_no_cs, },
	[100696] = { enemy = dozers_no_cs, },
	[securitys_ids_1()] = { enemy = securitys_1(), },
	[securitys_ids_1()] = { enemy = securitys_1(), },
	[securitys_ids_1()] = { enemy = securitys_1(), },
	[securitys_ids_2()] = { enemy = securitys_2(), },
	[securitys_ids_2()] = { enemy = securitys_2(), },
	[securitys_ids_3()] = { enemy = securitys_3(), },
	[securitys_ids_3()] = { enemy = securitys_3(), },
	[civs_left_ids()] = civs_left(),
	[civs_right_ids()] = civs_right(),
	[civs_left_ids()] = civs_left(),
	[civs_right_ids()] = civs_right(),
	[civs_left_ids()] = civs_left(),
	[civs_right_ids()] = civs_right(),
	[civs_left_ids()] = civs_left(),
	[civs_right_ids()] = civs_right(),
	[civs_left_ids()] = civs_left(),
	[civs_right_ids()] = civs_right(),
	[civs_left_ids()] = civs_left(),
	[civs_right_ids()] = civs_right(),
	[civs_left_ids()] = civs_left(),
	[civs_right_ids()] = civs_right(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
	[civs_staff_ids()] = civs_staff(),
}
