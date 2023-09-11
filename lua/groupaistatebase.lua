local super_serious_dominations = ASS:get_setting("super_serious_dominations")
local max_diff = ASS:get_setting("max_diff")

-- disable dominations during assault if the setting is enabled
local has_room_for_police_hostage_original = GroupAIStateBase.has_room_for_police_hostage
function GroupAIStateBase:has_room_for_police_hostage(...)
	if super_serious_dominations and self:get_assault_mode() then
		return false
	end

	return has_room_for_police_hostage_original(self, ...)
end


-- force diff to 1 in loud if the setting is enabled
local set_difficulty_original = GroupAIStateBase.set_difficulty
function GroupAIStateBase:set_difficulty(value, ...)
	value = max_diff and 1 or value

	return set_difficulty_original(self, value, ...)
end


if ASS:get_var("assault_style") == "default" then
	return
end

-- make marshals register as specials
local function register_special_types(gstate)
	gstate._special_unit_types.marshal = true
	gstate._special_unit_types.marshal_marksman = true
	gstate._special_unit_types.marshal_shield = true
	gstate._special_unit_mappings = {
		marshal_marksman = { "marshal", },
		marshal_shield = { "marshal", },
	}
end

ASS:post_hook( GroupAIStateBase, "_init_misc_data", register_special_types)
ASS:post_hook( GroupAIStateBase, "on_simulation_started", register_special_types)

local register_special_unit_original = GroupAIStateBase.register_special_unit
function GroupAIStateBase:register_special_unit(u_key, category_name, ...)
	local mapping = self._special_unit_mappings[category_name]

	if mapping then
		for _, v in pairs(mapping) do
			register_special_unit_original(self, u_key, v, ...)
		end
	else
		register_special_unit_original(self, u_key, category_name, ...)
	end
end

local unregister_special_unit_original = GroupAIStateBase.unregister_special_unit
function GroupAIStateBase:unregister_special_unit(u_key, category_name, ...)
	local mapping = self._special_unit_mappings[category_name]

	if mapping then
		for _, v in pairs(mapping) do
			unregister_special_unit_original(self, u_key, v, ...)
		end
	else
		unregister_special_unit_original(self, u_key, category_name, ...)
	end
end
