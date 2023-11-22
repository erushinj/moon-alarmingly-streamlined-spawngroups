if ASS:get_var("is_editor_or_client") then
	return
end

-- force diff to 1 on escape zone becoming available
local function check_executed_objects(area_trigger, current, recursion_depth)
	current = current or area_trigger
	recursion_depth = recursion_depth or 2

	if (area_trigger._values.enabled and true or false) == (area_trigger._moon_set_escape_active and true or false) then
		return
	end

	for _, params in pairs(current._values.on_executed) do
		local element = current:get_mission_element(params.id)
		local element_class = getmetatable(element)

		if element_class == ElementMissionEnd then
			area_trigger._moon_set_escape_active = area_trigger._values.enabled

			managers.groupai:state():moon_set_escape_active(area_trigger._values.enabled)

			return true
		elseif recursion_depth > 0 and element_class == MissionScriptElement then
			if check_executed_objects(area_trigger, element, recursion_depth - 1) then
				return true
			end
		end
	end
end

ASS:post_hook( ElementAreaTrigger, "on_set_enabled", check_executed_objects )
