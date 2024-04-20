local mexican_1 = Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1")
local mexican_2 = Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2")
local mexican_3 = Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3")
local mexican_4 = Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4")
local mexicans = { mexican_1, mexican_2, mexican_3, mexican_4, }
local mexicans_light = { mexican_3, mexican_4, }
local mexicans_heavy = { mexican_1, mexican_2, }
local specials_any = tweak_data.levels:moon_units("specials_any")

return {
	[100428] = { enemy = mexicans_light, },  -- "sniper" spots
	[100429] = { enemy = mexicans_light, },
	[100430] = { enemy = mexicans_light, },
	[100431] = { enemy = mexicans_light, },
	[100432] = { enemy = mexicans_light, },
	[100433] = { enemy = mexicans_light, },
	[100434] = { enemy = mexicans_light, },
	[100435] = { enemy = mexicans_light, },
	[100182] = { enemy = mexicans_heavy, },  -- door openers, poor suckers
	[100183] = { enemy = mexicans_heavy, },
	[100288] = { enemy = mexicans_heavy, },
	[100289] = { enemy = mexicans_heavy, },
	[100290] = { enemy = mexicans_heavy, },
	[100187] = { enemy = mexicans_heavy, },  -- outside the barn door, near cars
	[100184] = { enemy = mexicans_heavy, },
	[100186] = { enemy = mexicans_heavy, },
	[100195] = { enemy = mexicans_heavy, },
	[100192] = { enemy = mexicans, },  -- other spawns
	[100196] = { enemy = mexicans, },
	[100188] = { enemy = mexicans, },
	[100193] = { enemy = mexicans, },
	[100197] = { enemy = mexicans, },
	[100190] = { enemy = mexicans, },
	[100194] = { enemy = mexicans, },
	[100198] = { enemy = mexicans, },
	[100191] = { enemy = mexicans, },
	[100199] = { enemy = mexicans, },
	[100200] = { enemy = mexicans, },
	[100207] = { enemy = mexicans, },
	[100211] = { enemy = mexicans, },
	[100215] = { enemy = mexicans, },
	[100219] = { enemy = mexicans, },
	[100201] = { enemy = mexicans, },
	[100208] = { enemy = mexicans, },
	[100212] = { enemy = mexicans, },
	[100216] = { enemy = mexicans, },
	[100220] = { enemy = mexicans, },
	[100203] = { enemy = mexicans, },
	[100209] = { enemy = mexicans, },
	[100213] = { enemy = mexicans, },
	[100217] = { enemy = mexicans, },
	[100221] = { enemy = mexicans, },
	[100204] = { enemy = mexicans, },
	[100210] = { enemy = mexicans, },
	[100214] = { enemy = mexicans, },
	[100218] = { enemy = mexicans, },
	[100222] = { enemy = mexicans, },
	[101900] = { enemy = specials_any, },  -- van spawns, n
	[101826] = { enemy = specials_any, },
	[101833] = { enemy = specials_any, },
	[101908] = { enemy = specials_any, },
	[101910] = { enemy = specials_any, },
	[101911] = { enemy = specials_any, },
	[101926] = { enemy = specials_any, },
	[101927] = { enemy = specials_any, },
	[101928] = { enemy = specials_any, },
	[101892] = { enemy = specials_any, },  -- h/vh
	[101893] = { enemy = specials_any, },
	[101894] = { enemy = specials_any, },
	[101912] = { enemy = specials_any, },
	[101913] = { enemy = specials_any, },
	[101914] = { enemy = specials_any, },
	[101929] = { enemy = specials_any, },
	[101930] = { enemy = specials_any, },
	[101931] = { enemy = specials_any, },
	[101896] = { enemy = specials_any, },  -- ovk+
	[101898] = { enemy = specials_any, },
	[101899] = { enemy = specials_any, },
	[101916] = { enemy = specials_any, },
	[101917] = { enemy = specials_any, },
	[101919] = { enemy = specials_any, },
	[101932] = { enemy = specials_any, },
	[101933] = { enemy = specials_any, },
	[101934] = { enemy = specials_any, },
}
