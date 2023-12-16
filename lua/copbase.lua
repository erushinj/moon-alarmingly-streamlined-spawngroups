if ASS:get_var("is_client") then
	return
end

local mapping = ASS:require("weapon_mapping")
CopBase._moon_weapon_mapping = mapping

local level_id = ASS:get_var("level_id")
ASS:pre_hook( CopBase, "post_init", function(self)
	local name = self._unit:name():key()
	local weapon_swap = mapping[level_id] and mapping[level_id][name] or mapping[name]

	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end
end )
