-- boworks day 1, https://modworkshop.net/mod/31560
local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

local bofa_zeal_spawns = {
	enemy = {
		Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"),
		Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"),
		Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"),
		Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"),
		Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"),
		Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_shield/ene_bofa_zeal_shield"),
	},
}
local security_spawns = {
	enemy = {
		Idstring("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security/ene_stockos_security"),
		Idstring("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security_head/ene_stockos_security_head"),
	},
}

return {
	[100844] = {  -- random trenchenemy
		values = {
			amount = overkill and 12 or 8,
		},
	},
	[100818] = bofa_zeal_spawns,  -- scripted swats, trench
	[100816] = bofa_zeal_spawns,
	[100819] = bofa_zeal_spawns,
	[100820] = bofa_zeal_spawns,
	[100821] = bofa_zeal_spawns,
	[100822] = bofa_zeal_spawns,
	[100823] = bofa_zeal_spawns,
	[100824] = bofa_zeal_spawns,
	[100825] = bofa_zeal_spawns,
	[100826] = bofa_zeal_spawns,
	[100827] = bofa_zeal_spawns,
	[100828] = bofa_zeal_spawns,
	[100829] = bofa_zeal_spawns,
	[100830] = bofa_zeal_spawns,
	[100831] = bofa_zeal_spawns,
	[100832] = bofa_zeal_spawns,
	[100833] = bofa_zeal_spawns,
	[100834] = bofa_zeal_spawns,
	[100835] = bofa_zeal_spawns,
	[100836] = bofa_zeal_spawns,
	[100837] = bofa_zeal_spawns,
	[100838] = bofa_zeal_spawns,
	[100839] = bofa_zeal_spawns,
	[100840] = bofa_zeal_spawns,
	[100841] = bofa_zeal_spawns,
	[100842] = bofa_zeal_spawns,
	[100843] = bofa_zeal_spawns,
	[100549] = bofa_zeal_spawns,  -- "aux squad"
	[100552] = bofa_zeal_spawns,
	[100554] = bofa_zeal_spawns,
	[100550] = bofa_zeal_spawns,
	[100553] = bofa_zeal_spawns,
	[100551] = bofa_zeal_spawns,
	[100051] = security_spawns,  -- scripted guards, ambush (when cocke triggers alarm)
	[100052] = security_spawns,
	[100053] = security_spawns,
	[100054] = security_spawns,
	[100055] = security_spawns,
	[100056] = security_spawns,
	[100531] = security_spawns,  -- "aux squad"
	[100530] = security_spawns,
	[100532] = security_spawns,
	[100534] = security_spawns,
	[100535] = security_spawns,
	[100533] = security_spawns,
	[100590] = security_spawns,  -- exit
	[100589] = security_spawns,
	[100591] = security_spawns,
	[100629] = security_spawns,
	[100630] = security_spawns,
	[100631] = security_spawns,
	[100632] = security_spawns,
	[100633] = security_spawns,
	[100634] = security_spawns,
	[100635] = security_spawns,
	[100636] = security_spawns,
	[100637] = security_spawns,
}
