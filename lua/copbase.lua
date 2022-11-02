if StreamHeist or not Network:is_server() then
	return
end

ASS:log("SH is not being used, running CopBase changes...")

local weapon_mapping = ASS:require("unit_weapons")
local tweak_mapping = ASS:require("unit_tweaks")
Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)
	local unit_weapon = weapon_mapping[self._unit:name():key()]
	self._default_weapon_id = type(unit_weapon) == "table" and table.random(unit_weapon) or unit_weapon or self._default_weapon_id

	local unit_tweak = tweak_mapping.swaps[self._tweak_table]
	local unit_tweak_override = tweak_mapping.override[self._unit:name():key()]
	if unit_tweak then
		self._post_init_change_tweak_name = unit_tweak_override or unit_tweak
	end
end )


-- Hooks:PostHook( CopBase, "change_char_tweak", "ass_change_char_tweak", function(self, tweak)
-- 	if Network:is_server() then
-- 		managers.network:session():send_to_peers_synched("sync_change_char_tweak", self._unit, tweak)
-- 	end
-- end )