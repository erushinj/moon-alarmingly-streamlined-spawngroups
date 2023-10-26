local escapes = ASS:get_setting("escapes")

-- disable escapes based on settings, but still allow alternate days
ElementJobStageAlternative.on_executed_original = ElementJobStageAlternative.on_executed
function ElementJobStageAlternative:on_executed(instigator, ...)
	if escapes or not self._values.interupt or self._values.interupt == "none" then
		return self:on_executed_original(instigator, ...)
	end
end
