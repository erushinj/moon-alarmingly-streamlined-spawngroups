if ASS.is_client then
	return
end

-- Improved SMG unit support
-- If a tier is missing SMG units and reuses riflemen, try to give them SMGs when appropriate
function CopBrain:moon_try_swap_rifle_to_smg(replacement_chance)
	if not replacement_chance or replacement_chance == 0 or math.random() > replacement_chance then
		return
	end

	local base = self._unit:base()
	local moon_data = base and base.moon_data
	if not moon_data then
		return
	end

	local continent, tier, u_key_matches = moon_data.continent, moon_data.tier, moon_data.u_key_matches
	if not u_key_matches then
		return
	elseif not (u_key_matches.swat_1 and u_key_matches.swat_3) and not (u_key_matches.heavy_1 and u_key_matches.heavy_3) then
		return
	end

	local unit_smg_replacements = tweak_data.moon.unit_smg_replacements
	local replace_id = unit_smg_replacements[continent] and unit_smg_replacements[continent][tier]
	if replace_id then
		base:moon_try_replace_weapon(replace_id)
	end
end

Hooks:PreHook(CopBrain, "set_spawn_entry", "ass_set_spawn_entry", function(self, spawn_entry)
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
end)
