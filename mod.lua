if not ASS then

	ASS = {
		mod_path = ModPath,
		save_path = SavePath .. "alarmingly_streamlined_spawngroups.json",
		required = {},
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	ASS.DOZER_TIERS = ASS:require("DozerTiers")
	ASS.group_ai = ASS:require("GroupAI")
	ASS.intensity_tweaks = ASS:require("IntensityTweaks")
	ASS.level_mod_map = ASS:require("LevelModMap")
	ASS.settings = ASS:require("Settings")
	ASS.original_settings = deep_clone(ASS.settings)
	ASS.skill_tweaks = ASS:require("SkillTweaks")
	ASS.values = ASS:require("Values")

	for name, func in pairs(ASS:require("Funcs")) do
		ASS[name] = func
	end

	-- Load settings
	if io.file_is_readable(ASS.save_path) then
		local data = io.load_as_json(ASS.save_path)
		if data then
			local function merge(tbl1, tbl2)
				for k, v in pairs(tbl2) do
					if type(tbl1[k]) == type(v) then
						if type(v) == "table" then
							merge(tbl1[k], v)
						else
							tbl1[k] = v
						end
					end
				end
			end
			merge(ASS.settings, data)
		end
	end

	ASS:menu_hooks()

end

if not ASS.settings.is_massive then
	return
end

if Global.ass_did_not_find_sh then
	return
end

-- hitscanner moment
if StreamHeist and not BLT.Mods:GetModByName("Streamlined Heisting") then
	return
end

-- final fallback
if not StreamHeist then
	return
end

if RequiredScript and not ASS.required[RequiredScript] then

	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	ASS.required[RequiredScript] = true

end
