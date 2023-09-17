local fbi_office_1 = Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1")
local fbi_office_2 = Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2")
local fbi_office_3 = Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3")
local fbi_office_4 = Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4")
local fbi_female_1 = Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1")  -- unique
local fbi_female_2 = Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2")
local fbi_female_3 = Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3")
local fbi_female_4 = Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4")
local fbi_boss_1 = Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1")  -- unique

local fbi_offices = { fbi_office_1, fbi_office_2, fbi_office_3, fbi_office_4, fbi_female_2, fbi_female_3, fbi_female_4, }
local fbi_offices_harassers = table.list_add(fbi_offices, { fbi_female_1, fbi_boss_1, })
local is_easy_wish = ASS:get_var("real_difficulty_index") > 5

return {
	-- fbi offices/females
	[101490] = { enemy = fbi_offices },  -- atrium
	[101492] = { enemy = fbi_offices },
	[101493] = { enemy = fbi_offices },
	[101494] = { enemy = fbi_offices },
	[101495] = { enemy = fbi_offices },
	[101496] = { enemy = fbi_offices },
	[101497] = { enemy = fbi_offices },
	[101498] = { enemy = fbi_offices },
	[101499] = { enemy = fbi_offices },
	[101500] = { enemy = fbi_offices },
	[101501] = { enemy = fbi_offices },
	[101502] = { enemy = fbi_offices },
	[101503] = { enemy = fbi_offices },
	[101504] = { enemy = fbi_offices },
	[101505] = { enemy = fbi_offices },
	[101506] = { enemy = fbi_offices },
	[101214] = { enemy = fbi_offices },  -- entrance
	[101215] = { enemy = fbi_offices },
	-- [101198] = { enemy = fbi_offices },  -- operations
	[101199] = { enemy = fbi_offices },
	[101200] = { enemy = fbi_offices },
	[101201] = { enemy = fbi_offices },
	[101202] = { enemy = fbi_offices },
	[101203] = { enemy = fbi_offices },
	[101204] = { enemy = fbi_offices },
	[101205] = { enemy = fbi_offices },
	[101206] = { enemy = fbi_offices },
	-- [101207] = { enemy = fbi_offices },
	[101208] = { enemy = fbi_offices },

	-- harassers
	[100803] = { enemy = fbi_offices_harassers },  -- normal
	[100332] = { enemy = fbi_offices_harassers },
	[100906] = { enemy = fbi_offices_harassers },
	[100922] = { enemy = fbi_offices_harassers },
	[100938] = { enemy = fbi_offices_harassers },
	[100954] = { enemy = fbi_offices_harassers },
	[100969] = { enemy = fbi_offices_harassers },
	[100985] = { enemy = fbi_offices_harassers },
	[101001] = { enemy = fbi_offices_harassers },
	[101017] = { enemy = fbi_offices_harassers },
	[101033] = { enemy = fbi_offices_harassers },
	[101049] = { enemy = fbi_offices_harassers },
	[101065] = { enemy = fbi_offices_harassers },
	[101081] = { enemy = fbi_offices_harassers },
	[101097] = { enemy = fbi_offices_harassers },
	[101113] = { enemy = fbi_offices_harassers },
	[101129] = { enemy = fbi_offices_harassers },
	[101145] = { enemy = fbi_offices_harassers },
	[101161] = { enemy = fbi_offices_harassers },
	[101177] = { enemy = fbi_offices_harassers },
	[100884] = { enemy = ASS:random_unit("swats") },  -- hard/very hard
	[100334] = { enemy = ASS:random_unit("swats") },
	[100907] = { enemy = ASS:random_unit("swats") },
	[100923] = { enemy = ASS:random_unit("swats") },
	[100939] = { enemy = ASS:random_unit("swats") },
	[100955] = { enemy = ASS:random_unit("swats") },
	[100970] = { enemy = ASS:random_unit("swats") },
	[100986] = { enemy = ASS:random_unit("swats") },
	[101002] = { enemy = ASS:random_unit("swats") },
	[101018] = { enemy = ASS:random_unit("swats") },
	[101034] = { enemy = ASS:random_unit("swats") },
	[101050] = { enemy = ASS:random_unit("swats") },
	[101066] = { enemy = ASS:random_unit("swats") },
	[101082] = { enemy = ASS:random_unit("swats") },
	[101098] = { enemy = ASS:random_unit("swats") },
	[101114] = { enemy = ASS:random_unit("swats") },
	[101130] = { enemy = ASS:random_unit("swats") },
	[101146] = { enemy = ASS:random_unit("swats") },
	[101162] = { enemy = ASS:random_unit("swats") },
	[101178] = { enemy = ASS:random_unit("swats") },
	[100885] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },  -- overkill+
	[100336] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[100908] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[100924] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[100940] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[100956] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[100971] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[100987] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101003] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101019] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101035] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101051] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101067] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101083] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101099] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101115] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101131] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101147] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101163] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
	[101179] = { enemy = ASS:random_unit(is_easy_wish and "heavys" or "swats_heavys") },
}
