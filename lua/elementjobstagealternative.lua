if ASS.is_editor_or_client then
	return
end

-- disable escapes based on settings, but still allow alternate days
if not ASS.settings.escapes then
	ASS:log("info", "Disabling escapes in \"ElementJobStageAlternative:on_executed\"...")

	local on_executed_original = ElementJobStageAlternative.on_executed
	function ElementJobStageAlternative:on_executed(...)
		return (not self._values.interupt or self._values.interupt == "none") and on_executed_original(self, ...)
	end
end
