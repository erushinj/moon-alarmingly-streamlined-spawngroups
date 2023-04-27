local GroupAIUnitCategories = {}

local function set_cs_to_fbi(categories)
	local category_map = {
		CS_cop_C45_MP5 = "FBI_suit_C45_M4",
		CS_cop_MP5_R870 = "FBI_suit_M4_MP5",
		CS_cop_stealth_R870 = "FBI_suit_stealth_MP5",
		CS_swat_MP5 = "FBI_swat_M4",
		CS_swat_R870 = "FBI_swat_R870",
		CS_heavy_M4 = "FBI_heavy_G36",
		CS_heavy_R870 = "FBI_heavy_R870",
		CS_shield = "FBI_shield"
	}

	for cs, fbi in pairs(category_map) do
		if categories[cs] and categories[fbi] then
			categories[cs].unit_types = clone(categories[fbi].unit_types)
		end
	end
end


-----------------------------------
---- DIFFICULTY SPECIFIC BELOW ----
-----------------------------------


function GroupAIUnitCategories.normal(categories)
	categories.CS_cop_C45_R870 = {
		access = clone(categories.spooc.access),
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
				Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
			}
		}
	}
	categories.CS_cop_C45_MP5 = deep_clone(categories.CS_cop_C45_R870)
	categories.CS_cop_C45_MP5.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01")
		}
	}
	categories.CS_cop_MP5_R870 = deep_clone(categories.CS_cop_C45_R870)
	categories.CS_cop_MP5_R870.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
			Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
		}
	}
	categories.CS_cop_stealth_R870 = deep_clone(categories.CS_cop_C45_R870)
	categories.CS_cop_stealth_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02") }
	}
	categories.CS_swat_MP5.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") }
	}
	categories.CS_swat_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") }
	}
	categories.CS_heavy_M4.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale") }
	}
	categories.CS_heavy_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870") }
	}
	categories.CS_shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45") }
	}
	categories.FBI_suit_C45_M4 = deep_clone(categories.CS_cop_C45_MP5)
	categories.FBI_suit_M4_MP5 = deep_clone(categories.CS_cop_MP5_R870)
	categories.FBI_suit_stealth_MP5 = deep_clone(categories.CS_cop_stealth_R870)
	categories.FBI_swat_M4 = deep_clone(categories.CS_swat_MP5)
	categories.FBI_swat_R870 = deep_clone(categories.CS_swat_R870)
	categories.FBI_heavy_G36 = deep_clone(categories.CS_heavy_M4)
	categories.FBI_heavy_R870 = deep_clone(categories.CS_heavy_R870)
	categories.FBI_shield = deep_clone(categories.CS_shield)
	categories.FBI_tank.unit_types = {
		america = { Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870") }
	}
end

function GroupAIUnitCategories.hard(categories)
	GroupAIUnitCategories.normal(categories)
end

function GroupAIUnitCategories.overkill(categories)
	GroupAIUnitCategories.hard(categories)

	categories.FBI_suit_C45_M4.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01")
		}
	}
	categories.FBI_suit_M4_MP5.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
			Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
		}
	}
	categories.FBI_suit_stealth_MP5.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02") }
	}
	categories.FBI_swat_M4.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi") }
	}
	categories.FBI_swat_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870") }
	}
	categories.FBI_heavy_G36.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36") }
	}
	categories.FBI_heavy_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870") }
	}
	categories.FBI_shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") }
	}

	table.insert(categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"))
	table.insert(categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"))
	table.insert(categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"))
	table.insert(categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"))
	table.insert(categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"))
end

function GroupAIUnitCategories.overkill_145(categories)
	GroupAIUnitCategories.overkill(categories)

	categories.CS_cop_C45_R870.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
			Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
		}
	}

	set_cs_to_fbi(categories)
end

function GroupAIUnitCategories.easy_wish(categories)
	GroupAIUnitCategories.overkill_145(categories)

	categories.FBI_swat_M4.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city") }
	}
	categories.FBI_swat_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870") }
	}
	categories.FBI_heavy_G36.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36") }
	}
	categories.FBI_heavy_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870") }
	}
	categories.FBI_shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") }
	}

	table.insert(categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
	table.insert(categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
	table.insert(categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
	table.insert(categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
	table.insert(categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
end

function GroupAIUnitCategories.overkill_290(categories)
	GroupAIUnitCategories.easy_wish(categories)

	if ASS.settings.minigun_dozers_on_death_wish then
		table.insert(categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.insert(categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
	end

	set_cs_to_fbi(categories)
end

function GroupAIUnitCategories.sm_wish(categories)
	GroupAIUnitCategories.overkill_290(categories)

	categories.FBI_swat_M4.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi") }
	}
	categories.FBI_swat_R870.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870") }
	}
	categories.FBI_heavy_G36.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36") }
	}
	categories.FBI_heavy_R870.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870") }
	}
	categories.FBI_shield.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") }
	}
	categories.FBI_tank.unit_types = {
		america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic")
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale")
		}
	}

	set_cs_to_fbi(categories)
end


--------------------------------------
---- ASS:req_func() RELATED BELOW ----
--------------------------------------


function GroupAIUnitCategories.old_style_streamlined(group_ai, difficulty_index, special_difficulty_index)
	local limits = {
		shield = { 0, 2, 2, 3, 3, 4, 4, 5 },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4 },
		taser = { 0, 0, 1, 1, 2, 2, 3, 3 },
		tank = { 0, 0, 1, 1, 1, 2, 2, 3 },
		spooc = { 0, 0, 0, 1, 1, 2, 2, 3 }
	}

	for special, limit in pairs(limits) do
		group_ai.special_unit_spawn_limits[special] = limit[special_difficulty_index]
	end
end

function GroupAIUnitCategories.van_style_streamlined()
	GroupAIUnitCategories.old_style_streamlined()
end

function GroupAIUnitCategories.old_style_vanilla(group_ai, difficulty_index, special_difficulty_index)
	local categories = group_ai.unit_categories

	-- oh boy. (hoppip said to keep this as a memorial)
	if difficulty_index < 4 then
		categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.FBI_suit_C45_M4.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") }
		categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
		categories.FBI_suit_M4_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.FBI_suit_M4_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		}
		categories.FBI_suit_M4_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
		categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
		categories.FBI_suit_stealth_MP5.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870") }
		categories.FBI_suit_stealth_MP5.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") }
	else
		categories.FBI_suit_C45_M4.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") }
		categories.FBI_suit_M4_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
		}
		categories.FBI_suit_stealth_MP5.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") }
	end

	categories.FBI_suit_C45_M4.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") }
	categories.FBI_suit_M4_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}
	categories.FBI_suit_stealth_MP5.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") }

	-- new special limits, from easy to death sentence
	local limits = {
		shield = { 0, 2, 2, 4, 4, 6, 6, 8 },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4 },
		taser = { 0, 0, 1, 1, 2, 3, 3, 4 },
		tank = { 0, 0, 1, 1, 1, 2, 2, 3 },
		spooc = { 0, 0, 0, 1, 2, 3, 3, 4 }
	}
	for special, limit in pairs(limits) do
		group_ai.special_unit_spawn_limits[special] = limit[special_difficulty_index]
	end
end

function GroupAIUnitCategories.van_style_vanilla()
	GroupAIUnitCategories.old_style_vanilla()
end


---------------------------------
---- LEVEL MOD RELATED BELOW ----
---------------------------------


function GroupAIUnitCategories.revert_zeal_specials(categories)
	categories.spooc.unit_types.america = { Idstring("units/payday2/characters/ene_spook_1/ene_spook_1") }
	categories.CS_tazer.unit_types.america = { Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1") }
	categories.FBI_tank.unit_types.america = {
		Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
		Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
	}
	categories.medic_M4.unit_types.america = { Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4") }
	categories.medic_R870.unit_types.america = { Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870") }
end

function GroupAIUnitCategories.CS_normal(categories)
	if StreamHeist then
		categories.CS_cop_C45_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
			ASS:is_bad_raging_bull_level() and Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
		}
		categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.FBI_suit_M4_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
	end

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") }

	set_cs_to_fbi(categories)
end

function GroupAIUnitCategories.CS_FBI_overkill(categories)
	if StreamHeist then
		categories.CS_cop_C45_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_C45_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_MP5_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_stealth_R870.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
	end

	categories.CS_swat_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") }
	categories.CS_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") }
	categories.CS_heavy_M4.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") }
	categories.CS_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") }
	categories.CS_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") }

	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }
end

function GroupAIUnitCategories.CS_FBI_pbr2(categories)
	if StreamHeist then
		categories.CS_cop_C45_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_C45_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_MP5_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_stealth_R870.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
	end

	categories.CS_swat_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") }
	categories.CS_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") }
	categories.CS_heavy_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") }
	categories.CS_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") }
	categories.CS_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }

	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }

	categories.FBI_swat_M4.unit_types.america = clone(categories.CS_swat_MP5.unit_types.america)
	categories.FBI_swat_R870.unit_types.america = clone(categories.CS_swat_R870.unit_types.america)
	categories.FBI_heavy_G36.unit_types.america = clone(categories.CS_heavy_M4.unit_types.america)
	categories.FBI_heavy_R870.unit_types.america = clone(categories.CS_heavy_R870.unit_types.america)
	categories.FBI_shield.unit_types.america = clone(categories.CS_shield.unit_types.america)
end

function GroupAIUnitCategories.CS_FBI_man(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }

	set_cs_to_fbi(categories)
end

function GroupAIUnitCategories.CS_FBI_CITY_nmh(categories)
	if StreamHeist then
		categories.CS_cop_C45_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_C45_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_MP5_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		categories.CS_cop_stealth_R870.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
	end

	categories.CS_swat_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") }
	categories.CS_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") }
	categories.CS_heavy_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") }
	categories.CS_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") }
	categories.CS_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }

	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") }
end

function GroupAIUnitCategories.FBI_overkill_145(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }

	set_cs_to_fbi(categories)
end

function GroupAIUnitCategories.FBI_mcmansion(categories)
	GroupAIUnitCategories.FBI_overkill_145(categories)

	table.insert(categories.FBI_swat_M4.unit_types.america, Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"))
	table.insert(categories.FBI_swat_R870.unit_types.america, Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"))

	set_cs_to_fbi(categories)
end

function GroupAIUnitCategories.FBI_CITY_easy_wish(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }

	set_cs_to_fbi(categories)

	categories.CS_swat_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") }
	categories.CS_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") }
	categories.CS_heavy_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") }
	categories.CS_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") }
	categories.CS_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") }
end

function GroupAIUnitCategories.CITY_overkill_290(categories)
	GroupAIUnitCategories.FBI_overkill_145(categories)

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") }

	set_cs_to_fbi(categories)
end

return GroupAIUnitCategories