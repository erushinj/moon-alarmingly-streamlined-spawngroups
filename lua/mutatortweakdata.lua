if ASS.is_client then
	return
end

function MutatorTweakData:moon_replacer_groups(group)
	if not self._moon_replacer_groups then
		self._moon_replacer_groups = {
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
	end

	return self._moon_replacer_groups[group]
end

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
				{ "shield", 2, },
				{ "taser", 2, },
				{ "cloaker", 2, },
				{ "medic_1", 1, },
				{ "medic_2", 1, },
				{ "heavy_1", 4, },
				{ "heavy_2", 4, },
			},
			dozer_1 = {
				{ "dozer_1", 8, },
				{ "dozer_2", 8, },
				{ "dozer_3", 8, },
				{ "dozer_4", 8, },
				{ "dozer_5", 8, },
				{ "shield", 10, },
				{ "taser", 10, },
				{ "cloaker", 10, },
				{ "medic_1", 5, },
				{ "medic_2", 5, },
			},
		}
		for key, units in pairs(splits) do
			local selector = WeightedSelector:new()

			for _, data in pairs(units) do
				if type(data) == "table" then
					selector:add(unpack(data))
				else
					selector:add(data, 1)
				end
			end

			splits[key] = selector
		end

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
