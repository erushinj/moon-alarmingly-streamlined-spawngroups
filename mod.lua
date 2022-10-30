if not ASS then

	ASS = {
		is_massive = true,
		mod_path = ModPath,
		logging = io.file_is_readable("mods/developer.txt"),
		is_crimenet_offline = Global.game_settings and Global.game_settings.single_player,
		is_trai = Global.level_data and Global.level_data.level_id == "trai" or Global.game_settings and Global.game_settings.level_id == "trai",
		current_factions = {
			"america",
			"russia",
			"zombie",
			"murkywater",
			"federales"
		}
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"
		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:log(...)
		if self.logging then
			log("[AlarminglyStreamlinedSpawngroups] " .. table.concat({...}, " "))
		end
	end

end

local required = {}
if RequiredScript and not required[RequiredScript] then

	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "hooks/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	required[RequiredScript] = true

end