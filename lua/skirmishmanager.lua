if ASS.is_client then
	return
end

-- Make enemy units switch difficulty factions over waves
function SkirmishManager:_moon_swap_units(wave_number)
	if self:is_skirmish() then
		tweak_data.group_ai:moon_swap_units(tweak_data.moon.skirmish_wave_tiers[wave_number or 1])
	end
end

Hooks:PostHook( SkirmishManager, "init_finalize", "ass_init_finalize", SkirmishManager._moon_swap_units )
Hooks:PostHook( SkirmishManager, "_apply_modifiers_for_wave", "ass__apply_modifiers_for_wave", SkirmishManager._moon_swap_units )
