if StreamHeist then
	return
end

ASS:log("SH is not being used, running CopBase changes...")

local weapon_mapping = ASS:require("unit_weapons")
Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)
	local unit_weapon = weapon_mapping[self._unit:name():key()]
	self._default_weapon_id = type(unit_weapon) == "table" and table.random(unit_weapon) or unit_weapon or self._default_weapon_id
end )