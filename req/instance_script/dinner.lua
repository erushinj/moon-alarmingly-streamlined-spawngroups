local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

return {
	["levels/instances/unique/dinner/quad_meat/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if element.id == 100002 then  -- choose_random_variation
				if normal then
					-- nothing
				elseif hard then
					element.values.on_executed = {
						{ id = 100004, delay = 0, },  -- 3
						{ id = 100005, delay = 0, },  -- 2
						{ id = 100000, delay = 0, },  -- 1
					}
				else
					element.values.on_executed = {
						{ id = 100005, delay = 0, },  -- 2
						{ id = 100000, delay = 0, },  -- 1
					}
				end
			end
		end
	end,
	["levels/instances/unique/dinner/triple_meat/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if element.id == 100002 then  -- choose_random_variation
				if normal then
					-- nothing
				elseif hard then
					element.values.on_executed = {
						{ id = 100003, delay = 0, },  -- 3
						{ id = 100004, delay = 0, },  -- 2
						{ id = 100004, delay = 0, },  -- 2
						{ id = 100005, delay = 0, },  -- 2
						{ id = 100005, delay = 0, },  -- 2
						{ id = 100005, delay = 0, },  -- 2
					}
				else
					element.values.on_executed = {
						{ id = 100004, delay = 0, },  -- 2
						{ id = 100005, delay = 0, },  -- 2
					}
				end
			end
		end
	end,
}
