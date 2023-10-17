local dmg_interval = ASS:get_var("dmg_interval")

if dmg_interval == "default" then
	return
end

ASS:post_hook( PlayerTweakData, "_set_" .. ASS:get_var("difficulty"), function(self)
	self.damage.MIN_DAMAGE_INTERVAL = tonumber(dmg_interval)
end )
