local group = select("#", ...) == 0 and "no_args" or tostring(...)
local normal, hard, overkill, enabled

if group == "disable" then
	normal = false
	hard = false
	overkill = false
	enabled = false
elseif group == "normal" then
	normal = true
	hard = false
	overkill = false
elseif group == "normal_above" then
	normal = true
	hard = true
	overkill = true
elseif group == "hard" then
	normal = false
	hard = true
	overkill = false
elseif group == "hard_below" then
	normal = true
	hard = true
	overkill = false
elseif group == "hard_above" then
	normal = false
	hard = true
	overkill = true
elseif group == "overkill" then
	normal = false
	hard = false
	overkill = true
else
	return nil, ASS:log("warn", "Function set_difficulty_groups received invalid argument \"%s\"!", group)
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
