if not ASS.values then
	ASS.values = ASS:require("req/core/values")
end

if not ASS.values then
	ASS:log("error", "Mod values are missing!")
	return
end

local divider = 16
local last_priority = 696970
local function priority()
	last_priority = last_priority - 1
	return last_priority
end

local menu_builder_params = {
	is_massive = {
		priority = priority(),
		divider = divider,
	},

	level_mod = {
		priority = priority(),
		items = ASS.values.level_mod,
	},
	assault_style = {
		priority = priority(),
		items = ASS.values.assault_style,
	},
	skill = {
		priority = priority(),
		items = ASS.values.skill,
	},
	pro_job = {
		priority = priority(),
		divider = divider,
	},

	doms_scale = { priority = priority(), },
	doms_all_hard = { priority = priority(), },
	doms_super_serious = {
		priority = priority(),
		divider = divider,
	},

	max_values = { priority = priority(), },
	max_diff = { priority = priority(), },
	max_balance_muls = {
		priority = priority(),
		divider = divider,
	},

	gas_grenade_ignore_hostages = { priority = priority(), },
	escapes = { priority = priority(), },
	captain_winters = {
		priority = priority(),
		divider = divider,
	},

	unit_weapons = { priority = priority(), },
	shield_arms = {
		priority = priority(),
		items = ASS.values.shield_arms,
	},
	taser_dazers = {
		priority = priority(),
		items = ASS.values.taser_dazers,
	},
	cloaker_balance = {
		priority = priority(),
		items = ASS.values.cloaker_balance,
	},
	medic_ordnance = {
		priority = priority(),
		items = ASS.values.medic_ordnance,
	},
	medical_ordinance = {
		priority = priority(),
		items = ASS.values.medical_ordinance,
	},
	geneva_suggestion = {
		priority = priority(),
		items = ASS.values.geneva_suggestion,
	},
	police_rifle_funding = {
		priority = priority(),
		items = ASS.values.police_rifle_funding,
	},
	police_shotgun_funding = {
		priority = priority(),
		items = ASS.values.police_shotgun_funding,
		divider = divider,
	},

	dozer_rainbow = {
		priority = priority(),
		divider = divider,
	},
	dozer_1 = {
		priority = priority(),
		disabled = true,
		items = {
			"menu_difficulty_normal",
		},
	},
	dozer_2 = {
		priority = priority(),
		items = {
			"menu_difficulty_normal",
			"menu_difficulty_hard",
			"menu_difficulty_very_hard",
		},
	},
	dozer_3 = {
		priority = priority(),
		items = {
			"menu_difficulty_normal",
			"menu_difficulty_hard",
			"menu_difficulty_very_hard",
			"menu_difficulty_overkill",
			"menu_difficulty_easy_wish",
		},
	},
	dozer_4 = {
		priority = priority(),
		items = {
			"menu_difficulty_normal",
			"menu_difficulty_hard",
			"menu_difficulty_very_hard",
			"menu_difficulty_overkill",
			"menu_difficulty_easy_wish",
			"menu_difficulty_apocalypse",
			"menu_difficulty_sm_wish",
		},
	},
	dozer_5 = {
		priority = priority(),
		items = {
			"menu_difficulty_normal",
			"menu_difficulty_hard",
			"menu_difficulty_very_hard",
			"menu_difficulty_overkill",
			"menu_difficulty_easy_wish",
			"menu_difficulty_apocalypse",
			"menu_difficulty_sm_wish",
		},
	},
}

return menu_builder_params
