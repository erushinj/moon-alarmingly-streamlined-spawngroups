if ASS:get_var("is_editor_or_client") then
	return
end

if not ElementSpawnEnemyGroup.group_mapping then
	ASS:_sh_outdated()

	return
end

local try_insert = ASS:require("try_insert", true)

for group_name, new_groups in pairs({
	tac_swat_rifle_flank = {
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
		"chicken_plate_hrt_a",
		"chicken_plate_hrt_b",
		"chicken_plate_swat_a",
		"chicken_plate_swat_b",
		"chicken_plate_heavy_a",
		"chicken_plate_heavy_b",
	},
	tac_shield_wall = {
		"original_shields_a",
		"original_shields_b",
		"chicken_plate_shield",
	},
	tac_tazer_flanking = {
		"original_tazers_a",
		"original_tazers_b",
		"chicken_plate_taser",
		"chicken_plate_medic",
	},
	tac_bull_rush = {
		"original_tanks_a",
		"original_tanks_b",
		"chicken_plate_tank",
	},
	FBI_spoocs = {
		"original_spoocs_a",
		"original_spoocs_b",
		"chicken_plate_spooc",
	},
}) do
	local mapping = ElementSpawnEnemyGroup.group_mapping[group_name] or {}
	ElementSpawnEnemyGroup.group_mapping[group_name] = mapping

	for i = 1, #new_groups do
		local new_group_name = new_groups[i]

		try_insert(mapping, new_group_name)
	end
end

-- allow regular cloaker groups to spawn from manholes/vents/etc, since the cloaker task has been turned off
ElementSpawnEnemyGroup.group_mapping.single_spooc = clone(ElementSpawnEnemyGroup.group_mapping.FBI_spoocs)
