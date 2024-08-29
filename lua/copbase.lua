if ASS.is_client then
	return
end

Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)
	local weapon_swap = tweak_data.moon.weapon_mapping[self._unit:name():key()]

	if not weapon_swap then
		-- nothing
	elseif type(weapon_swap) ~= "table" then
		self._default_weapon_id = weapon_swap
	elseif not self._default_weapons then
		self._default_weapon_id = table.random(weapon_swap)
	else
		for selection, id in pairs(weapon_swap) do
			self._default_weapons[selection] = id
		end
	end
end )
