if not ASS then

	ASS = {
		is_massive = true,
		mod_path = ModPath,
		is_offline = Global.game_settings and Global.game_settings.single_player,
		current_job = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"
		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

end

local required = {}
if RequiredScript and not required[RequiredScript] then

	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	required[RequiredScript] = true

end