local Utils = {}

-- table utils
function Utils.collect(tbl, mul)
	return table.collect(tbl, function(val)
		return val * mul
	end)
end

return Utils
