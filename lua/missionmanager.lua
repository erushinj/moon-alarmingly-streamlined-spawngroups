if Global.editor_mode then
	return
end

-- Add custom mission script changes and triggers for specific levels
-- Execution of mission scripts can trigger reinforce locations (trigger that has just a name disables previously enabled reinforcement with that id)
-- Mission script elements can be disabled or enabled
ASS:pre_hook( MissionManager, "_activate_mission", function (self)

	local mission_script_elements = ASS:mission_script_patches()

	if not mission_script_elements then
		return
	end

	for element_id, data in pairs(mission_script_elements) do
		local element = self:get_element_by_id(element_id)

		if not element then
			log("[AlarminglyStreamlinedSpawngroups] Element not found! " .. element_id)
		else
			-- Check if this element is supposed to trigger reinforce points
			if data.reinforce then
				ASS:mission_hook( element, "on_executed", "reinforce_" .. element_id, function()
					for _, v in pairs(data.reinforce) do
						log("[AlarminglyStreamlinedSpawngroups] Reenforce " ..  v.force and "enabled: " or "disabled: " .. v.name)

						managers.groupai:state():set_area_min_police_force(v.name, v.force, v.position)
					end
				end )
			end

			-- Check if this element is supposed to trigger a difficulty change
			if data.difficulty then
				ASS:mission_hook( element, "on_executed", "difficulty_" .. element_id, function()
					log("[AlarminglyStreamlinedSpawngroups] Difficulty set to: " .. data.difficulty)

					managers.groupai:state():set_difficulty(data.difficulty)
				end )
			end

			-- Check if this element has custom values set
			if data.values then
				for k, v in pairs(data.values) do
					log("[AlarminglyStreamlinedSpawngroups] " .. tostring(k) .. " set to: " .. tostring(v))

					element._values[k] = v
				end
			end

			if data.flashlight ~= nil then
				ASS:mission_hook( element, "on_executed", "flashlight_" .. element_id, function()
					log("[AlarminglyStreamlinedSpawngroups] Flashlights ".. data.flashlight and "enabled" or "disabled")

					managers.game_play_central:set_flashlights_on(data.flashlight)
				end )
			end

			if data.on_executed then
				for _, v in pairs(data.on_executed) do
					local new_element = self:get_element_by_id(v.id)

					if new_element then
						local val, i = table.find_value(element._values.on_executed, function (val) return val.id == v.id end)

						if v.remove then
							if val then
								table.remove(element._values.on_executed, i)
							end
						elseif val then
							val.delay = v.delay or 0
							val.delay_rand = v.delay_rand or 0
						else
							table.insert(element._values.on_executed, v)
						end
					else
					end
				end
			end

			if data.func then
				ASS:mission_hook(element, "on_executed", "func_" .. element_id, data.func)
			end
		end
	end

end )
