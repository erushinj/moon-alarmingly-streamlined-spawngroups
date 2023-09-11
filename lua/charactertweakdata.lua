local level_id = ASS:get_var("level_id")

ASS:post_hook( CharacterTweakData, "init", function(self, tweak_data)
	if level_id == "fex" then
		self.security_mex_no_pager.has_alarm_pager = true
	end
end )
