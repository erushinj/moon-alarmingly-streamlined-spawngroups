local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local try_pick_bobblehead_bob = ASS:require("try_pick_bobblehead_bob", true)
local get_table_index_func = ASS:require("get_table_index_func", true)

local securitys = tweak_data.levels:moon_units("securitys")
local securitys_heavy = tweak_data.levels:moon_units("securitys_heavy")

local casual_female = {
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"),
	Idstring("units/payday2/characters/civ_female_casual_5/civ_female_casual_5"),
}
local all_female = table.list_add(casual_female, {
	Idstring("units/payday2/characters/civ_female_party_1/civ_female_party_1"),
	Idstring("units/payday2/characters/civ_female_party_2/civ_female_party_2"),
	Idstring("units/payday2/characters/civ_female_party_3/civ_female_party_3"),
	Idstring("units/payday2/characters/civ_female_party_4/civ_female_party_4"),
})
local civs_male = {
	Idstring("units/payday2/characters/civ_male_business_1/civ_male_business_1"),
	Idstring("units/payday2/characters/civ_male_business_2/civ_male_business_2"),
	Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_5/civ_male_casual_5"),
	Idstring("units/payday2/characters/civ_male_casual_7/civ_male_casual_7"),
	Idstring("units/payday2/characters/civ_male_casual_9/civ_male_casual_9"),
}
local walkers = table.list_add(casual_female, civs_male)
local civs_male_ids = get_table_index_func({
	100170,  -- outside
	100171,
	100172,
	100173,
	100174,
	100180,
	100181,
	100182,
	100183,
	100184,
	101313,  -- inside
	101314,
	104005,
	104006,
	104008,
	104009,
	104010,
	104015,
	104016,
	104017,

})
civs_male = try_pick_bobblehead_bob(nil, civs_male)

local all_staff = {
	Idstring("units/payday2/characters/civ_male_bank_1/civ_male_bank_1"),
	Idstring("units/payday2/characters/civ_male_bank_2/civ_male_bank_2"),
	Idstring("units/payday2/characters/civ_female_bank_1/civ_female_bank_1"),
	Idstring("units/payday2/characters/civ_female_hostess_jacket_1/civ_female_hostess_jacket_1"),
}

local staff_ids = get_table_index_func({ 101308, 101309, 101310, 101311, })
local function staff(override)
	local staffer = override or table.remove(all_staff, math.random(#all_staff))

	return {
		enemy = staffer,
		values = {
			state = false,
		},
	}
end

local disable = {
	values = {
		enabled = false,
	},
}

return {
	[100116] = {  -- slightly delay the first assault
		on_executed = {
			{ id = 100122, delay = 45, },  -- vanilla is 30s
		},
	},
	[100370] = {  -- unused sniper spawn
		values = {
			enabled = true,
		},
	},
	[102124] = {  -- reduce turret chance from 75%
		values = {
			chance = 25,
		},
	},
	[102125] = {  -- turret roll succeeded, disable escapes clearly in its line of sight
		func = function(self)
			for _, id in pairs({ 100754, 100755, }) do
				local element = self:get_mission_element(id)

				if element then
					element:set_enabled(false)
				end
			end
		end,
	},
	[100752] = disable,  -- to offset turret changes, disable back alley escape if the outside security room door spawns
	[104843] = {  -- outside security room door didnt spawn, re-enable back alley escape
		func = function(self)
			local element = self:get_mission_element(100752)

			if element then
				element:set_enabled(true)
			end
		end,
	},
	[100324] = disable,  -- reenforce
	[100022] = {
		on_executed = {  -- make cops drive in a little sooner
			{ id = 100256, delay = 7.5, },
		},
		reinforce = {
			{
				name = "street1",
				force = 2,
				position = Vector3(-750, 450, 0),
			},
			{
				name = "street2",
				force = 2,
				position = Vector3(-1750, 450, 0),
			},
			{
				name = "street3",
				force = 2,
				position = Vector3(-1000, -4000, 0),
			},
			{
				name = "street4",
				force = 2,
				position = Vector3(3000, -4000, 0),
			},
			{
				name = "alley",
				force = 2,
				position = Vector3(2200, 1000, 0),
			},
			{
				name = "plaza",
				force = 3,
				position = Vector3(4250, -1700, 0),
			},
		},
	},
	[100670] = { enemy = securitys, },  -- guards
	[100671] = { enemy = securitys, },
	[100672] = { enemy = securitys, },
	[100673] = { enemy = securitys, },
	[100674] = { enemy = securitys, },
	[100675] = { enemy = securitys, },
	[100676] = { enemy = securitys, },
	[100677] = { enemy = securitys, },
	[100678] = { enemy = securitys, },
	[100679] = { enemy = securitys, },
	[100709] = { enemy = securitys_heavy, },  -- camera men
	[100710] = { enemy = securitys_heavy, },
	[100711] = { enemy = securitys_heavy, },
	[104789] = { enemy = walkers, },  -- walkers
	[104795] = { enemy = walkers, },
	[104803] = { enemy = walkers, },
	[104808] = { enemy = walkers, },
	[104813] = { enemy = walkers, },
	[104790] = { enemy = walkers, },
	[104796] = { enemy = walkers, },
	[104804] = { enemy = walkers, },
	[104809] = { enemy = walkers, },
	[104814] = { enemy = walkers, },
	[104791] = { enemy = walkers, },
	[104800] = { enemy = walkers, },
	[104805] = { enemy = walkers, },
	[104810] = { enemy = walkers, },
	[104815] = { enemy = walkers, },
	[104792] = { enemy = walkers, },
	[104801] = { enemy = walkers, },
	[104806] = { enemy = walkers, },
	[104811] = { enemy = walkers, },
	[104816] = { enemy = walkers, },
	[104794] = { enemy = walkers, },
	[104802] = { enemy = walkers, },
	[104807] = { enemy = walkers, },
	[104812] = { enemy = walkers, },
	[104817] = { enemy = walkers, },
	[100175] = { enemy = casual_female, },  -- outside
	[100176] = { enemy = casual_female, },
	[100177] = { enemy = casual_female, },
	[100178] = { enemy = casual_female, },
	[100179] = { enemy = casual_female, },
	[103835] = { enemy = all_female, },  -- clients
	[103966] = { enemy = all_female, },
	[104003] = { enemy = all_female, },
	[104004] = { enemy = all_female, },
	[104011] = { enemy = all_female, },
	[104012] = { enemy = all_female, },
	[104013] = { enemy = all_female, },
	[104014] = { enemy = all_female, },
	[104030] = staff(table.random(all_staff)),  -- falcogini staff
	[staff_ids()] = staff(),  -- store staff
	[staff_ids()] = staff(),
	[staff_ids()] = staff(),
	[staff_ids()] = staff(),
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
}
