function MutatorTweakData:moon_replacer_groups(group)
	local replacer_groups = self._replacer_groups

	if not replacer_groups then
		replacer_groups = {
			tank_hw = {
				CS = "CS_titan",
				FBI = "FBI_titan",
			},
			tank = {
				CS = "CS_tank",
				FBI = "FBI_tank",
			},
			taser = {
				CS = "CS_tazer",
				FBI = "FBI_tazer",
			},
			shield = {
				CS = "CS_shield",
				FBI = "FBI_shield",
			},
			spooc = {
				CS = "CS_spooc",
				FBI = "FBI_spooc",
			},
			medic = {
				CS = "CS_medic_MP5_R870",
				FBI = "FBI_medic_M4_R870",
			},
		}

		self._replacer_groups = replacer_groups
	end

	return replacer_groups[group]
end

-- could use the weighted selector thing but this works too
function MutatorTweakData:moon_hydra_splits(key)
	local splits = self._moon_hydra_splits

	if not splits then
		splits = {
			marshal_1 = {
				"marshal_1",
				"heavy_1",
			},
			marshal_2 = {
				"marshal_2",
				"heavy_2",
			},
			hrt_1 = {
				"hrt_1",
				"hrt_2",
				"hrt_3",
			},
			swat_1 = {
				"hrt_1",
				"hrt_2",
				"hrt_3",
				"swat_1",
				"swat_2",
				"swat_3",
			},
			heavy_1 = {
				"swat_1",
				"swat_2",
				"swat_3",
				"heavy_1",
				"heavy_2",
				"heavy_1",
			},
			shield = {
				"shield",
				"shield",
				"taser",
				"taser",
				"cloaker",
				"cloaker",
				"medic_1",
				"medic_2",
				"heavy_1",
				"heavy_1",
				"heavy_1",
				"heavy_1",
				"heavy_2",
				"heavy_2",
				"heavy_2",
				"heavy_2",
			},
			dozer_1 = {
				"dozer_1",
				"dozer_1",
				"dozer_1",
				"dozer_1",
				"dozer_1",
				"dozer_1",
				"dozer_1",
				"dozer_1",
				"dozer_2",
				"dozer_2",
				"dozer_2",
				"dozer_2",
				"dozer_2",
				"dozer_2",
				"dozer_2",
				"dozer_2",
				"dozer_3",
				"dozer_3",
				"dozer_3",
				"dozer_3",
				"dozer_3",
				"dozer_3",
				"dozer_3",
				"dozer_3",
				"dozer_4",
				"dozer_4",
				"dozer_4",
				"dozer_4",
				"dozer_4",
				"dozer_4",
				"dozer_4",
				"dozer_4",
				"dozer_5",
				"dozer_5",
				"dozer_5",
				"dozer_5",
				"dozer_5",
				"dozer_5",
				"dozer_5",
				"dozer_5",
				"shield",
				"shield",
				"shield",
				"shield",
				"shield",
				"shield",
				"shield",
				"shield",
				"taser",
				"taser",
				"taser",
				"taser",
				"taser",
				"taser",
				"taser",
				"taser",
				"cloaker",
				"cloaker",
				"cloaker",
				"cloaker",
				"cloaker",
				"cloaker",
				"cloaker",
				"cloaker",
				"medic_1",
				"medic_1",
				"medic_1",
				"medic_1",
				"medic_1",
				"medic_1",
				"medic_1",
				"medic_1",
				"medic_2",
				"medic_2",
				"medic_2",
				"medic_2",
				"medic_2",
				"medic_2",
				"medic_2",
				"medic_2",
			},
		}
		splits.hrt_2 = splits.hrt_1
		splits.hrt_3 = splits.hrt_1
		splits.hrt_4 = splits.hrt_1
		splits.swat_2 = splits.swat_1
		splits.swat_3 = splits.swat_1
		splits.heavy_2 = splits.heavy_1
		splits.taser = splits.shield
		splits.medic_1 = splits.shield
		splits.medic_2 = splits.shield
		splits.cloaker = splits.shield
		splits.dozer_2 = splits.dozer_1
		splits.dozer_3 = splits.dozer_1
		splits.dozer_4 = splits.dozer_1
		splits.dozer_5 = splits.dozer_1
		splits.dozer_hw = splits.dozer_1

		self._moon_hydra_splits = splits
	end

	return splits[key]
end
