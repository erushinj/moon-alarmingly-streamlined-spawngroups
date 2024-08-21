if not ASS:global().zeals_enabled then
	return
end

Hooks:PostHook( GameSetup, "load_packages", "ass_load_packages", function(self)
	if not PackageManager:loaded("packages/sm_wish") then
		ASS:log("info", "Loading gitgud package...")

		table.insert(self._loaded_diff_packages, "packages/sm_wish")

		PackageManager:load("packages/sm_wish")
	end
end )
