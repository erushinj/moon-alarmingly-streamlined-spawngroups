-- Make enemy units switch difficulty factions over waves
local enemy_replacements = ASS:enemy_replacements()
local enemy_mapping = ASS:enemy_mapping()
local wave_unit_categories = {
	{ CS = "normal", FBI = "normal", },
	{ CS = "normal", FBI = "normal", },
	{ CS = "normal", FBI = "overkill_145", },
	{ CS = "overkill_145", FBI = "overkill_145", },
	{ CS = "overkill_145", FBI = "overkill_290", },
	{ CS = "overkill_290", FBI = "overkill_290", },
	{ CS = "overkill_290", FBI = "sm_wish", },
	{ CS = "sm_wish", FBI = "sm_wish", },
	{ CS = "sm_wish", FBI = "sm_wish", },
}

local function do_swaps(index)
	index = index or 1

	for prefix, difficulty in pairs(wave_unit_categories[index]) do
		for id, data in pairs(tweak_data.group_ai.unit_categories) do
			if id:match(prefix) then
				local units = data.unit_types.america

				for i, unit in ipairs(units) do
					local mapped = enemy_mapping[unit:key()]
					local replacement = enemy_replacements[difficulty] and enemy_replacements[difficulty][mapped]

					if replacement then
						units[i] = replacement
					end
				end
			end
		end
	end
end

ASS:post_hook( SkirmishManager, "init_finalize", function(self)
	if self:is_skirmish() then
		do_swaps()
	end
end )

ASS:post_hook( SkirmishManager, "_apply_modifiers_for_wave", function(self, wave_number)
	self._unit_wave_index = wave_unit_categories[wave_number] and wave_number or self._unit_wave_index

	do_swaps(self._unit_wave_index)
end )
