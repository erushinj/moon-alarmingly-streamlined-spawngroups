if ASS.is_client then
	return
end

-- improved smg unit support
-- if a tier is missing smg units and reuses riflemen, try to give them smgs when appropriate
local function is_swat_heavy_1_3(u_name)
	local continent, tier

	for name, cont in pairs(tweak_data.moon.enemy_replacements) do
		for id, tr in pairs(cont) do
			if tr.swat_1 == tr.swat_3 and tr.swat_1 == u_name or tr.heavy_1 == tr.heavy_3 and tr.heavy_1 == u_name then
				continent = name
				tier = id

				break
			end
		end
	end

	return continent, tier
end
Hooks:PreHook( CopBrain, "set_spawn_entry", "ass_set_spawn_entry", function(self, spawn_entry, tactics_map)
	local u_category = tweak_data.group_ai.unit_categories[spawn_entry and spawn_entry.unit]
	local u_keys = u_category and u_category.moon_u_keys

	if not u_keys then
		return
	end

	local weight_swat_3 = u_keys.swat_3 or 0
	local weight_heavy_3 = u_keys.heavy_3 or 0
	if weight_swat_3 < 1 and weight_heavy_3 < 1 then
		return
	end

	local weight_swat_1 = u_keys.swat_1 or 0
	local weight_heavy_1 = u_keys.heavy_1 or 0
	local replacement_chance = (weight_swat_3 + weight_heavy_3) / (weight_swat_1 + weight_swat_3 + weight_heavy_1 + weight_heavy_3)
	if replacement_chance <= 0 then
		return
	end

	local continent, tier = math.random() < replacement_chance and is_swat_heavy_1_3(self._unit:name())
	local unit_smg_replacements = tweak_data.moon.unit_smg_replacements
	local replace_id = unit_smg_replacements[continent] and unit_smg_replacements[continent][tier]
	if not replace_id then
		return
	end

	local replace_weapon = tweak_data.character.weap_unit_names[table.index_of(tweak_data.character.weap_ids, replace_id)]
	if not replace_weapon then
		return
	end

	local inventory = alive(self._unit) and self._unit:inventory()
	local base = inventory and self._unit:base()
	if base then
		base._default_weapon_id = replace_id
		inventory:add_unit_by_name(replace_weapon, true)
	end
end )
