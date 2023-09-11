-- Don't replace spawns in editor mode
if Global.editor_mode then
	return
end

-- Update preferred spawn groups to contain new groups
local group_mapping = {
	tac_swat_rifle = {
		"marshal_squad",
		"original_swats_a",
		"original_swats_b",
		"original_heavys_a",
		"original_heavys_b",
		"original_recon_a",
		"original_recon_b",
		"original_recon_c",
		"original_recon_d",
		"original_reenforce_a",
		"original_reenforce_b",
		"original_reenforce_c",
		"tac_swat_rifle",
		"tac_swat_rifle_no_medic",
		"tac_swat_rifle_flank",
		"tac_swat_rifle_flank_no_medic",
		"tac_swat_shotgun_rush",
		"tac_swat_shotgun_rush_no_medic",
		"tac_swat_shotgun_flank",
		"tac_swat_shotgun_flank_no_medic",
		"hostage_rescue",
		"reenforce_init",
		"reenforce_light",
		"reenforce_heavy",
	},
	tac_shield_wall = {
		"original_shields_a",
		"original_shields_b",
		"tac_shield_wall_ranged",
		"tac_shield_wall_charge",
	},
	tac_tazer_flanking = {
		"original_tazers_a",
		"original_tazers_b",
		"tac_tazer_flanking",
		"tac_tazer_charge",
	},
	tac_bull_rush = {
		"original_tanks_a",
		"original_tanks_b",
		"tac_bull_rush",
	},
	FBI_spoocs = {
		"original_spoocs_a",
		"original_spoocs_b",
		"FBI_spoocs",
	},
}
group_mapping.tac_swat_rifle_flank = group_mapping.tac_swat_rifle
group_mapping.tac_shield_wall_ranged = group_mapping.tac_shield_wall
group_mapping.tac_shield_wall_charge = group_mapping.tac_shield_wall
group_mapping.tac_tazer_charge = group_mapping.tac_tazer_flanking

ASS:post_hook( ElementSpawnEnemyGroup, "_finalize_values", function(self)
	if self._values.preferred_spawn_groups then
		local new_groups = {}

		for _, initial_group in pairs(self._values.preferred_spawn_groups) do
			local mapping = group_mapping[initial_group]

			if mapping then
				for _, added_group in pairs(mapping) do
					new_groups[added_group] = true
				end
			else
				new_groups[initial_group] = true
			end
		end

		self._values.preferred_spawn_groups = table.map_keys(new_groups)
	end
end )
