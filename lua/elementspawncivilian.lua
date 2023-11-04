-- Don't replace spawns on custom enemy spawner map
local level_id = ASS:get_var("level_id")
if Global.editor_mode or level_id == "modders_devmap" or level_id == "Enemy_Spawner" then
	return
end

ASS:post_hook( ElementSpawnCivilian, "init", function(self)
	ElementSpawnEnemyDummy.moon_init_hook(self)
end )

ElementSpawnCivilian.produce_original = ElementSpawnCivilian.produce
function ElementSpawnCivilian:produce(params, ...)
	return ElementSpawnEnemyDummy.produce(self, params, ...)
end

function ElementSpawnCivilian:moon_produce_helper(params, ...)
	return ElementSpawnEnemyDummy.moon_produce_helper(self, params, ...)
end
