-- hunter and hunted day 2, https://modworkshop.net/mod/43578
return {
	[100175] = {  -- spawn start enemies, remove an instance placed in..the airport
		pre_func = function(self)  -- hunter_spawn_enemies_008
			if not self._moon_tweaked then
				self._moon_tweaked = true

				local event_list = self._values.event_list
				if not event_list then
					ASS:log("error", "Element 100175 is missing event list data!")
				else
					for i = #event_list, 1, -1 do
						local data = event_list[i]

						if data and data.instance == "hunter_spawn_enemies_008" then
							table.remove(event_list, i)
						end
					end
				end
			end
		end,
	},
	[100174] = {  -- spawn airport enemies, these instanced spawns are fucking stupid
		values = {
			enabled = false,
		},
	},
	[100014] = {  -- players spawned
		on_executed_reorder = { 100371, },
		reinforce = {
			{
				name = "gate",
				force = 3,
				position = Vector3(-100, -7500, 0),
			},
			{
				name = "central",  -- these and further ones only become populated when the gate opens
				force = 3,
				position = Vector3(0, -12100, 0),
			},
			{
				name = "hangar1",  -- these ones are between/in corners near hangars, same kind of spot the dumb instanced spawns were
				force = 2,
				position = Vector3(4600, -8900, 0),
			},
			{
				name = "hangar2",
				force = 2,
				position = Vector3(3900, -12500, 0),
			},
			{
				name = "hangar3",
				force = 2,
				position = Vector3(3650, -16600, 0),
			},
			{
				name = "hangar4",
				force = 2,
				position = Vector3(-3200, -16400, 0),
			},
			{
				name = "hangar5",
				force = 2,
				position = Vector3(-3300, -12500, 0),
			},
			{
				name = "hangar6",
				force = 2,
				position = Vector3(-3300, -8950, 0),
			},
			{
				name = "shed1",  -- near outer sheds
				force = 2,
				position = Vector3(1300, -15500, 0),
			},
			{
				name = "shed2",
				force = 2,
				position = Vector3(-1700, -15000, 0),
			},
		},
	},
	[100047] = {  -- open gate - on beginning hack's completion
		on_executed = {
			{ id = 100391, delay = 0, },
		},
	},
	[100085] = {  -- find equipment - on opening the door of the plane hangar
		on_executed = {
			{ id = 100370, delay = 0, },
		},
	},
	[100086] = {  -- wait for repairs - on securing the equipment
		hunt = true,
	},
	[100088] = {  -- open hanger doors - on finding the hangar with the plane
		on_executed = {
			{ id = 100369, remove = true, },  -- normally 0s, why reduce diff to 0.5 only to go back up to 1 in 40s anyway ?
		},
	},
	[100369] = {  -- difficulty 0.5 element
		on_executed = {
			{ id = 100391, remove = true, },  -- diff 0.75, normally 20s
		},
	},
	[100391] = {  -- difficulty 0.75 element
		on_executed = {
			{ id = 100370, remove = true, },  -- diff 1, normally 20s
		},
	},
}
