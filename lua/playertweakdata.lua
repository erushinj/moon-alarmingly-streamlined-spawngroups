local dmg_interval = ASS.dmg_interval
local difficulty = ASS.difficulty

ASS:post_hook( PlayerTweakData, "_set_" .. difficulty, function(self)
	if dmg_interval > self.damage.MIN_DAMAGE_INTERVAL then
		ASS:log("warn", "Default grace period is already shorter than the grace period setting!")
	else
		ASS:log("info", "Setting grace period to \"%s\"...", tostring(dmg_interval))

		self.damage.MIN_DAMAGE_INTERVAL = dmg_interval
	end
end )
