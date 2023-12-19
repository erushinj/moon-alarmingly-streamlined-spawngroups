local override, civs_table, alternate_bob = ...
local picked_bob = override or false
local bob = alternate_bob or Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1")

return function()
	if picked_bob or math.random() > 0.15 then
		return civs_table
	end

	picked_bob = true

	return bob
end
