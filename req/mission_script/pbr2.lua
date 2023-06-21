local units = ASS:base_units()
local get_random_units = ASS:get_random_units()
local cops_no_bronco = get_random_units.cops_no_bronco

return {
	-- bronco cops (no)
	[100243] = { enemy = ASS:random_unit(cops_no_bronco) },
	[100230] = { enemy = ASS:random_unit(cops_no_bronco) },
	[100235] = { enemy = ASS:random_unit(cops_no_bronco) },
	[100239] = { enemy = ASS:random_unit(cops_no_bronco) },
}
