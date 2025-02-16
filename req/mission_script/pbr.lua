local murkies_far = {
	Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"),
	Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"),
}
local murkies = table.list_add(murkies_far, {
	Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"),
})
local civs = {
	Idstring("units/payday2/characters/civ_male_worker_docks_1/civ_male_worker_docks_1"),
	Idstring("units/payday2/characters/civ_male_worker_docks_2/civ_male_worker_docks_2"),
	Idstring("units/payday2/characters/civ_male_worker_docks_3/civ_male_worker_docks_3"),
}
local sniper = {  -- pretty sure they normally do not participate
	values = {
		participate_to_group_ai = false,
	},
}

return {
	[100472] = {  -- "set diff standard" on spawn, to 0.75
		values = {
			difficulty = 0.5,
		},
	},
	[101144] = {  -- "set diff 1", shortly after everyone is in airlock
		values = {
			difficulty = 0.75,
		},
	},
	[101366] = {  -- team ai vent delay something or other
		values = {
			interval = 1.5,
		},
	},
	[100602] = sniper,  -- snipers
	[100603] = sniper,
	[100604] = sniper,
	[100605] = sniper,
	[100606] = sniper,
	[100369] = sniper,
	[101627] = sniper,
	[101628] = sniper,
	[101236] = sniper,
	[101237] = sniper,
	[101238] = sniper,
	[101239] = sniper,
	[101677] = { enemy = civs, },  -- civs
	[101680] = { enemy = civs, },
	[101681] = { enemy = civs, },
	[101682] = { enemy = civs, },
	[101683] = { enemy = civs, },
	[101684] = { enemy = civs, },
	[101685] = { enemy = civs, },
	[101686] = { enemy = civs, },
	[101687] = { enemy = civs, },
	[100526] = { enemy = murkies_far, },  -- "exterior blockade", elevated
	[100529] = { enemy = murkies_far, },
	[100528] = { enemy = murkies_far, },
	[100561] = { enemy = murkies_far, },
	[100539] = { enemy = murkies_far, },
	[100540] = { enemy = murkies_far, },
	[100530] = { enemy = murkies_far, },
	[100531] = { enemy = murkies_far, },
	[100853] = { enemy = murkies, },  -- ground level
	[100854] = { enemy = murkies, },
	[100855] = { enemy = murkies, },
	[100558] = { enemy = murkies, },
	[100557] = { enemy = murkies, },
	[100556] = { enemy = murkies, },
	[100544] = { enemy = murkies, },
	[100551] = { enemy = murkies, },
	[100548] = { enemy = murkies, },
	[100545] = { enemy = murkies, },
	[100546] = { enemy = murkies, },
	[100550] = { enemy = murkies, },
	[100542] = { enemy = murkies, },
	[100553] = { enemy = murkies, },
	[100543] = { enemy = murkies, },
	[100554] = { enemy = murkies, },
	[100541] = { enemy = murkies, },
	[100555] = { enemy = murkies, },
	[100534] = { enemy = murkies, },
	[100535] = { enemy = murkies, },
	[100536] = { enemy = murkies, },
	[100537] = { enemy = murkies, },
	[100538] = { enemy = murkies, },
	[100549] = { enemy = murkies, },
	[100547] = { enemy = murkies, },
	[101619] = { enemy = murkies, },  -- "murky reinforcements"
	[101620] = { enemy = murkies, },
	[101621] = { enemy = murkies, },
	[101613] = { enemy = murkies, },
	[101616] = { enemy = murkies, },
	[101617] = { enemy = murkies, },
	[101618] = { enemy = murkies, },
	[101622] = { enemy = murkies, },
	[101623] = { enemy = murkies, },
	[101624] = { enemy = murkies, },
	[101625] = { enemy = murkies, },
	[101626] = { enemy = murkies, },
	[100616] = { enemy = murkies, },  -- "left blockade"
	[100617] = { enemy = murkies, },
	[100623] = { enemy = murkies, },
	[100620] = { enemy = murkies, },
	[100621] = { enemy = murkies, },
	[100619] = { enemy = murkies, },
	[100622] = { enemy = murkies, },
	[100626] = { enemy = murkies, },
	[100630] = { enemy = murkies, },
	[100631] = { enemy = murkies, },
	[100632] = { enemy = murkies, },
	[100634] = { enemy = murkies, },
	[100635] = { enemy = murkies, },
	[100638] = { enemy = murkies, },
	[100639] = { enemy = murkies, },
	[100642] = { enemy = murkies, },
	[100643] = { enemy = murkies, },
	[100644] = { enemy = murkies, },
	[100649] = { enemy = murkies, },
	[100009] = { enemy = murkies, },
	[100651] = { enemy = murkies, },
	[100652] = { enemy = murkies, },
	[100656] = { enemy = murkies, },  -- "right blockade"
	[100657] = { enemy = murkies, },
	[100658] = { enemy = murkies, },
	[100659] = { enemy = murkies, },
	[100660] = { enemy = murkies, },
	[100661] = { enemy = murkies, },
	[100662] = { enemy = murkies, },
	[100663] = { enemy = murkies, },
	[100667] = { enemy = murkies, },
	[100668] = { enemy = murkies, },
	[100669] = { enemy = murkies, },
	[100670] = { enemy = murkies, },
	[100671] = { enemy = murkies, },
	[100672] = { enemy = murkies, },
	[100677] = { enemy = murkies, },
	[100678] = { enemy = murkies, },
	[100679] = { enemy = murkies, },
	[100680] = { enemy = murkies, },
	[100681] = { enemy = murkies, },
	[100682] = { enemy = murkies, },
	[100683] = { enemy = murkies, },
	[100689] = { enemy = murkies, },
	[100690] = { enemy = murkies, },
	[100089] = { enemy = murkies, },  -- "mid blockade"
	[100731] = { enemy = murkies, },
	[100732] = { enemy = murkies, },
	[100733] = { enemy = murkies, },
	[100734] = { enemy = murkies, },
	[100735] = { enemy = murkies, },
	[100736] = { enemy = murkies, },
	[100737] = { enemy = murkies, },
	[100741] = { enemy = murkies, },
	[100742] = { enemy = murkies, },
	[100745] = { enemy = murkies, },
	[100746] = { enemy = murkies, },
	[100747] = { enemy = murkies, },
	[100748] = { enemy = murkies, },
	[100749] = { enemy = murkies, },
	[100750] = { enemy = murkies, },
	[100751] = { enemy = murkies, },
	[100804] = { enemy = murkies, },  -- "ffl blockade"
	[100805] = { enemy = murkies, },
	[100806] = { enemy = murkies, },
	[100808] = { enemy = murkies, },
	[100809] = { enemy = murkies, },
	[100810] = { enemy = murkies, },
	[100811] = { enemy = murkies, },
	[100812] = { enemy = murkies, },
	[100813] = { enemy = murkies, },
	[100814] = { enemy = murkies, },
	[100815] = { enemy = murkies, },
	[100816] = { enemy = murkies, },
	[100817] = { enemy = murkies, },
	[100818] = { enemy = murkies, },
	[100819] = { enemy = murkies, },
	[100820] = { enemy = murkies, },
	[100821] = { enemy = murkies, },
	[100822] = { enemy = murkies, },
	[100823] = { enemy = murkies, },
	[100824] = { enemy = murkies, },
	[100825] = { enemy = murkies, },
	[100826] = { enemy = murkies, },
	[100090] = { enemy = murkies, },  -- "ffr blockade"
	[100760] = { enemy = murkies, },
	[100764] = { enemy = murkies, },
	[100765] = { enemy = murkies, },
	[100766] = { enemy = murkies, },
	[100767] = { enemy = murkies, },
	[100768] = { enemy = murkies, },
	[100769] = { enemy = murkies, },
	[100770] = { enemy = murkies, },
	[100771] = { enemy = murkies, },
	[100772] = { enemy = murkies, },
	[100773] = { enemy = murkies, },
	[100774] = { enemy = murkies, },
	[100775] = { enemy = murkies, },
	[100776] = { enemy = murkies, },
	[100777] = { enemy = murkies, },
	[100778] = { enemy = murkies, },
	[100779] = { enemy = murkies, },
	[100780] = { enemy = murkies, },
	[100781] = { enemy = murkies, },
	[100782] = { enemy = murkies, },
	[100692] = { enemy = murkies, },  -- "mfr blockade" (middle front right ?)
	[100693] = { enemy = murkies, },
	[100694] = { enemy = murkies, },
	[100695] = { enemy = murkies, },
	[100703] = { enemy = murkies, },
	[100704] = { enemy = murkies, },
	[100705] = { enemy = murkies, },
	[100706] = { enemy = murkies, },
	[100707] = { enemy = murkies, },
	[100708] = { enemy = murkies, },
	[100709] = { enemy = murkies, },
	[100710] = { enemy = murkies, },
	[100712] = { enemy = murkies, },
	[100713] = { enemy = murkies, },
	[100714] = { enemy = murkies, },
	[100715] = { enemy = murkies, },
	[100716] = { enemy = murkies, },
	[100717] = { enemy = murkies, },
	[100718] = { enemy = murkies, },
	[100719] = { enemy = murkies, },
	[101244] = { enemy = murkies, },  -- "welcoming party spawn"
	[101245] = { enemy = murkies, },
	[101259] = { enemy = murkies, },
	[101260] = { enemy = murkies, },
	[101261] = { enemy = murkies, },
	[101262] = { enemy = murkies, },
	[101263] = { enemy = murkies, },
	[101264] = { enemy = murkies, },
	[101265] = { enemy = murkies, },
	[101266] = { enemy = murkies, },
	[101267] = { enemy = murkies, },
	[101268] = { enemy = murkies, },
	[101269] = { enemy = murkies, },
	[101270] = { enemy = murkies, },
	[101271] = { enemy = murkies, },
	[101272] = { enemy = murkies, },
	[101273] = { enemy = murkies, },
	[101274] = { enemy = murkies, },
	[101275] = { enemy = murkies, },
	[101285] = { enemy = murkies, },  -- "ctrl room defender" murkies
	[101286] = { enemy = murkies, },
	[101287] = { enemy = murkies, },
	[101288] = { enemy = murkies, },
	[101289] = { enemy = murkies, },
	[101290] = { enemy = murkies, },
	[101291] = { enemy = murkies, },
	[101292] = { enemy = murkies, },
	[101293] = { enemy = murkies, },
	[101294] = { enemy = murkies, },
	[101295] = { enemy = murkies, },
	[101296] = { enemy = murkies, },
	[101297] = { enemy = murkies, },
	[101298] = { enemy = murkies, },
	[101299] = { enemy = murkies, },
	[101300] = { enemy = murkies, },
	[100371] = { enemy = tweak_data.moon.units.dozers_any, },
	[100372] = { enemy = tweak_data.moon.units.dozers_any, },
	[100373] = { enemy = tweak_data.moon.units.dozers_any, },
}
