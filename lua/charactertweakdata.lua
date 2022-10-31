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

	presets.hurt_severities.base.melee.zones = {
		{
			health_limit = 0.2,
			light = 1
		},
		{
			health_limit = 0.5,
			light = 0.5,
			moderate = 0.5
		},
		{
			health_limit = 0.8,
			moderate = 0.5,
			heavy = 0.5
		},
		{
			heavy = 1
		}
	}
	presets.hurt_severities.base.explosion.zones = {
		{
			health_limit = 0.2,
			light = 0.5,
			moderate = 0.5
		},
		{
			health_limit = 0.5,
			moderate = 0.5,
			heavy = 0.5
		},
		{
			health_limit = 0.8,
			heavy = 0.5,
			explode = 0.5
		},
		{
			explode = 1
		}
	}
	presets.hurt_severities.only_light_hurt.explosion = presets.hurt_severities.base.explosion

	presets.hurt_severities.no_heavy_hurt = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.no_heavy_hurt.bullet.zones = {
		{
			health_limit = 0.4,
			none = 0.5,
			light = 0.5
		},
		{
			health_limit = 0.7,
			light = 0.7,
			moderate = 0.3
		},
		{
			light = 0.5,
			moderate = 0.5
		}
	}
	presets.hurt_severities.no_heavy_hurt.melee.zones = {
		{
			health_limit = 0.2,
			none = 0.2,
			light = 0.8
		},
		{
			health_limit = 0.5,
			light = 0.8,
			moderate = 0.2
		},
		{
			health_limit = 0.8,
			light = 0.2,
			moderate = 0.8
		},
		{
			moderate = 0.8,
			heavy = 0.2
		}
	}
	presets.hurt_severities.no_heavy_hurt.explosion.zones = {
		{
			health_limit = 0.2,
			light = 1,
		},
		{
			health_limit = 0.5,
			light = 0.5,
			moderate = 0.5
		},
		{
			health_limit = 0.8,
			moderate = 0.5,
			heavy = 0.5
		},
		{
			heavy = 0.5,
			explode = 0.5
		}
	}

	return presets
end


Hooks:PostHook( CharacterTweakData, "init", "ass_init", function(self)

	self.swat.surrender = self.presets.surrender.normal
	self.fbi_swat.surrender = self.presets.surrender.normal
	self.city_swat.surrender = self.presets.surrender.normal

	self.heavy_swat.surrender = self.presets.surrender.hard
	self.heavy_swat.damage.hurt_severity = self.presets.hurt_severities.no_heavy_hurt
	self.fbi_heavy_swat.surrender = self.presets.surrender.hard
	self.fbi_heavy_swat.damage.hurt_severity = self.presets.hurt_severities.no_heavy_hurt
	self.heavy_swat_sniper.surrender = self.presets.surrender.hard
	self.heavy_swat_sniper.damage.hurt_severity = self.presets.hurt_severities.no_heavy_hurt

	self.marshal_marksman.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt
	self.marshal_marksman.misses_first_player_shot = false

	self.taser.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt

	self.spooc.damage.hurt_severity = self.presets.hurt_severities.no_hurts
	self.shadow_spooc.damage.hurt_severity = self.presets.hurt_severities.no_hurts

	self.medic.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt
	self.medic.suppression = nil

end )


local function city_swat_hurts(char_tweak_data)
	char_tweak_data.city_swat.damage.hurt_severity = char_tweak_data.presets.hurt_severities.base
end
Hooks:PostHook( CharacterTweakData, "_set_easy_wish", "ass__set_easy_wish", city_swat_hurts )
Hooks:PostHook( CharacterTweakData, "_set_overkill_290", "ass__set_overkill_290", city_swat_hurts )
Hooks:PostHook( CharacterTweakData, "_set_sm_wish", "ass__set_sm_wish", city_swat_hurts )