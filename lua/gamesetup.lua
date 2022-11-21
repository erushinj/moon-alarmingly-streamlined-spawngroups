if not ASS.is_offline then
	return
end

--	load marshal shield in offline mode, as well as zombie swat package on event heists
Hooks:PostHook(GameSetup, "load_packages", "ass_load_packages", function(self)
	if PackageManager:package_exists("packages/job_trai") and not PackageManager:loaded("packages/job_trai") then
		PackageManager:load("packages/job_trai")
	end

	if ASS.check_job(ASS.hvh_jobs) then
		if PackageManager:package_exists("packages/narr_hvh") and not PackageManager:loaded("packages/narr_hvh") then
			PackageManager:load("packages/narr_hvh")
		end
	end
end)