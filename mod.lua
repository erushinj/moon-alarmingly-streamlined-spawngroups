if not ASS then

	ASS = {
		is_massive = true,
		mod_path = ModPath,
		logging = io.file_is_readable("mods/developer.txt"),
		current_factions = {
			"america",
			"russia",
			"zombie",
			"murkywater",
			"federales"
		},
		hvh_jobs = {
			"help",
			"nail",
			"haunted"
		},
		murky_to_america_jobs = {
			"pbr",
			"des"
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

	ASS.job_chk = function(job)
		local current_job = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id
		return type(job) == "table" and table.contains(job, current_job) or job == current_job
	end

	ASS.is_offline = function()
		return Global.game_settings and Global.game_settings.single_player
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