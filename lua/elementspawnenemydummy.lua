-- check elementspawncivilian for all the fancy code
if not ElementSpawnCivilian or not ElementSpawnCivilian.moon_init_hook then
	return
end

ASS:post_hook( ElementSpawnEnemyDummy, "init", ElementSpawnCivilian.moon_init_hook )

ElementSpawnEnemyDummy.produce_original = ElementSpawnEnemyDummy.produce
ElementSpawnEnemyDummy.produce = ElementSpawnCivilian.produce
ElementSpawnEnemyDummy.moon_produce_helper = ElementSpawnCivilian.moon_produce_helper
