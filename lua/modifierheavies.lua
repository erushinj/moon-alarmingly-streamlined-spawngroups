if ASS:get_var("is_client") then
	return
end

local u_key_mapping = {
	swat_1 = "heavy_1",
	swat_2 = "heavy_2",
	swat_3 = "heavy_1",
}
ModifierHeavies._moon_u_key_mapping = u_key_mapping

ASS:override( ModifierHeavies, "init", function(self, ...)
	self.super.init(self, ...)

	for _, difficulty in pairs(tweak_data.levels:moon_enemy_replacements()) do
		for u_key in pairs(difficulty) do
			local new_key = u_key_mapping[u_key]
			local mapped_unit = difficulty[new_key]

			if mapped_unit then
				difficulty[u_key] = mapped_unit
			end
		end
	end

	tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
end )
