local GroupAIUnitCategoriesModule = {}

function GroupAIUnitCategoriesModule.streamheist(group_ai, difficulty_index)
	if difficulty_index < 4 then
		group_ai.unit_categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		group_ai.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
		group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
		group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
		}
		group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
		}
	end

	group_ai.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
	}
	group_ai.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01")
	}
	group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
	}
	group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
		Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
	}
	group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
	}
	group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
	}

	local limits = {
		shield = { 0, 2, 2, 3, 3, 4, 4, 5 },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4 },
		taser = { 0, 0, 1, 1, 2, 2, 3, 3 },
		tank = { 0, 0, 0, 1, 1, 2, 2, 3 },
		spooc = { 0, 0, 0, 1, 1, 2, 2, 3 }
	}
	local difficulty_index = ASS.settings.max_intensity and 8 or difficulty_index
	for special, limit in pairs(limits) do
		group_ai.special_unit_spawn_limits[special] = limit[difficulty_index] or limit[#limit]
	end
end

function GroupAIUnitCategoriesModule.vanilla(group_ai, difficulty_index)
	--	oh boy.
	if difficulty_index < 4 then
		group_ai.unit_categories.FBI_swat_M4 = group_ai.unit_categories.CS_swat_MP5
		group_ai.unit_categories.FBI_swat_R870 = group_ai.unit_categories.CS_swat_R870
		group_ai.unit_categories.FBI_heavy_G36 = group_ai.unit_categories.CS_heavy_M4
		group_ai.unit_categories.FBI_heavy_R870 = group_ai.unit_categories.CS_heavy_R870
		group_ai.unit_categories.FBI_shield = group_ai.unit_categories.CS_shield
		group_ai.unit_categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
		}
		group_ai.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
		}
		group_ai.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
		}
		group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = group_ai.unit_categories.CS_cop_C45_R870.unit_types.russia
		group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
	else
		if difficulty_index < 6 then
			group_ai.unit_categories.FBI_swat_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
			}
			group_ai.unit_categories.FBI_swat_R870.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
			}
		elseif difficulty_index < 8 then
			group_ai.unit_categories.FBI_swat_M4.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
			}
			group_ai.unit_categories.FBI_swat_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
			}
			group_ai.unit_categories.FBI_swat_R870.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
			}
			group_ai.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
			}
			group_ai.unit_categories.FBI_shield.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
			}
		else
			group_ai.unit_categories.FBI_swat_M4 = group_ai.unit_categories.CS_swat_MP5
			group_ai.unit_categories.FBI_swat_R870 = group_ai.unit_categories.CS_swat_R870
			group_ai.unit_categories.FBI_swat_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			}
			group_ai.unit_categories.FBI_swat_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			}
			group_ai.unit_categories.FBI_swat_R870.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
			}
			group_ai.unit_categories.FBI_heavy_G36 = group_ai.unit_categories.CS_heavy_M4
			group_ai.unit_categories.FBI_heavy_R870 = group_ai.unit_categories.CS_heavy_R870
			group_ai.unit_categories.FBI_heavy_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
			}
			group_ai.unit_categories.FBI_heavy_R870.unit_types.murkywater = group_ai.unit_categories.FBI_heavy_R870.unit_types.america
		end
		group_ai.unit_categories.FBI_suit_C45_M4.unit_types.russia = group_ai.unit_categories.CS_swat_MP5.unit_types.russia
		group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = group_ai.unit_categories.CS_swat_R870.unit_types.russia
	end

	--	overkill hates fbi agents
	group_ai.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}
	group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	--	correct vh federales dozer
	if difficulty_index < 5 then
		group_ai.unit_categories.FBI_tank.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
		}
	end

	--	add lmg dozers to mayhem
	if difficulty_index == 6 then
		table.insert(group_ai.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
		table.insert(group_ai.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
		table.insert(group_ai.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
		table.insert(group_ai.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
		table.insert(group_ai.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
	end

	--	new special limits, from easy to death sentence
	local limits = {
		shield = { 0, 2, 2, 4, 4, 6, 6, 8 },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4 },
		taser = { 0, 0, 1, 1, 2, 3, 3, 4 },
		tank = { 0, 0, 0, 1, 1, 2, 2, 3 },
		spooc = { 0, 0, 0, 1, 2, 3, 3, 4 }
	}
	local difficulty_index = ASS.settings.max_intensity and 8 or difficulty_index
	for special, limit in pairs(limits) do
		group_ai.special_unit_spawn_limits[special] = limit[difficulty_index] or limit[#limit]
	end
end

GroupAIUnitCategoriesModule.beta_streamheist = GroupAIUnitCategoriesModule.streamheist
GroupAIUnitCategoriesModule.beta_vanilla = GroupAIUnitCategoriesModule.vanilla

--	streamlined heisting only below
function GroupAIUnitCategoriesModule.revert_zeal_specials(group_ai)
	group_ai.unit_categories.spooc.unit_types.america = {
		Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
	}
	group_ai.unit_categories.CS_tazer.unit_types.america = {
		Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
	}
	group_ai.unit_categories.FBI_tank.unit_types.america = {
		Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
		Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
	}
	group_ai.unit_categories.medic_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4")
	}
	group_ai.unit_categories.medic_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
	}
end

function GroupAIUnitCategoriesModule.CS_normal(group_ai)
	group_ai.unit_categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
	}
	group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
	}
	group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
	}
	group_ai.unit_categories.FBI_swat_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
	}
	group_ai.unit_categories.FBI_swat_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
	}
	group_ai.unit_categories.FBI_heavy_G36.unit_types.america = {
		Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
	}
	group_ai.unit_categories.FBI_heavy_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
	}
	group_ai.unit_categories.FBI_shield.unit_types.america = {
		Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
	}
end

function GroupAIUnitCategoriesModule.FBI_hard(group_ai)
	group_ai.unit_categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	group_ai.unit_categories.FBI_swat_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
	}
	group_ai.unit_categories.FBI_swat_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
	}
	group_ai.unit_categories.FBI_heavy_G36.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
	}
	group_ai.unit_categories.FBI_heavy_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
	}
	group_ai.unit_categories.FBI_shield.unit_types.america = {
		Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
	}

	for _, category in pairs(group_ai.unit_categories) do
		category.unit_types.murkywater = clone(category.unit_types.america)
	end
end

function GroupAIUnitCategoriesModule.CITY_overkill(group_ai)
	group_ai.unit_categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	group_ai.unit_categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	group_ai.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	group_ai.unit_categories.FBI_swat_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
	}
	group_ai.unit_categories.FBI_swat_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2")
	}
	group_ai.unit_categories.FBI_heavy_G36.unit_types.america = {
		Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
	}
	group_ai.unit_categories.FBI_heavy_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
	}
	group_ai.unit_categories.FBI_shield.unit_types.america = {
		Idstring("units/payday2/characters/ene_city_shield/ene_city_shield")
	}
end

return GroupAIUnitCategoriesModule