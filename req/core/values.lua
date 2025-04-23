local values = {
	level_mod = {
		"alarmingly_streamlined_spawngroups_level_mod_disable",  -- Use difficulty scaling like vanilla
		"alarmingly_streamlined_spawngroups_level_mod_random",  -- Pick any available Level Mod value (besides zeal)
		"alarmingly_streamlined_spawngroups_level_mod_per_level",  -- Depends on level/full job ID
		"alarmingly_streamlined_spawngroups_level_mod_CS_normal",  -- SWAT
		"alarmingly_streamlined_spawngroups_level_mod_CS_FBI_overkill",  -- SWAT-FBI
		"alarmingly_streamlined_spawngroups_level_mod_FBI_overkill_145",  -- FBI
		"alarmingly_streamlined_spawngroups_level_mod_FBI_CITY_easy_wish",  -- FBI-GenSec
		"alarmingly_streamlined_spawngroups_level_mod_CITY_overkill_290",  -- GenSec
		"alarmingly_streamlined_spawngroups_level_mod_CITY_ZEAL_awesome_difficulty_name",  -- GenSec-ZEAL
		"alarmingly_streamlined_spawngroups_level_mod_ZEAL_sm_wish",  -- ZEAL
	},
	assault_style = {
		"alarmingly_streamlined_spawngroups_assault_style_original",  -- Pre-Housewarming style
		"alarmingly_streamlined_spawngroups_assault_style_streamlined",  -- Spicier SH groups
		"alarmingly_streamlined_spawngroups_assault_style_default",  -- Default SH groups
		"alarmingly_streamlined_spawngroups_assault_style_chicken_plate",  -- PD3 style, somewhat
	},
	skill = {
		"alarmingly_streamlined_spawngroups_skill_1",  -- I'm Too Young To Die
		"alarmingly_streamlined_spawngroups_skill_2",  -- Hey, Not Too Rough
		"alarmingly_streamlined_spawngroups_skill_3",  -- Hurt Me Plenty
		"alarmingly_streamlined_spawngroups_skill_4",  -- Ultra-Violence
		"alarmingly_streamlined_spawngroups_skill_5",  -- Nightmare!
		"alarmingly_streamlined_spawngroups_skill_6",  -- Ultra-Nightmare!!
	},
	shield_arms = {
		"alarmingly_streamlined_spawngroups_shield_arms_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_shield_arms_pistols",  -- Always pistols
		"alarmingly_streamlined_spawngroups_shield_arms_smgs",  -- Always SMGs
		"alarmingly_streamlined_spawngroups_shield_arms_both",  -- Randomize between both pistols and SMGs
	},
	taser_dazers = {
		"alarmingly_streamlined_spawngroups_taser_dazers_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_taser_dazers_rifles",  -- Always rifles
		"alarmingly_streamlined_spawngroups_taser_dazers_sko12s",  -- Always concussive VD-12s
		"alarmingly_streamlined_spawngroups_taser_dazers_both",  -- Randomize between both rifles and concussive VD-12s
	},
	cloaker_balance = {
		"alarmingly_streamlined_spawngroups_cloaker_balance_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_cloaker_balance_smgs",  -- Always SMGs
		"alarmingly_streamlined_spawngroups_cloaker_balance_pistols",  -- Always pistols
		"alarmingly_streamlined_spawngroups_cloaker_balance_both",  -- Randomize between both SMGs and pistols
	},
	-- Rifle Medics
	medic_ordnance = {
		"alarmingly_streamlined_spawngroups_medic_ordnance_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_medic_ordnance_rifles",  -- Always rifles
		"alarmingly_streamlined_spawngroups_medic_ordnance_deagles",  -- Always Deagles
		"alarmingly_streamlined_spawngroups_medic_ordnance_both",  -- Randomize between both rifles and Deagles
	},
	-- Shotgun Medics
	medical_ordinance = {
		"alarmingly_streamlined_spawngroups_medical_ordinance_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_medical_ordinance_shotguns",  -- Always pump shotguns
		"alarmingly_streamlined_spawngroups_medical_ordinance_saigas",  -- Always IZHMAs
		"alarmingly_streamlined_spawngroups_medical_ordinance_both",  -- Randomize between both pump shotguns and IZHMAs
	},
	-- Medicdozers
	geneva_suggestion = {
		"alarmingly_streamlined_spawngroups_geneva_suggestion_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_geneva_suggestion_rifles",  -- Always rifles
		"alarmingly_streamlined_spawngroups_geneva_suggestion_sawed_offs",  -- Always sawed-off shotguns
		"alarmingly_streamlined_spawngroups_geneva_suggestion_both",  -- Randomize between both rifles and sawed-off shotguns
	},
	-- Rifle HRTs
	police_rifle_funding = {
		"alarmingly_streamlined_spawngroups_police_rifle_funding_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_police_rifle_funding_pistols",  -- Always pistols
		"alarmingly_streamlined_spawngroups_police_rifle_funding_rifles",  -- Always rifles
		"alarmingly_streamlined_spawngroups_police_rifle_funding_both",  -- Randomize between both pistols and rifles
	},
	-- Shotgun HRTs
	police_shotgun_funding = {
		"alarmingly_streamlined_spawngroups_police_shotgun_funding_default",  -- Similar to vanilla/default SH
		"alarmingly_streamlined_spawngroups_police_shotgun_funding_shotguns",  -- Always shotguns
		"alarmingly_streamlined_spawngroups_police_shotgun_funding_revolvers",  -- Always revolvers
		"alarmingly_streamlined_spawngroups_police_shotgun_funding_both",  -- Randomize between both shotguns and revolvers
	},
}

return values
