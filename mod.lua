if not ASS then
	local load_level = Global.load_level
	local game_settings = Global.game_settings or {}
	local level_data = Global.level_data or {}
	local job_manager = Global.job_manager or {}
	local is_editor = Global.editor_mode or false
	local is_client = Network and Network:is_client() or false
	local is_host = not is_editor and not is_client
	local level_id = load_level and (level_data.level_id or game_settings.level_id) or "no_level"
	local job_id = load_level and (job_manager.current_job and job_manager.current_job.job_id) or "no_job"
	local one_down = game_settings.one_down or false
	local difficulty = game_settings.difficulty or "normal"
	local difficulty_indices = {
		normal = 2,
		hard = 3,
		overkill = 4,
		overkill_145 = 5,
		easy_wish = 6,
		overkill_290 = 7,
		sm_wish = 8,
	}
	local real_difficulty_index = difficulty_indices[difficulty] or 2
	local spawner_level_ids = table.list_to_set({
		"modders_devmap",
		"Enemy_Spawner",
	})

	local clean_level_id = level_id
	for _, end_pattern in pairs({ "_night$", "_day$", "_skip1$", "_skip2$", "_new$", }) do
		clean_level_id = clean_level_id:gsub(end_pattern, "")
	end

	-- Create persistent table used for SH checks and ZEAL Level Mod checks
	Global.alarmingly_streamlined_spawngroups = Global.alarmingly_streamlined_spawngroups or {}

	-- Extends the BLTMod instance, check PAYDAY 2\mods\base\req\BLTMod for base variables and methods
	ASS = ModInstance
	ASS.global = Global.alarmingly_streamlined_spawngroups
	ASS.is_host = is_host
	ASS.is_editor = is_editor
	ASS.is_client = is_client
	ASS.is_editor_or_client = not is_host
	ASS.is_spawner = spawner_level_ids[level_id]
	ASS.one_down = one_down
	ASS.difficulty = difficulty
	ASS.real_difficulty_index = real_difficulty_index
	ASS.level_id = level_id
	ASS.clean_level_id = clean_level_id
	ASS.job_id = job_id
	ASS.required = {}

	-- ASS uses 3 prefixes
	-- "info" -> everything is fine, this is just an informative log
	-- "warn" -> something funky happened, but it can be reasonably handled
	-- "error" -> something funky happened, cannot be reasonably handled, may crash
	function ASS:log(prefix, str, ...)
		local base_str = string.format("[ASS:%s|%s:%s] ", string.upper(tostring(prefix)), level_id, difficulty)
		log(base_str .. string.format(tostring(str), ...))
	end

	-- Script loader
	-- Loads and caches file at specified path as a function, and executes it
	function ASS:require(path, ...)
		if self.required[path] == nil then
			self.required[path] = blt.vm.loadfile(self.path .. path .. ".lua") or false
		end
		return self.required[path] and self.required[path](...)
	end

	ASS.settings = ASS:require("req/core/settings")
	ASS.values = ASS:require("req/core/values")
	ASS.menu_builder_params = ASS:require("req/core/menu_builder_params")
	ASS.skill_level_tweaks = ASS:require("req/core/skill_level_tweaks")
	ASS.level_mod_map = ASS:require("req/core/level_mod_map")

	ASS.utils = ASS:require("req/utils")
	ASS.menu_builder = ASS:require("req/hoplib_menu_builder", "alarmingly_streamlined_spawngroups", ASS.settings, ASS.menu_builder_params)
	ASS.callbacks = ASS:require("req/callbacks")

	-- Blocks scripts from running if no Streamlined Heisting - must be installed, enabled, and from game start
	local sh = BLT.Mods:GetModByName("Streamlined Heisting")
	if not sh then
		ASS.callbacks.sh_not_found()
	elseif not sh:WasEnabledAtStart() or not sh:IsEnabled() then
		ASS.callbacks.sh_disabled()
	end

	ASS.callbacks.on_init()
end

if ASS.been_there_fucked_that and RequiredScript and not ASS.required[RequiredScript] then
	ASS:require("lua/" .. (RequiredScript:gsub(".+/(.+)", "%1")))
end
