local GroupAILevelModModule = {}

local function undo_zealification_func(group_ai)
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
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
	}
	group_ai.unit_categories.medic_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4")
	}
	group_ai.unit_categories.medic_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
	}
end

function GroupAILevelModModule.CS_normal(group_ai, is_death_sentence)
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

	if is_death_sentence then
		undo_zealification_func(group_ai)
	end
end

function GroupAILevelModModule.FBI_hard(group_ai, is_death_sentence)
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

	if is_death_sentence then
		undo_zealification_func(group_ai)
	end

	for _, category in pairs(group_ai.unit_categories) do
		category.unit_types.murkywater = clone(category.unit_types.america)
	end
end

function GroupAILevelModModule.CITY_overkill(group_ai, is_death_sentence)
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

	if is_death_sentence then
		undo_zealification_func(group_ai)
	end
end

return GroupAILevelModModule