-- Don't replace spawns on custom enemy spawner map
local level_id = ASS:get_var("level_id")
if ASS:get_var("is_editor_or_client") or level_id == "modders_devmap" or level_id == "Enemy_Spawner" then
	return
end

-- check elementspawncivilian for all the fancy code
if not ElementSpawnCivilian or not ElementSpawnCivilian.moon_init_hook then
	ASS:log("error", "ElementSpawnEnemyDummy has no access to ElementSpawnCivilian!")

	return
end

ASS:post_hook( ElementSpawnEnemyDummy, "init", ElementSpawnCivilian.moon_init_hook )

ElementSpawnEnemyDummy.produce_original = ElementSpawnEnemyDummy.produce
ElementSpawnEnemyDummy.produce = ElementSpawnCivilian.produce
ElementSpawnEnemyDummy.moon_produce_helper = ElementSpawnCivilian.moon_produce_helper
