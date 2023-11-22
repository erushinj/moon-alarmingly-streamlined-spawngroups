if ASS:get_var("is_client") then
	return
end

CopBase._moon_weapon_mapping = ASS:require("weapon_mapping")

local level_id = ASS:get_var("level_id")
local level_mod = ASS:get_var("level_mod")
ASS:pre_hook( CopBase, "post_init", function(self)
	local name = self._unit:name():key()
	local level_swap = self._moon_weapon_mapping[level_mod] or self._moon_weapon_mapping[level_id]
	local weapon_swap = level_swap and level_swap[name] or self._moon_weapon_mapping[name]

	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end
end )
