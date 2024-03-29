if ASS:get_var("is_client") then
	return
end

-- Make enemy units switch difficulty factions over waves
function SkirmishManager:_moon_swap_units(wave_number)
	if self:is_skirmish() then
		tweak_data.group_ai:moon_swap_units(tweak_data.skirmish:moon_wave_unit_categories(wave_number or 1))
	end
end

ASS:post_hook( SkirmishManager, "init_finalize", SkirmishManager._moon_swap_units )
ASS:post_hook( SkirmishManager, "_apply_modifiers_for_wave", SkirmishManager._moon_swap_units )
