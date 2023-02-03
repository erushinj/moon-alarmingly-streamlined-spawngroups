local ASSGroupAITweakDataModule = {}

--	BASE ARRAYS
--[[
	tac_swats = {
		20.25,
		13.5,
		6.75
	}
	tac_heavys = {
		6.75,
		13.5,
		20.25
	}
	tac_shields_tazers = {
		special_weight * 0.66,
		special_weight * 1.32,
		special_weight * 2.00,
	}
	tac_tanks_spoocs = {
		special_weight * 0.33,
		special_weight * 0.66,
		special_weight * 1.00,
	}
]]

function ASSGroupAITweakDataModule.unit_categories_streamlined_heisting(tweak_data_group_ai, difficulty_index)
	if not difficulty_index then
		log("[ASS] Variable 'difficulty_index' does not exist")
		return
	end

	if difficulty_index < 4 then
		tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
		}
	end

	tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
	}
	tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01")
	}
	tweak_data_group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
	}
	tweak_data_group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
		Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
	}
	tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
	}
	tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
	}
end

function ASSGroupAITweakDataModule.unit_categories_vanilla(tweak_data_group_ai, difficulty_index)
	if not difficulty_index then
		log("[ASS] Variable 'difficulty_index' does not exist")
		return
	end

	--	oh boy.
	if difficulty_index < 4 then
		tweak_data_group_ai.unit_categories.FBI_swat_M4 = tweak_data_group_ai.unit_categories.CS_swat_MP5
		tweak_data_group_ai.unit_categories.FBI_swat_R870 = tweak_data_group_ai.unit_categories.CS_swat_R870
		tweak_data_group_ai.unit_categories.FBI_heavy_G36 = tweak_data_group_ai.unit_categories.CS_heavy_M4
		tweak_data_group_ai.unit_categories.FBI_heavy_R870 = tweak_data_group_ai.unit_categories.CS_heavy_R870
		tweak_data_group_ai.unit_categories.FBI_shield = tweak_data_group_ai.unit_categories.CS_shield
		tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = tweak_data_group_ai.unit_categories.CS_cop_C45_R870.unit_types.russia
		tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
	else
		if difficulty_index < 6 then
			tweak_data_group_ai.unit_categories.FBI_swat_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
			}
			tweak_data_group_ai.unit_categories.FBI_swat_R870.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
			}
		elseif difficulty_index < 8 then
			tweak_data_group_ai.unit_categories.FBI_swat_M4.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
			}
			tweak_data_group_ai.unit_categories.FBI_swat_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
			}
			tweak_data_group_ai.unit_categories.FBI_swat_R870.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
			}
			tweak_data_group_ai.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
			}
			tweak_data_group_ai.unit_categories.FBI_shield.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
			}
		else
			tweak_data_group_ai.unit_categories.FBI_swat_M4 = tweak_data_group_ai.unit_categories.CS_swat_MP5
			tweak_data_group_ai.unit_categories.FBI_swat_R870 = tweak_data_group_ai.unit_categories.CS_swat_R870
			tweak_data_group_ai.unit_categories.FBI_swat_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			}
			tweak_data_group_ai.unit_categories.FBI_swat_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			}
			tweak_data_group_ai.unit_categories.FBI_swat_R870.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
			}
			tweak_data_group_ai.unit_categories.FBI_heavy_G36 = tweak_data_group_ai.unit_categories.CS_heavy_M4
			tweak_data_group_ai.unit_categories.FBI_heavy_R870 = tweak_data_group_ai.unit_categories.CS_heavy_R870
			tweak_data_group_ai.unit_categories.FBI_heavy_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
			}
			tweak_data_group_ai.unit_categories.FBI_heavy_R870.unit_types.murkywater = tweak_data_group_ai.unit_categories.FBI_heavy_R870.unit_types.america
		end
		tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.russia = tweak_data_group_ai.unit_categories.CS_swat_MP5.unit_types.russia
		tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = tweak_data_group_ai.unit_categories.CS_swat_R870.unit_types.russia
	end

	--	overkill hates fbi agents
	tweak_data_group_ai.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	tweak_data_group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}
	tweak_data_group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	--	add lmg dozers to mayhem
	if difficulty_index == 6 then
		table.insert(tweak_data_group_ai.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
		table.insert(tweak_data_group_ai.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
		table.insert(tweak_data_group_ai.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
		table.insert(tweak_data_group_ai.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
		table.insert(tweak_data_group_ai.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
	end

	--	new special limits, from easy to death sentence
	local limits = {
		shield = { 0, 2, 2, 4, 4, 6, 6, 8 },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4 },
		taser = { 0, 0, 1, 1, 2, 3, 3, 4 },
		tank = { 0, 0, 0, 1, 1, 2, 2, 3 },
		spooc = { 0, 0, 0, 1, 2, 3, 3, 4 }
	}
	for special, limit in pairs(limits) do
		tweak_data_group_ai.special_unit_spawn_limits[special] = limit[difficulty_index] or limit[#limit]
	end
end

ASSGroupAITweakDataModule.unit_categories_beta_streamlined_heisting = ASSGroupAITweakDataModule.unit_categories_streamlined_heisting
ASSGroupAITweakDataModule.unit_categories_beta_vanilla = ASSGroupAITweakDataModule.unit_categories_vanilla

function ASSGroupAITweakDataModule.task_data_streamlined_heisting(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end
end

function ASSGroupAITweakDataModule.task_data_vanilla(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end

	tweak_data_group_ai.flash_grenade.timer = math.lerp(2, 1, f)

	tweak_data_group_ai.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	tweak_data_group_ai.besiege.assault.sustain_duration_max = tweak_data_group_ai.besiege.assault.sustain_duration_min
	tweak_data_group_ai.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	tweak_data_group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
	tweak_data_group_ai.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
	tweak_data_group_ai.besiege.assault.force = { 12, 14, 16 }
	tweak_data_group_ai.besiege.assault.force_pool = { 40, 50, 60 }

	tweak_data_group_ai.besiege.regroup.duration = { 30, 25, 20 }

	tweak_data_group_ai.besiege.recon.force = { 2, 4, 6 }
	tweak_data_group_ai.besiege.recon.interval = { 0, 0, 0 }
	tweak_data_group_ai.besiege.recon.interval_variation = 0
end

function ASSGroupAITweakDataModule.task_data_beta_streamlined_heisting(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end

	local special_weight = math.lerp(3, 5, f)
	local shields_tazers_weight = special_weight * 2
	local assault_weights = {
		tac_swats_a = { 13.5, 4.5, 0 },
		tac_swats_b = { 6.75, 2.25, 0 },
		tac_swats_c = { 0, 4.5, 4.5 },
		tac_swats_d = { 0, 2.25, 2.25 },
		tac_heavys_a = { 4.5, 4.5, 0 },
		tac_heavys_b = { 2.25, 2.25, 0 },
		tac_heavys_c = { 0, 4.5, 13.5 },
		tac_heavys_d = { 0, 2.25, 6.75 },
		tac_shields_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_shields_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tazers_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_tazers_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tanks_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_tanks_b = { 0, special_weight * 0.33, special_weight },
		tac_spoocs_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_spoocs_b = { 0, special_weight * 0.33, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	--	avoiding issues if new groups are added in vanilla
	for group, _ in pairs(tweak_data_group_ai.besiege.assault.groups) do
		tweak_data_group_ai.besiege.assault.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(assault_weights) do
		tweak_data_group_ai.besiege.assault.groups[group] = weights
	end

	tweak_data_group_ai.besiege.reenforce.groups = {
		reenforce_a = { 1, 1, 0 },
		reenforce_b = { 3, 1, 1 },
		reenforce_c = { 0, 1, 0 },
		reenforce_d = { 0, 1, 3 }
	}
end

function ASSGroupAITweakDataModule.task_data_beta_vanilla(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end

	local special_weight = math.lerp(3, 5, f)
	local shields_tazers_weight = special_weight * 2
	local assault_weights = {
		tac_swats_a = { 13.5, 4.5, 0 },
		tac_swats_b = { 6.75, 2.25, 0 },
		tac_swats_c = { 0, 4.5, 4.5 },
		tac_swats_d = { 0, 2.25, 2.25 },
		tac_heavys_a = { 4.5, 4.5, 0 },
		tac_heavys_b = { 2.25, 2.25, 0 },
		tac_heavys_c = { 0, 4.5, 13.5 },
		tac_heavys_d = { 0, 2.25, 6.75 },
		tac_shields_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_shields_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tazers_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_tazers_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tanks_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_tanks_b = { 0, special_weight * 0.33, special_weight },
		tac_spoocs_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_spoocs_b = { 0, special_weight * 0.33, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	--	avoiding issues if new groups are added in vanilla
	for group, _ in pairs(tweak_data_group_ai.besiege.assault.groups) do
		tweak_data_group_ai.besiege.assault.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(assault_weights) do
		tweak_data_group_ai.besiege.assault.groups[group] = weights
	end

	tweak_data_group_ai.flash_grenade.timer = math.lerp(2, 1, f)

	tweak_data_group_ai.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	tweak_data_group_ai.besiege.assault.sustain_duration_max = tweak_data_group_ai.besiege.assault.sustain_duration_min
	tweak_data_group_ai.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	tweak_data_group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
	tweak_data_group_ai.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
	tweak_data_group_ai.besiege.assault.force = { 12, 14, 16 }
	tweak_data_group_ai.besiege.assault.force_pool = { 40, 50, 60 }

	tweak_data_group_ai.besiege.regroup.duration = { 30, 25, 20 }

	tweak_data_group_ai.besiege.recon.force = { 2, 4, 6 }
	tweak_data_group_ai.besiege.recon.interval = { 0, 0, 0 }
	tweak_data_group_ai.besiege.recon.interval_variation = 0
end

return ASSGroupAITweakDataModule