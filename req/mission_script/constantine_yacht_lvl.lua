-- showdown, https://modworkshop.net/mod/43578
local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local cartel_suits = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_suit_1/ene_cartel_suit_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_suit_2/ene_cartel_suit_2"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_suit_3/ene_cartel_suit_3"),
}
local cartel_bathrobes = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_1/ene_cartel_bathrobe_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_2/ene_cartel_bathrobe_2"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_3/ene_cartel_bathrobe_3"),
}
local interior_cartel = overkill and tweak_data.levels:moon_units().heavy_2 or tweak_data.levels:moon_random_unit(normal and "swats_close" or "swats_heavys_close")

return {
	[100121] = {
		reinforce = {
			{ name = 147401, },  -- sh-placed, reenforce is not really useful on this level
		},
	},
	[100117] = {  -- unit type is set to federales after spawning cartel units normally, not good
		on_executed_reorder = { 100285, },
	},
	[100113] = { enemy = cartel_suits, },  -- startup suits
	[100116] = { enemy = cartel_suits, },
	[100126] = { enemy = cartel_suits, },
	[100127] = { enemy = cartel_suits, },
	[100128] = { enemy = cartel_suits, },
	[100129] = { enemy = cartel_suits, },
	[100130] = { enemy = cartel_suits, },
	[100131] = { enemy = cartel_suits, },
	[100161] = { enemy = cartel_suits, },
	[100162] = { enemy = cartel_suits, },
	[100163] = { enemy = cartel_suits, },
	[100164] = { enemy = cartel_suits, },
	[100165] = { enemy = cartel_suits, },
	[100166] = { enemy = cartel_suits, },
	[100167] = { enemy = cartel_suits, },
	[100267] = { enemy = cartel_suits, },
	[100268] = { enemy = cartel_suits, },
	[100311] = { enemy = cartel_suits, },  -- hull suits
	[100312] = { enemy = cartel_suits, },
	[100313] = { enemy = cartel_suits, },
	[100314] = { enemy = cartel_suits, },
	[100315] = { enemy = cartel_suits, },
	[100316] = { enemy = cartel_suits, },
	[100317] = { enemy = cartel_suits, },
	[100318] = { enemy = cartel_suits, },
	[100088] = { enemy = cartel_bathrobes, },  -- deck bathrobes
	[100091] = { enemy = cartel_bathrobes, },
	[100092] = { enemy = cartel_bathrobes, },
	[100093] = { enemy = cartel_bathrobes, },
	[100094] = { enemy = cartel_bathrobes, },
	[100095] = { enemy = cartel_bathrobes, },
	[100096] = { enemy = cartel_bathrobes, },
	[100097] = { enemy = cartel_bathrobes, },
	[100098] = { enemy = cartel_bathrobes, },
	[100099] = { enemy = cartel_bathrobes, },
	[100100] = { enemy = cartel_bathrobes, },
	[100101] = { enemy = cartel_bathrobes, },
	[100102] = { enemy = cartel_bathrobes, },
	[100103] = { enemy = cartel_bathrobes, },
	[100104] = { enemy = cartel_bathrobes, },
	[100105] = { enemy = cartel_bathrobes, },
	[100106] = { enemy = cartel_bathrobes, },
	[100107] = { enemy = cartel_bathrobes, },
	[100108] = { enemy = cartel_bathrobes, },
	[100109] = { enemy = cartel_bathrobes, },
	[100346] = { enemy = cartel_bathrobes, },  -- interior bathrobes
	[100347] = { enemy = cartel_bathrobes, },
	[100348] = { enemy = cartel_bathrobes, },
	[100349] = { enemy = cartel_bathrobes, },
	[100319] = { enemy = cartel_bathrobes, },
	[100320] = { enemy = cartel_bathrobes, },
	[100321] = { enemy = cartel_bathrobes, },
	[100322] = { enemy = cartel_bathrobes, },
	[100323] = { enemy = cartel_bathrobes, },
	[100324] = { enemy = cartel_bathrobes, },
	[100325] = { enemy = cartel_bathrobes, },
	[100326] = { enemy = cartel_bathrobes, },
	[100327] = { enemy = cartel_bathrobes, },
	[100328] = { enemy = cartel_bathrobes, },
	[100329] = { enemy = cartel_bathrobes, },
	[100330] = { enemy = interior_cartel, },  -- interior cartel
	[100331] = { enemy = interior_cartel, },
	[100332] = { enemy = interior_cartel, },
	[100333] = { enemy = interior_cartel, },
	[100334] = { enemy = interior_cartel, },
	[100335] = { enemy = interior_cartel, },
	[100336] = { enemy = interior_cartel, },
	[100337] = { enemy = interior_cartel, },
	[100338] = { enemy = interior_cartel, },
	[100339] = { enemy = interior_cartel, },
	[100340] = { enemy = interior_cartel, },
	[100341] = { enemy = interior_cartel, },
	[100342] = overkill and { enemy = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"), } or nil,  -- shield
	[100343] = overkill and { enemy = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"), } or nil,  -- shield
	[100344] = { enemy = interior_cartel, },
	[100345] = { enemy = interior_cartel, },
	[100439] = { enemy = interior_cartel, },
	[100440] = { enemy = interior_cartel, },
	[100441] = { enemy = interior_cartel, },
	[100442] = { enemy = interior_cartel, },
	[100443] = { enemy = interior_cartel, },
	[100444] = { enemy = interior_cartel, },
	[100445] = { enemy = interior_cartel, },
	[100446] = { enemy = interior_cartel, },
}
