if ASS.is_client then
	return
end

-- improved smg unit support
-- if a tier is missing smg units and reuses riflemen, try to give them smgs when appropriate
local function is_swat_heavy_1_3(u_name)
	for continent, cont in pairs(tweak_data.moon.enemy_replacements) do
		for tier, tr in pairs(cont) do
			if tr.swat_1 == tr.swat_3 and tr.swat_1 == u_name or tr.heavy_1 == tr.heavy_3 and tr.heavy_1 == u_name then
				return continent, tier
			end
		end
	end
end

function CopBrain:moon_try_swap_rifle_to_smg(replacement_chance)
	if not replacement_chance or math.random() >= replacement_chance then
		return
	end

	local continent, tier = is_swat_heavy_1_3(self._unit:name())
	local unit_smg_replacements = tweak_data.moon.unit_smg_replacements
	local replace_id = unit_smg_replacements[continent] and unit_smg_replacements[continent][tier]
	local replace_weapon = tweak_data.character.weap_unit_names[table.index_of(tweak_data.character.weap_ids, replace_id)]
	if not replace_weapon then
		return
	end

	local base, inventory = self._unit:base(), self._unit:inventory()
	if base and inventory then
		base._default_weapon_id = replace_id
		local weapon = inventory:get_weapon()

		inventory:add_unit_by_name(replace_weapon, true)

		if alive(weapon) then
			weapon:set_slot(0)
		end
	end
end

Hooks:PreHook( CopBrain, "set_spawn_entry", "ass_set_spawn_entry", function(self, spawn_entry)
	local u_category = tweak_data.group_ai.unit_categories[spawn_entry and spawn_entry.unit]
	local u_keys = u_category and u_category.moon_u_keys

	if not u_keys then
		return
	end

	local weight_smg = (u_keys.swat_3 or 0) + (u_keys.heavy_3 or 0)
	local weight_rifle = (u_keys.swat_1 or 0) + (u_keys.heavy_1 or 0)
	local replacement_chance = weight_smg / (weight_rifle + weight_smg)
	if replacement_chance and replacement_chance > 0 then
		self:moon_try_swap_rifle_to_smg(replacement_chance)
	end
end )
