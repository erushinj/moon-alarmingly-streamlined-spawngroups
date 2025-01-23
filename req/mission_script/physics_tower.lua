-- boworks day 2, https://modworkshop.net/mod/31560
local bofa_zeal_spawns = {
	enemy = table.list_add(tweak_data.moon.units.swats, tweak_data.moon.units.heavys, {
		tweak_data.moon.units.shield,
	}),
	static_spawn = {
		continent = "bo_scripted",
	},
}

return {
	[100542] = bofa_zeal_spawns,  -- van swats
	[100543] = bofa_zeal_spawns,
	[100544] = bofa_zeal_spawns,
	[100546] = bofa_zeal_spawns,
	[100547] = bofa_zeal_spawns,
	[100548] = bofa_zeal_spawns,
	[100692] = bofa_zeal_spawns,  -- nightclub swats
	[100695] = bofa_zeal_spawns,
	[100699] = bofa_zeal_spawns,
	[100703] = bofa_zeal_spawns,
	[100715] = bofa_zeal_spawns,
	[100717] = bofa_zeal_spawns,
	[100718] = bofa_zeal_spawns,
	[100719] = bofa_zeal_spawns,
	[100691] = bofa_zeal_spawns,
	[100689] = bofa_zeal_spawns,
	[100697] = bofa_zeal_spawns,
	[100701] = bofa_zeal_spawns,
	[100705] = bofa_zeal_spawns,
	[100706] = bofa_zeal_spawns,
	[100707] = bofa_zeal_spawns,
	[100709] = bofa_zeal_spawns,
	[100690] = bofa_zeal_spawns,
	[100694] = bofa_zeal_spawns,
	[100698] = bofa_zeal_spawns,
	[100702] = bofa_zeal_spawns,
	[100710] = bofa_zeal_spawns,
	[100711] = bofa_zeal_spawns,
	[100713] = bofa_zeal_spawns,
	[100714] = bofa_zeal_spawns,
	[100693] = bofa_zeal_spawns,
	[100696] = bofa_zeal_spawns,
	[100700] = bofa_zeal_spawns,
	[100704] = bofa_zeal_spawns,
	[100708] = bofa_zeal_spawns,
	[100712] = bofa_zeal_spawns,
	[100716] = bofa_zeal_spawns,
	[100720] = bofa_zeal_spawns,
}
