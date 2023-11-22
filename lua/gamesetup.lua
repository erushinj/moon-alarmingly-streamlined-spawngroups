if not ASS:global("zeals_enabled") then
	return
end

ASS:post_hook( GameSetup, "load_packages", function(self)
	if not PackageManager:loaded("packages/sm_wish") then
		ASS:log("info", "Loading gitgud package...")

		table.insert(self._loaded_diff_packages, "packages/sm_wish")

		PackageManager:load("packages/sm_wish")
	end
end )
