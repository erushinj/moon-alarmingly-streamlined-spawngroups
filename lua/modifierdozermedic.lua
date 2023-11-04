-- adjust to support all factions and the CS tank unit category
local random_units = tweak_data.levels:moon_random_units()

ModifierDozerMedic._moon_dozer_add = tweak_data.levels:moon_units().dozer_5
ModifierDozerMedic._moon_dozer_tables = {
	[random_units.dozers_any] = true,
	[random_units.dozers_no_mini] = true,
}

ASS:override( ModifierDozerMedic, "init", ModifierSkulldozers.moon_init )
