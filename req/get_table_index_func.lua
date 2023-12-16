local indices = ...

return function()
	return table.remove(indices, math.random(#indices))
end
