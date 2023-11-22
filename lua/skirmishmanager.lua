if ASS:get_var("is_client") then
	return
end

-- Make enemy units switch difficulty factions over waves
local wave_unit_categories = tweak_data.skirmish:moon_wave_unit_categories()

function SkirmishManager:_moon_swap_units(wave_number)
	if not self:is_skirmish() then
		return
	end

	self._moon_unit_wave_index = wave_unit_categories[wave_number] and wave_number or self._moon_unit_wave_index or self._start_wave

	local prefixes = wave_unit_categories[self._moon_unit_wave_index] or wave_unit_categories[#wave_unit_categories]

	tweak_data.group_ai:moon_swap_units(prefixes)
end

ASS:post_hook( SkirmishManager, "init_finalize", SkirmishManager._moon_swap_units )
ASS:post_hook( SkirmishManager, "_apply_modifiers_for_wave", SkirmishManager._moon_swap_units )
