if ASS:get_var("is_editor_or_client") then
	return
end

-- disable escapes based on settings, but still allow alternate days
if not ASS:get_setting("escapes") then
	ASS:log("info", "Disabling escapes in \"ElementJobStageAlternative:on_executed\"...")
	ASS:override( ElementJobStageAlternative, "on_executed", function(self, ...)
		return (not self._values.interupt or self._values.interupt == "none") and self:on_executed_original(...)
	end )
end
