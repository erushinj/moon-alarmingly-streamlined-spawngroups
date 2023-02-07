if not ASS then

	ASS = {
		mod_path = ModPath,
		is_stream_heist = StreamHeist,
		settings = {
			is_massive = true,
			beta_assaults = true,
			level_mods = true,
			street_assaults = true,
			fixed_freq = true
		},
		_level_mod = {
			-- by job id
			jewelry_store = "CS_normal",
			four_stores = "CS_normal",
			nightclub = "CS_normal",
			mallcrasher = "CS_normal",
			ukrainian_job = "CS_normal",
			ukrainian_job_prof = "CS_normal",
			branchbank_deposit = "CS_normal",
			branchbank_cash = "CS_normal",
			branchbank_prof = "CS_normal",
			branchbank_gold_prof = "CS_normal",
			watchdogs = "FBI_hard",
			watchdogs_night = "FBI_hard",
			shoutout_raid = "FBI_hard",
			pbr = "FBI_hard",
			pbr2 = "FBI_hard",
			des = "FBI_hard",
			roberts = "FBI_hard",
			hox = "FBI_hard",
			hox_3 = "FBI_hard",
			chill_combat = "FBI_hard",
			arena = "CITY_overkill",
			arm_fac = "CITY_overkill",
			arm_par = "CITY_overkill",
			arm_hcm = "CITY_overkill",
			arm_cro = "CITY_overkill",
			arm_und = "CITY_overkill",
			arm_for = "CITY_overkill",

			--	by level id
			alex_3 = "FBI_hard",
			framing_frame_3 = "FBI_hard",

			--	classics
			red2 = "CS_normal",
			run = "CS_normal",
			flat = "FBI_hard",
			glace = "FBI_hard",
			dinner = "CITY_overkill",
			dah = "CITY_overkill",
			pal = "CS_normal",
			man = "FBI_hard",
			nmh = "CITY_overkill"
		},
		_street_levels = {
			run = true,
			glace = true,
			peta = true,
			hox_1 = true,
			jolly = true,
			nail = true,
			chew = true,
			spa = true,
			hvh = true,
			bph = true,
			sand = true,
			trai = true
		}
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:req_func_name()
		local beta_string = self.settings.beta_assaults and "beta_" or ""
		local sh_string = self.is_stream_heist and "streamlined_heisting" or "vanilla"

		return beta_string .. sh_string
	end

	local level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id
	local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id

	function ASS:level_mod()
		local level_mod = self._level_mod[job_id] or self._level_mod[level_id]

		return self.is_stream_heist and level_mod
	end

	function ASS:street_level()
		local street_level = self._street_levels[level_id]

		return --[[self.is_stream_heist and]] street_level
	end

	TheFixesPreventer = TheFixesPreventer or {}
	TheFixesPreventer.fix_gensec_shotgunner_in_murkywater = true

end

local required = {}
if RequiredScript and not required[RequiredScript] then

	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	required[RequiredScript] = true

end