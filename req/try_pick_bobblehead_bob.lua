local override, civs_table, bob = ...
ASS.picked_bob = override or ASS.picked_bob
bob = bob or Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1")

return function()
	if ASS.picked_bob or math.random() > 0.2 then
		return civs_table
	end

	ASS.picked_bob = true

	return bob
end
