if not ASS then

	ASS = {
		mod_path = ModPath,
		settings = {
			is_massive = true,
			beta_assaults = true
		}
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:req_func_suffix()
		local beta_string = self.settings.beta_assaults and "beta_" or ""
		local sh_string = StreamHeist and "streamlined_heisting" or "vanilla"

		return beta_string .. sh_string
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