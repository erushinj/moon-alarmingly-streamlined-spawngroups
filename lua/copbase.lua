if ASS.is_client then
	return
end

-- Always check America first, always check ZEAL tier last
-- If a unit is reused across tiers or continents, it's best to prioritize tiers/continents that are always loaded
-- American ZEALs and non-American continents are not always loaded
function CopBase._moon_get_enemy_replacement_data(enemy_name)
	local enemy_replacements = tweak_data.moon.enemy_replacements
	local continents = table.map_keys(enemy_replacements, function(a, b) return a == "america" end)
	local tiers = table.map_keys(enemy_replacements.america, function(a, b) return b == "sm_wish" end)
	for _, continent in ipairs(continents) do
		for _, tier in ipairs(tiers) do
			local data = enemy_replacements[continent][tier]
			if data and table.contains(data, enemy_name) then
				local u_key_matches = {}
				for u_key, name in pairs(data) do
					u_key_matches[u_key] = enemy_name == name or nil
				end

				return {
					continent = continent,
					tier = tier,
					u_key_matches = u_key_matches,
				}
			end
		end
	end

	return {
		continent = "america",
		tier = "normal",
		u_key_matches = {},
	}
end

Hooks:PreHook(CopBase, "init", "ass_init", function(self, unit)
	self.moon_data = CopBase._moon_get_enemy_replacement_data(unit:name())
end)

function CopBase._moon_validate_enemy_weapon_id(id)
	local name_index = table.index_of(tweak_data.character.weap_ids, id)
	local name = tweak_data.character.weap_unit_names[name_index]
	if name then
		return id, name
	end

	ASS:log("warn", "Found invalid weapon ID \"%s\"!", id)
end

-- If weapon_swap is specified, this is a replacement after the unit already got their original weapon
function CopBase:moon_try_replace_weapon(weapon_swap)
	local inventory
	if weapon_swap then
		inventory = self._unit:inventory()
	else
		weapon_swap = tweak_data.moon.weapon_mapping[self._unit:name():key()]
		if not weapon_swap then
			return
		end
	end

	local final_swap
	if type(weapon_swap) == "table" then
		if not next(weapon_swap) then
			ASS:log("warn", "Empty table weapon swap on unit with default weapon ID \"%s\"!", self._default_weapon_id)
			return
		end
		final_swap = ASS.utils.gen_weighted_selector(weapon_swap):select()
	else
		final_swap = weapon_swap
	end

	local id, name = CopBase._moon_validate_enemy_weapon_id(final_swap)
	if not id or not name then
		return
	end

	self._default_weapon_id = id
	if inventory then
		inventory:add_unit_by_name(name, true)
	end
end

Hooks:PreHook(CopBase, "post_init", "ass_post_init", CopBase.moon_try_replace_weapon)
