local utils = {}

-- math.lerp, with parameters reordered to better work with multiple returns/unpack
function utils.lerp(t, a, b)
	t = math.clamp(tonumber(t) or 0, 0, 1)
	if type(a) == "number" and type(b) == "number" then
		return math.lerp(a, b, t)
	end
end

-- Generates a function that removes and returns a random value from v
function utils.gen_remove_random_value(v)
	return function()
		return table.remove(v, math.random(#v))
	end
end

-- "if not table.contains(v, e) then table.insert(v, e) end" together
function utils.try_insert(v, e)
	if e ~= nil and type(v) == "table" and not table.contains(v, e) then
		table.insert(v, e)
	end
end

-- clone/deep_clone, with check that v is a table
function utils.check_clone(v, shallow)
	if type(v) == "table" then
		return shallow and clone(v) or deep_clone(v)
	end
	return v
end

-- table.list_add for maps
function utils.map_add(...)
	local result = {}
	for _, tbl in ipairs({ ... }) do
		for k, v in pairs(tbl) do
			result[k] = v
		end
	end
	return result
end

function utils.gen_weighted_selector(t)
	if type(t) ~= "table" then
		ASS:log("warn", "Function gen_weighted_selector received non-table argument \"%s\"!", tostring(t))
		t = { t, }
	end

	local selector = WeightedSelector:new()
	for k, v in pairs(t) do
		if type(k) == "number" then
			selector:add(v, 1)
		else
			selector:add(k, v)
		end
	end
	return selector
end

function utils.gen_pro_chance(val, pro_val)
	if ASS.settings.pro_job and pro_val then
		return math.clamp(val + pro_val, 0, 1)
	end
	return val
end

function utils.gen_pro_amount(val, pro_val)
	if ASS.settings.pro_job and pro_val then
		return val + pro_val
	end
	return val
end

-- Used to allow one and only one of a given civilian (usually Bobblehead Bob)
function utils.try_pick_bobblehead_bob(override, civs, bob)
	ASS.picked_bob = override or ASS.picked_bob
	bob = bob or Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1")
	return function()
		if ASS.picked_bob or math.random() > 0.2 then
			return civs
		end
		ASS.picked_bob = true
		return bob
	end
end

-- Used to generate scripted SWAT squads with two unit pools
function utils.scripted_swat_squads(params)
	local hard_target = params.hard_target or 1
	local hard_spawn = params.hard_spawn or "dozers_any"
	local normal_spawn = params.normal_spawn or "specials_any"
	local hard_count = 0
	return function()
		hard_count = hard_count + 1
		return tweak_data.moon.units[hard_count <= hard_target and hard_spawn or normal_spawn]
	end
end

-- Difficulty groupings to use when interpolation won't do the job
-- Normal through VH are "normal", OVK+MH are "hard", DW+DS are "overkill"
function utils.difficulty_groups()
	local real_difficulty_index = ASS.real_difficulty_index
	local normal = real_difficulty_index < 5 and "normal" or nil
	local hard = not normal and real_difficulty_index < 7 and "hard" or nil
	local overkill = not normal and not hard and "overkill" or nil
	return normal and true, hard and true, overkill and true, normal or hard or overkill
end

-- Generates filter element values for script patches
function utils.set_difficulty_groups(group)
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
		ASS:log("warn", "Function set_difficulty_groups received invalid argument \"%s\"!", group)
		return
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
end

function utils.get_script_patch_path(typ)
	local path = string.format("req/%s_script/%s", tostring(typ), tostring(ASS.clean_level_id))
	local full_path = ASS.path .. path .. ".lua"
	return io.file_is_readable(full_path) and path or false
end

return utils
