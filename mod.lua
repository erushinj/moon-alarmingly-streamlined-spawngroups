if not ASS then

	ASS = {
		is_massive = true,
		mod_path = ModPath
	}

end

local required = {}
if RequiredScript and not required[RequiredScript] then

	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	required[RequiredScript] = true

end