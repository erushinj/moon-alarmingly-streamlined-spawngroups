if ASS.is_trai or not ASS.is_crimenet_offline then
	return
end

ASS:log("Ensuring Lost In Transit level package is loaded...")

Hooks:PostHook( GameSetup, "load_packages", "ass_load_packages", function(self)
	if PackageManager:package_exists("packages/job_trai") and not PackageManager:loaded("packages/job_trai") then
		PackageManager:load("packages/job_trai")
	end
end )