local save_version = ASS:get_setting("save_version")

if save_version == ASS:get_setting("save_version", true) then
	return false
end

local funcs = {
	[-1] = function()
		-- random level mod
		local level_mod = ASS:get_setting("level_mod")

		if level_mod == 8 then
			local wanted_i = table.get_vector_index(ASS._values.level_mod, "ass_level_mod_random")

			if wanted_i then
				ASS.settings.level_mod = wanted_i
			end
		elseif level_mod > 1 then
			ASS.settings.level_mod = ASS.settings.level_mod + 1
		end

		local dmg_interval = ASS:get_setting("dmg_interval")
		if dmg_interval > 5 then
			local wanted_value = dmg_interval == 6 and "ass_dmg_interval_0.050" or "ass_dmg_interval_0.000"
			local wanted_i = table.get_vector_index(ASS._values.dmg_interval, wanted_value)

			if wanted_i then
				ASS.settings.dmg_interval = wanted_i
			end
		end

		return true
	end,
	none = function()
		ASS:log("warn", "No save adjustment function found!")

		return false
	end,
}

return (funcs[save_version] or funcs.none)()
