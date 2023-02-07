if not Network:is_server() then
	return
end

local CopBaseModule = ASS:require("CopBaseModule")

local weapon_mapping = CopBaseModule["weapon_mapping_" .. ASS:req_func_name()]()
local tweak_mapping = CopBaseModule["tweak_mapping_" .. ASS:req_func_name()]()

Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)
	self._default_weapon_id = weapon_mapping[self._unit:name():key()] or self._default_weapon_id

	local unit_tweak = tweak_mapping.swaps[self._tweak_table]
	local unit_tweak_override = tweak_mapping.override[self._unit:name():key()]
	if unit_tweak then
		self._post_init_change_tweak_name = unit_tweak_override or unit_tweak
	end
end )


Hooks:PostHook( CopBase, "change_char_tweak", "ass_change_char_tweak", function(self, tweak)
	managers.network:session():send_to_peers_synched("sync_change_char_tweak", self._unit, tweak)
end )