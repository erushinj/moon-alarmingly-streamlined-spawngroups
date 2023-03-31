if Network:is_client() then
	return
end

local CopWeaponSwapsModule = ASS:require("CopWeaponSwapsModule")
local CopTweakSwapsModule = ASS:require("CopTweakSwapsModule")

local func = ASS:req_func_name()

Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)

	local weapon_mapping = CopWeaponSwapsModule[func] and CopWeaponSwapsModule[func]()
	local tweak_mapping = CopTweakSwapsModule[func] and CopTweakSwapsModule[func]()

	if weapon_mapping then
		local weapon_swap = weapon_mapping[self._unit:name():key()]

		if weapon_swap then
			self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
		end
	end

	if tweak_mapping then
		local unit_tweak = tweak_mapping.swaps[self._tweak_table]
		local unit_tweak_override = tweak_mapping.override[self._unit:name():key()]

		if unit_tweak then
			self._post_init_change_tweak_name = unit_tweak_override or unit_tweak
		end
	end

end )


Hooks:PostHook( CopBase, "change_char_tweak", "ass_change_char_tweak", function(self, tweak)
	managers.network:session():send_to_peers_synched("sync_change_char_tweak", self._unit, tweak)
end )