if ASS.is_editor_or_client then
	return
end

local instance_script_patch_path = ASS.utils.get_script_patch_path("instance")
local instance_script_patches = instance_script_patch_path and ASS:require(instance_script_patch_path)
if not instance_script_patches then
	return
end

ASS:log("info", "Current level has instance script patches...")

Hooks:PostHook(CoreWorldInstanceManager, "_get_instance_mission_data", "ass__get_instance_mission_data", function(self, path)
	local func = instance_script_patches[path]
	if func then
		local result = Hooks:GetReturn()
		if result then
			func(result)
		else
			ASS:log("warn", "Instance \"%s\" unavailable!", path)
		end
	end
end)
