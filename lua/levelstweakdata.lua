Hooks:PostHook( LevelsTweakData, "init", "ass_init", function(self)

	for _, job in pairs(ASS.murky_to_america_jobs) do
		self[job].ai_group_type = LevelsTweakData.LevelType.America
	end

	if not ASS.is_offline then
		return
	end

	for _, job in pairs(ASS.hvh_jobs) do
		self[job].ai_group_type = LevelsTweakData.LevelType.Zombie
	end

end )