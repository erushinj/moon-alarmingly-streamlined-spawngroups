if StreamHeist then
	return
end

ASS:log("SH is not being used, running CharacterTweakData changes...")

local _presets_original = CharacterTweakData._presets
function CharacterTweakData:_presets(tweak_data, ...)
	local presets = _presets_original(self, tweak_data, ...)

	local surrender_factors = {
		unaware_of_aggressor = 0.2,
		enemy_weap_cold = 0.1,
		flanked = 0.4,
		isolated = 0.2,
		aggressor_dis = {
			[100.0] = 0.2,
			[1000.0] = 0
		}
	}
	presets.surrender.easy = {
		base_chance = 0,
		significant_chance = 0,
		factors = surrender_factors,
		reasons = {
			pants_down = 1,
			weapon_down = 0.6,
			health = {
				[1.0] = 0,
				[0.0] = 1
			}
		}
	}
	presets.surrender.normal = {
		base_chance = 0,
		significant_chance = 0,
		factors = surrender_factors,
		reasons = {
			pants_down = 0.9,
			weapon_down = 0.4,
			health = {
				[0.75] = 0,
				[0.0] = 0.75
			}
		}
	}
	presets.surrender.hard = {
		base_chance = 0,
		significant_chance = 0,
		factors = surrender_factors,
		reasons = {
			pants_down = 0.8,
			weapon_down = 0.2,
			health = {
				[0.5] = 0,
				[0.0] = 0.5
			}
		}
	}

	return presets
end


Hooks:PostHook( CharacterTweakData, "init", "ass_init", function(self)

	self.swat.surrender = self.presets.surrender.normal
	self.fbi_swat.surrender = self.presets.surrender.normal
	self.city_swat.surrender = self.presets.surrender.normal

	self.heavy_swat.surrender = self.presets.surrender.hard
	self.fbi_heavy_swat.surrender = self.presets.surrender.hard
	self.heavy_swat_sniper.surrender = self.presets.surrender.hard

	self.marshal_marksman.misses_first_player_shot = false

	self.medic.suppression = nil

end )