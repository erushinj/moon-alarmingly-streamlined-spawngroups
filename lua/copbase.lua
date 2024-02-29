if ASS:get_var("is_client") then
	return
end

local mapping = ASS:require("weapon_mapping")
CopBase._moon_weapon_mapping = mapping

local level_id = ASS:get_var("level_id")
ASS:pre_hook( CopBase, "post_init", function(self)
	local name = self._unit:name():key()
	local weapon_swap = mapping[level_id] and mapping[level_id][name] or mapping[name]

	if not weapon_swap then
		return
	end

	if type(weapon_swap) ~= "table" then
		self._default_weapon_id = weapon_swap
	else
		if not self._default_weapons then
			self._default_weapon_id = table.random(weapon_swap)
		else
			for selection, id in pairs(weapon_swap) do
				self._default_weapons[selection] = id
			end
		end
	end
end )
