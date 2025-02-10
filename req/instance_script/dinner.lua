local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local chance_fewest_pigs = normal and 0.2 or hard and 0.4 or 0.6
local fewest_pigs = math.random() < chance_fewest_pigs

return {
	["levels/instances/unique/dinner/quad_meat/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if element.id == 100002 then  -- choose_random_variation
				if fewest_pigs then
					element.values.on_executed = {
						{ id = 100000, delay = 0, },  -- 1
					}
				end
			end
		end
	end,
	["levels/instances/unique/dinner/triple_meat/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if element.id == 100002 then  -- choose_random_variation
				if fewest_pigs then
					element.values.on_executed = {
						{ id = 100004, delay = 0, },  -- 2 (middle pig missing)
						{ id = 100005, delay = 0, },  -- 2 (end pig missing)
					}
				end
			end
		end
	end,
}
