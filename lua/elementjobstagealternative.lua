-- disable escapes based on settings, but still allow alternate days
if not ASS:get_setting("escapes") then
	ASS:log("info", "Disabling escapes in method \"ElementJobStageAlternative:on_executed\"...")

	ElementJobStageAlternative.on_executed_original = ElementJobStageAlternative.on_executed
	function ElementJobStageAlternative:on_executed(instigator, ...)
		if not self._values.interupt or self._values.interupt == "none" then
			return self:on_executed_original(instigator, ...)
		end
	end
end
