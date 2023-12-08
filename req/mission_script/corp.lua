local special_chance = ASS:get_var("real_difficulty_index") * 0.05
local dozer_chance = special_chance * 0.1
local function scripted_swat_squads()
	local rand = math.random()

	return tweak_data.levels:moon_random_unit(rand < dozer_chance and "dozers_no_cs" or rand < special_chance and "specials_any" or "swats")
end

return {
	[101324] = {
		values = {
			enabled = false
		}
	},
	[101325] = {
		values = {
			enabled = false
		}
	},
	-- some new reenforce spots
	[100115] = {
		reinforce = {
			{
				name = "showtime",
				force = 2,
				position = Vector3(-1550, 5950, 150)
			},
			{
				name = "bam_boom_poo",
				force = 2,
				position = Vector3(1950, 4200, 150)
			},
			{
				name = "research1",
				force = 2,
				position = Vector3(-700, 3300, 150)
			},
			{
				name = "research2",
				force = 2,
				position = Vector3(4100, 1450, 150)
			},
			{
				name = "main_staircase1",
				force = 2,
				position = Vector3(1450, 2650, 0)
			},
			{
				name = "main_staircase2",
				force = 2,
				position = Vector3(1800, 3300, 0)
			},
			{
				name = "main_staircase3",
				force = 3,
				position = Vector3(1850, 2850, 500)
			},
			{
				name = "main_staircase4",
				force = 3,
				position = Vector3(1900, 2900, 900)
			},
			{
				name = "fire_escape",
				force = 2,
				position = Vector3(6900, 2350, 0)
			},
		},
	},
	-- security guards
	[100670] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100671] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100672] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100673] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100674] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100675] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100676] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100677] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100678] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100679] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101490] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101491] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101493] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101498] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101503] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101519] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101520] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101522] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101527] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101532] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101548] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101549] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101551] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101556] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101561] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101577] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101578] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101580] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101585] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101590] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101644] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101645] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101646] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101648] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101649] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101677] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101678] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101679] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101681] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101682] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101710] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101711] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101712] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101714] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101715] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },

	-- swat van spawns
	[103058] = { enemy = scripted_swat_squads(), },
	[103491] = { enemy = scripted_swat_squads(), },
	[103550] = { enemy = scripted_swat_squads(), },
	[103551] = { enemy = scripted_swat_squads(), },
	[103552] = { enemy = scripted_swat_squads(), },
	[103553] = { enemy = scripted_swat_squads(), },
	[103557] = { enemy = scripted_swat_squads(), },
	[103558] = { enemy = scripted_swat_squads(), },
	[103559] = { enemy = scripted_swat_squads(), },
	[103560] = { enemy = scripted_swat_squads(), },
	[103561] = { enemy = scripted_swat_squads(), },
	[103562] = { enemy = scripted_swat_squads(), },
	[103576] = { enemy = scripted_swat_squads(), },
	[103575] = { enemy = scripted_swat_squads(), },
	[103574] = { enemy = scripted_swat_squads(), },
	[103573] = { enemy = scripted_swat_squads(), },
	[103580] = { enemy = scripted_swat_squads(), },
	[103579] = { enemy = scripted_swat_squads(), },
	[103577] = { enemy = scripted_swat_squads(), },
	[103572] = { enemy = scripted_swat_squads(), },
	[103571] = { enemy = scripted_swat_squads(), },
	[103570] = { enemy = scripted_swat_squads(), },
	[102763] = { enemy = scripted_swat_squads(), },
	[103589] = { enemy = scripted_swat_squads(), },
	[103590] = { enemy = scripted_swat_squads(), },
	[103591] = { enemy = scripted_swat_squads(), },
	[103592] = { enemy = scripted_swat_squads(), },
	[103593] = { enemy = scripted_swat_squads(), },
	[103594] = { enemy = scripted_swat_squads(), },
	[103595] = { enemy = scripted_swat_squads(), },
	[103596] = { enemy = scripted_swat_squads(), },
	[103597] = { enemy = scripted_swat_squads(), },
	[103598] = { enemy = scripted_swat_squads(), },
	[103599] = { enemy = scripted_swat_squads(), },
	[103600] = { enemy = scripted_swat_squads(), },

	-- elevator dozers
	[102384] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },
	[103016] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },
	[103017] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },
	[102385] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },
	[103025] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },
	[103026] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },
}
