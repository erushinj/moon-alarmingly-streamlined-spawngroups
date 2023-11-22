-- moved to levelstweakdata / tweak_data.levels
function ASS:units()
	if not self._units then
		self._units = {}
	end

	return self._units
end

function ASS:random_unit()
	if not self._random_unit then
		self._random_unit = {
			cops = { Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"), },
		}
	end

	return self._random_unit.cops
end

function ASS:enemy_replacements()
	if not self._enemy_replacements then
		self._enemy_replacements = {}
	end

	return self._enemy_replacements
end

function ASS:enemy_mapping()
	if not self._enemy_mapping then
		self._enemy_mapping = {}
	end

	return self._enemy_mapping
end

function ASS:level_enemy_replacements()
	if not self._level_enemy_replacements then
		self._level_enemy_replacements = {}
	end

	return self._level_enemy_replacements
end

-- moved to skirmishtweakdata / tweak_data.skirmish
function ASS:wave_unit_categories()
	if not self._wave_unit_categories then
		self._wave_unit_categories = { {}, }
	end

	return self._wave_unit_categories
end
