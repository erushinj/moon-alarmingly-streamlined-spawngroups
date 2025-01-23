if not ASS.global.zeals_enabled or ASS.appended_mm_keys then
	return
end

ASS.appended_mm_keys = true
ASS:log("info", "Appending to matchmaking keys...")

-- zeals are not loaded except on death sentence normally.
-- issues will occur online if you remove this matchmaking lock.
NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY .. "_ass_zeals_enabled"
NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY .. "_ass_zeals_enabled"
