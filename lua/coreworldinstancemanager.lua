if ASS.is_editor_or_client then
	return
end

local instance_script_patches = ASS:script_patches("instance")
if not instance_script_patches then
	return ASS:log("info", "No instance script patches for current level...")
end

ASS:post_hook( CoreWorldInstanceManager, "_get_instance_mission_data", function(self, path)
	local func = instance_script_patches[path]

	if func then
		local result = Hooks:GetReturn()

		if not result then
			ASS:log("warn", "Instance \"%s\" unavailable!", path)
		else
			func(result)

			return result
		end
	end
end )
