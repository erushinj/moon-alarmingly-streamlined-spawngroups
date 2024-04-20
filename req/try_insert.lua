local v, e = ...

if e ~= nil and type(v) == "table" and not table.contains(v, e) then
	table.insert(v, e)

	return true
end

return false
