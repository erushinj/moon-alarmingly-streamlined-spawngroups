return {
	-- generates a function that removes and returns a random value from v
	gen_remove_random_value = function(v)
		return function()
			return table.remove(v, math.random(#v))
		end
	end,

	-- "if not table.contains(v, e) then table.insert(v, e) end" together
	try_insert = function(v, e)
		if e ~= nil and type(v) == "table" and not table.contains(v, e) then
			table.insert(v, e)
		end
	end,

	-- clone/deep_clone, with check that v is a table
	check_clone = function(v, shallow)
		if type(v) == "table" then
			return shallow and clone(v) or deep_clone(v)
		end

		return v
	end,

	-- used to allow one and only one of a given civilian (usually bobblehead bob)
	try_pick_bobblehead_bob = function(override, civs_table, bob)
		ASS.picked_bob = override or ASS.picked_bob
		bob = bob or Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1")

		return function()
			if ASS.picked_bob or math.random() > 0.2 then
				return civs_table
			end

			ASS.picked_bob = true

			return bob
		end
	end,

	-- used to generate scripted swat squads with two unit pools
	scripted_swat_squads = function(params)
		local hard_target = params.hard_target or 1
		local hard_spawn = params.hard_spawn or "dozers_any"
		local normal_spawn = params.normal_spawn or "specials_any"
		local hard_count = 0

		return function()
			hard_count = hard_count + 1

			return tweak_data.moon.units[hard_count <= hard_target and hard_spawn or normal_spawn]
		end
	end,

	-- difficulty groupings to use when interpolation wont do the job
	-- Normal through VH are "normal", OVK+MH are "hard", DW+DS are "overkill"
	difficulty_groups = function()
		local real_difficulty_index = ASS.real_difficulty_index
		local normal = real_difficulty_index < 5 and "normal" or nil
		local hard = not normal and real_difficulty_index < 7 and "hard" or nil
		local overkill = not normal and not hard and "overkill" or nil

		return normal and true, hard and true, overkill and true, normal or hard or overkill
	end,

	-- generates filter element values for script patches
	set_difficulty_groups = function(group)
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
	end,
}
