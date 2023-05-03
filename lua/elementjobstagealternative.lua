local on_executed_original = ElementJobStageAlternative.on_executed
function ElementJobStageAlternative:on_executed(instigator, ...)
	if ASS.settings.escapes or not self._values.interupt or self._values.interupt == "none" then
		on_executed_original(self, instigator, ...)
	end
end
