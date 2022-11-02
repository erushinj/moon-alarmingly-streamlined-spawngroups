Hooks:PostHook( LevelsTweakData, "init", "ass_init", function(self)

	for _, job in pairs(ASS.murky_to_america_jobs) do
		self[job].ai_group_type = self.framing_frame_1.ai_group_type
	end

	if not ASS.is_offline then
		return
	end

	for _, job in pairs(ASS.hvh_jobs) do
		self[job].ai_group_type = self.hvh.ai_group_type
	end

end )