if Network:is_client() then
	return
end

local CopWeaponSwaps = ASS:require("CopWeaponSwaps")
local CopTweakSwaps = ASS:require("CopTweakSwaps")

local func = ASS:req_func_name()

if not CopWeaponSwaps[func] then
	ASS:func_missing_error(func, "CopWeaponSwaps")
end

if not CopTweakSwaps[func] then
	ASS:func_missing_error(func, "CopTweakSwaps")
end

if Global.ass_was_poked_with_stick then
	return
end

local weapon_mapping = CopWeaponSwaps[func]()
local tweak_mapping = CopTweakSwaps[func]()

Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)
	local weapon_swap = weapon_mapping[self._unit:name():key()]
	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end

	local unit_tweak = tweak_mapping.swaps[self._tweak_table]
	local unit_tweak_override = tweak_mapping.override[self._unit:name():key()]
	if unit_tweak then
		self._post_init_change_tweak_name = unit_tweak_override or unit_tweak
	end
end )


Hooks:PostHook( CopBase, "change_char_tweak", "ass_change_char_tweak", function(self, tweak)
	if not (Global.game_settings and Global.game_settings.single_player) then
		managers.network:session():send_to_peers_synched("sync_change_char_tweak", self._unit, tweak)
	end
end )