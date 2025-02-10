local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

local harassers = tweak_data.moon.units.marshals_far
local dozers_no_med = tweak_data.moon.units.dozers_no_med
local dozers_no_mini = tweak_data.moon.units.dozers_no_mini
local dozers_any = tweak_data.moon.units.dozers_any
local gensec_ids = ASS.utils.gen_remove_random_value({ 103175, 103176, })
local cloaker_group_interval = {
	values = {
		interval = 60,  -- interval 240s -> 60s
	},
}
local chance_all_containers_closed = normal and 0 or hard and 0.05 or 0.1
local chance_zero_traversal_covers = normal and 0 or hard and 0.05 or 0.1
local chance_zero_top_containers = normal and 0 or hard and 0.05 or 0.1
local chance_disable_catwalk_far = normal and 0 or 0.3  -- reduces likelihood to 0.5 * (1 - chance)
local chance_no_keycard = normal and 0.1 or hard and 0.2 or 0.3
local chance_all_middle_doors_opened = normal and 0.1 or 0.3
local chance_all_office_doors_closed = overkill and 0.4 or 0.1
local zero_traversal_covers = math.random() < chance_zero_traversal_covers
local zero_top_containers = math.random() < chance_zero_top_containers
local all_containers_closed = math.random() < chance_all_containers_closed
local disable_catwalk_far = math.random() < chance_disable_catwalk_far
local no_keycard = math.random() < chance_no_keycard
local all_middle_doors_opened = math.random() < chance_all_middle_doors_opened
local all_office_doors_closed = math.random() < chance_all_office_doors_closed
local container_open_chance = {
	values = {
		chance = all_containers_closed and 0 or overkill and 0.1 or 0.2,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}

return {
	[102900] = {  -- disabled top container amounts
		values = {
			amount = zero_top_containers and 10 or overkill and 3 or 1,
			amount_random = 10,  -- same as vanilla
		},
	},
	[100007] = {  -- disabled traversal cover amounts
		values = {
			amount = zero_traversal_covers and 13 or overkill and 3 or 1,
			amount_random = 7,  -- same as vanilla
		},
	},
	[102246] = container_open_chance,
	[102253] = container_open_chance,
	[102260] = container_open_chance,
	[102278] = container_open_chance,
	[102296] = container_open_chance,
	[102301] = container_open_chance,
	[102307] = container_open_chance,
	[102313] = container_open_chance,
	[102331] = container_open_chance,
	[102348] = container_open_chance,
	[103923] = container_open_chance,
	[103939] = container_open_chance,
	[104950] = container_open_chance,
	[103489] = cloaker_group_interval,
	[101715] = cloaker_group_interval,
	[101880] = {  -- opened doors middle
		values = {
			amount = all_middle_doors_opened and 4 or overkill and 2 or 1,
			amount_random = all_middle_doors_opened and 0 or 1,
		},
	},
	[100770] = {  -- opened doors office
		values = {
			amount = all_office_doors_closed and 0 or normal and 2 or hard and 1 or 0,
			amount_random = all_office_doors_closed and 0 or 2,
		},
	},
	[105038] = no_keycard and disable or nil,
	[104143] = disable,  -- disable reenforce on the drill, assault enemies already walk by frequently
	[104144] = disable,
	[103563] = disable_catwalk_far and disable or nil,
	[103606] = {  -- activate catwalk behind office
		reinforce = {
			{
				name = "catwalk_far",
				force = 3,
				position = Vector3(-8550, 8995, 330),
			},
		},
	},
	[103607] = {  -- activate catwalk around office
		reinforce = {
			{
				name = "catwalk_near",
				force = 3,
				position = Vector3(-8240, 7460, 330),
			},
		},
	},
	[101357] = {
		values = {
			difficulty = 0.5,
		},
	},
	[102158] = disable,  -- disable diff increase on first assault end
	[103469] = {  -- diff increase on drill completion
		difficulty = 0.75,
		on_executed = {
			{ id = 102804, delay = 30, },
		},
	},
	[104186] = {  -- max diff on sending away the trap container
		on_executed = {
			{ id = 102162, delay = 0, },
		},
	},
	[gensec_ids()] = { enemy = Idstring("units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"), },
	[gensec_ids()] = { enemy = Idstring("units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"), },
	[104446] = { enemy = harassers, },  -- container top harassers, swat
	[104447] = { enemy = harassers, },
	[104582] = { enemy = harassers, },
	[104584] = { enemy = harassers, },
	[104585] = { enemy = harassers, },
	[104787] = { enemy = harassers, },
	[104941] = { enemy = harassers, },
	[104942] = { enemy = harassers, },
	[104943] = { enemy = harassers, },
	[104944] = { enemy = harassers, },
	[101731] = { enemy = harassers, },
	[103516] = { enemy = harassers, },
	[104452] = { enemy = harassers, },
	[104469] = { enemy = harassers, },
	[104986] = { enemy = harassers, },
	[101531] = { enemy = harassers, },  -- fbi
	[101532] = { enemy = harassers, },
	[101534] = { enemy = harassers, },
	[101738] = { enemy = harassers, },
	[101739] = { enemy = harassers, },
	[102012] = { enemy = harassers, },
	[102888] = { enemy = harassers, },
	[102889] = { enemy = harassers, },
	[102890] = { enemy = harassers, },
	[102891] = { enemy = harassers, },
	[104372] = { enemy = harassers, },
	[104375] = { enemy = harassers, },
	[104376] = { enemy = harassers, },
	[104378] = { enemy = harassers, },
	[104433] = { enemy = harassers, },
	[102353] = { enemy = harassers, },  -- city
	[102355] = { enemy = harassers, },
	[102356] = { enemy = harassers, },
	[102357] = { enemy = harassers, },
	[102359] = { enemy = harassers, },
	[102360] = { enemy = harassers, },
	[102892] = { enemy = harassers, },
	[102893] = { enemy = harassers, },
	[102894] = { enemy = harassers, },
	[102895] = { enemy = harassers, },
	[104473] = { enemy = harassers, },
	[104856] = { enemy = harassers, },
	[104856] = { enemy = harassers, },
	[104858] = { enemy = harassers, },
	[104859] = { enemy = harassers, },
	[104860] = { enemy = harassers, },
	[102473] = { enemy = harassers, },  -- zeal
	[102877] = { enemy = harassers, },
	[102878] = { enemy = harassers, },
	[102885] = { enemy = harassers, },
	[102886] = { enemy = harassers, },
	[102887] = { enemy = harassers, },
	[102896] = { enemy = harassers, },
	[102897] = { enemy = harassers, },
	[102898] = { enemy = harassers, },
	[104365] = { enemy = harassers, },
	[104861] = { enemy = harassers, },
	[104863] = { enemy = harassers, },
	[104867] = { enemy = harassers, },
	[104868] = { enemy = harassers, },
	[104873] = { enemy = harassers, },
	[102404] = { enemy = dozers_no_med, },  -- corridor dozers
	[102407] = { enemy = dozers_no_med, },
	[102410] = { enemy = dozers_no_med, },
	[102413] = { enemy = dozers_no_med, },
	[102402] = { enemy = dozers_no_med, },
	[102408] = { enemy = dozers_no_med, },
	[102409] = { enemy = dozers_no_med, },
	[102414] = { enemy = dozers_no_med, },
	[102405] = { enemy = dozers_no_med, },
	[102406] = { enemy = dozers_no_med, },
	[102411] = { enemy = dozers_no_med, },
	[102412] = { enemy = dozers_no_med, },
	[101241] = { enemy = dozers_no_med, },  -- van dozers
	[101242] = { enemy = dozers_no_med, },
	[101243] = { enemy = dozers_no_med, },
	[103092] = { enemy = dozers_any, },  -- backyard heli dozers
	[103091] = { enemy = dozers_any, },
	[103088] = { enemy = dozers_any, },
	[103090] = { enemy = dozers_any, },
	[103093] = { enemy = dozers_any, },
	[103094] = { enemy = dozers_any, },
	[103087] = { enemy = dozers_no_mini, },  -- starting area heli dozers
	[103096] = { enemy = dozers_no_mini, },
	[103095] = { enemy = dozers_no_mini, },
	[103097] = { enemy = dozers_no_mini, },
	[102190] = { enemy = dozers_no_mini, },
	[100621] = { enemy = dozers_no_mini, },
}
