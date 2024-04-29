return {
	["levels/instances/unique/flat/flat_door/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if element.id == 100018 then
				element.values.unit_ids_original = element.values.unit_ids
				element.values.unit_ids = {}

				for _, id in pairs(element.values.unit_ids_original) do
					if id ~= 100000 then
						table.insert(element.values.unit_ids, id)
					end
				end
			end
		end
	end,
}
