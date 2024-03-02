return {
	[100042] = {  -- unit type is set to federales after spawning a gazillion cartel units normally, not good
		pre_func = function(self)
			if self._values.on_executed_original then
				return
			end

			self._values.on_executed_original = self._values.on_executed
			self._values.on_executed = {}

			for k, v in pairs(self._values.on_executed_original) do
				if v.id == 100131 then
					table.insert(self._values.on_executed, v)
				end
			end

			for k, v in pairs(self._values.on_executed_original) do
				if v.id ~= 100131 then
					table.insert(self._values.on_executed, v)
				end
			end
		end,
	},
}
