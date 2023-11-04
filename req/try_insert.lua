local v, e = ...

if v and e and not table.contains(v, e) then
	table.insert(v, e)

	return true
end

return false
