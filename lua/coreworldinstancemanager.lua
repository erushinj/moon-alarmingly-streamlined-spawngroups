if Network:is_client() or Global.editor_mode then
	return
end

local instance_script_patches = ASS:instance_script_patches()
if not instance_script_patches then
	return
end

-- local _get_instance_mission_data_original = CoreWorldInstanceManager._get_instance_mission_data
-- function CoreWorldInstanceManager:_get_instance_mission_data(path, ...)
-- 	local result = _get_instance_mission_data_original(self, path, ...)
-- 	local func = instance_script_patches[path]

-- 	if func then
-- 		func(result)
-- 	end

-- 	return result
-- end

ASS:post_hook( CoreWorldInstanceManager, "_get_instance_mission_data", function(self, path, ...)
	local func = instance_script_patches[path]

	if func then
		local result = Hooks:GetReturn()

		func(result)

		return result
	end
end )
