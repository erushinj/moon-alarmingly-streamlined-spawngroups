if ASS:get_var("is_editor_or_client") then
	return
end

if not ElementSpawnEnemyGroup.group_mapping then
	ASS:_sh_outdated()

	return
end

local try_insert = ASS:require("try_insert", true)

for group_name, new_groups in pairs(ASS:require("spawn_group_mapping")) do
	local mapping = ElementSpawnEnemyGroup.group_mapping[group_name] or {}
	ElementSpawnEnemyGroup.group_mapping[group_name] = mapping

	try_insert(mapping, group_name)

	for i = 1, #new_groups do
		local new_group_name = new_groups[i]

		try_insert(mapping, new_group_name)
	end
end

-- allow regular cloaker groups to spawn from manholes/vents/etc, since the cloaker task has been turned off
if ElementSpawnEnemyGroup.group_mapping.FBI_spoocs then
	ElementSpawnEnemyGroup.group_mapping.single_spooc = clone(ElementSpawnEnemyGroup.group_mapping.FBI_spoocs)
end
