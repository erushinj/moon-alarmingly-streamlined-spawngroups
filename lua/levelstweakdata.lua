--	restores original american response on beneath the mountain and henrys rock, and adds zombies to event heists in offline mode
Hooks:PostHook(LevelsTweakData, "init", "ass_init", function(self)
	local murky_to_america_jobs = {
		"pbr",
		"des"
	}
	for _, job in pairs(murky_to_america_jobs) do
		self[job].ai_group_type = LevelsTweakData.LevelType.America
	end

	if not ASS.is_offline then
		return
	end

	for _, job in pairs(ASS.hvh_jobs) do
		self[job].ai_group_type = LevelsTweakData.LevelType.Zombie
	end
end)