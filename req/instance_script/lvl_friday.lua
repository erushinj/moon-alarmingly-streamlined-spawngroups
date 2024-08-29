local patches = {
	glace_helicopter_swat = table.list_to_set({
		100012,
		100014,
		100030,
		100011,
		100013,
		100029,
		100027,
		100015,
		100031,
		100028,
		100016,
		100032,
	}),
}

return {
	["levels/instances/unique/glace/glace_helicopter_swat/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.glace_helicopter_swat[element.id] then
				element.values.participate_to_group_ai = true
				element.values.moon_data = {
					enemy = tweak_data.moon.units.heavys,
				}
			end
		end
	end,
}
