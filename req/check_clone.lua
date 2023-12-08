local v, shallow = ...

if type(v) == "table" then
	return shallow and clone(v) or deep_clone(v)
end

return v
