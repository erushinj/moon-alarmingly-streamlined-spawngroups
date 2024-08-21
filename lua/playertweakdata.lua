local dmg_interval = ASS.dmg_interval
local difficulty = ASS.difficulty
local diff_func_name = "_set_" .. difficulty

Hooks:PostHook( PlayerTweakData, diff_func_name, "ass_" .. diff_func_name, function(self)
	if dmg_interval > self.damage.MIN_DAMAGE_INTERVAL then
		ASS:log("warn", "Default grace period is already shorter than the grace period setting!")
	else
		ASS:log("info", "Setting grace period to \"%s\"...", tostring(dmg_interval))

		self.damage.MIN_DAMAGE_INTERVAL = dmg_interval
	end
end )
