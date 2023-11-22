ASS:post_hook( PlayerTweakData, "_set_" .. ASS:get_var("difficulty"), function(self)
	local dmg_interval = ASS:get_var("dmg_interval")

	if dmg_interval > self.damage.MIN_DAMAGE_INTERVAL then
		ASS:log("warn", "Default grace period is already shorter than the grace period setting!")

		return
	end

	ASS:log("info", "Setting grace period to \"%s\"...", tostring(dmg_interval))

	self.damage.MIN_DAMAGE_INTERVAL = dmg_interval
end )
