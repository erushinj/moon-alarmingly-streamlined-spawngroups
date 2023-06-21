local units = ASS:base_units()
local get_random_units = ASS:get_random_units()
local swats = get_random_units.swats

local spawn_enemy_dummy = {}

for _, id in ipairs({
	103058,
	103491,
	103550,
	103551,
	103552,
	103553,
	103557,
	103558,
	103559,
	103560,
	103561,
	103562,
	103576,
	103575,
	103574,
	103573,
	103580,
	103579,
	103577,
	103572,
	103571,
	103570,
	102763,
	103589,
	103590,
	103591,
	103592,
	103593,
	103594,
	103595,
	103596,
	103597,
	103598,
	103599,
	103600
}) do
	spawn_enemy_dummy[id] = { enemy = ASS:random_unit(swats) }
end

return spawn_enemy_dummy
