local group = select("#", ...) == 0 and "no_args" or tostring(...)

local normal, hard, overkill, enabled
local success = true

local funcs = {
	["disable"] = function()
		normal = false
		hard = false
		overkill = false
		enabled = false
	end,
	["normal"] = function()
		normal = true
		hard = false
		overkill = false
	end,
	["normal_above"] = function()
		normal = true
		hard = true
		overkill = true
	end,
	["hard"] = function()
		normal = false
		hard = true
		overkill = false
	end,
	["hard_below"] = function()
		normal = true
		hard = true
		overkill = false
	end,
	["hard_above"] = function()
		normal = false
		hard = true
		overkill = true
	end,
	["overkill"] = function()
		normal = false
		hard = false
		overkill = true
	end,
	["none"] = function()
		ASS:log("warn", "Function set_difficulty_groups received invalid argument \"%s\"!", group)

		success = false
	end,
}

(funcs[group] or funcs.none)()

if not success then
	return nil
end

return {
	enabled = enabled,
	difficulty_easy = normal,
	difficulty_normal = normal,
	difficulty_hard = normal,
	difficulty_overkill = normal,
	difficulty_overkill_145 = hard,
	difficulty_easy_wish = hard,
	difficulty_overkill_290 = overkill,
	difficulty_sm_wish = overkill,
}
