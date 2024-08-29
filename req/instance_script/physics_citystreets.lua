local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local difficulty = ASS.difficulty
local patches = {
	ticketmachine = {
		dozers = table.set(100011, 100012, 100013),
		bad_filters_randoms = table.set(100009, 100018, 100014, 100016),
		dw_filter = 100017,
		dw_randoms = 100015,
	},
}

-- active on low difficulties, reduce dozer spam but make it more difficult to know what you got
return {
	["levels/instances/mods/physics_instance_d1_ticketmachine/world/world"] = function(result)
		local ticketmachine = patches.ticketmachine

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if ticketmachine.dozers[id] then
				element.values.moon_data = {
					enemy = tweak_data.moon.units.dozers_any,
				}
			elseif ticketmachine.bad_filters_randoms[id] then  -- difficulty level check elements are bad and should be removed from the game, actually
				element.values.enabled = false
			elseif id == ticketmachine.dw_filter then
				element.values.difficulty = difficulty  -- always active

				if overkill then
					table.insert(element.values.on_executed, { id = 100008, delay = 0.5, })  -- explosion
				end
			elseif id == ticketmachine.dw_randoms then
				element.values.on_executed = {
					{ id = 100010, delay = 0, delay_rand = 3, },  -- cloaker
					{ id = 100011, delay = 0, delay_rand = 3, },  -- dozer
				}

				local nothingburger_count = normal and 7 or hard and 4 or 1
				for _ = 1, nothingburger_count do
					table.insert(element.values.on_executed, { id = 100019, delay = 0, })  -- do nothing
				end
			end
		end
	end,
}
