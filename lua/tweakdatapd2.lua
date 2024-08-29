if ASS.is_client then
	return
end

ASS:require("class/moontweakdata")

Hooks:PreHook( TweakData, "_init_pd2", "ass__init_pd2", function(self)
	self.moon = MoonTweakData:new(self)
end )
