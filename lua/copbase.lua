if ASS.is_client then
	return
end

Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)
	local weapon_swap = tweak_data.moon.weapon_mapping[self._unit:name():key()]

	if not weapon_swap then
		-- nothing
	elseif type(weapon_swap) ~= "table" then
		self._default_weapon_id = weapon_swap
	elseif weapon_swap[1] then
		self._default_weapon_id = table.random(weapon_swap)
	elseif self._default_weapons then
		for selection, id in pairs(weapon_swap) do
			self._default_weapons[selection] = id
		end
	else
		ASS:log("warn", "Unsupported weapon swap of type \"%s\" for unit with default weapon ID \"%s\"!", type(weapon_swap), self._default_weapon_id)
	end
end )
