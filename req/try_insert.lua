local v, e = ...

if e ~= nil and v and not table.contains(v, e) then
	table.insert(v, e)

	return true
end

return false
