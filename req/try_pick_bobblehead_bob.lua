local override, civs_table, bob = ...
local global = ASS:global()
global.picked_bob = override or global.picked_bob
bob = bob or Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1")

return function()
	if global.picked_bob or math.random() > 0.2 then
		return civs_table
	end

	global.picked_bob = true

	return bob
end
