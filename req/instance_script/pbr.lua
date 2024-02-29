local patches = {
	mountain_surface = table.set(101414, 101415),
}

return {
	["levels/instances/unique/pbr/pbr_mountain_surface/world/world"] = function(result)
		local no_shields_dozers = tweak_data.group_ai:moon_preferred_groups_instance("no_shields_dozers")

		for _, element in pairs(result.default.elements) do
			if patches.mountain_surface[element.id] then
				element.values.preferred_spawn_groups = no_shields_dozers
			end
		end
	end,
}
