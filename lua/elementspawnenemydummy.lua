-- Don't replace spawns on custom enemy spawner map
if ASS.is_spawner then
	return
end

-- check elementspawncivilian for all the fancy code
if not ElementSpawnCivilian or not ElementSpawnCivilian.moon_init_hook then
	return ASS:log("error", "ElementSpawnEnemyDummy has no access to ElementSpawnCivilian!")
end

ASS:post_hook( ElementSpawnEnemyDummy, "init", ElementSpawnCivilian.moon_init_hook )
ASS:override( ElementSpawnEnemyDummy, "produce", ElementSpawnCivilian.produce )

ElementSpawnEnemyDummy.moon_produce_helper = ElementSpawnCivilian.moon_produce_helper
