--[[
	Inserts any type of element into the start of the array

	@returns number New length of the array
]]

return function(self, ...)
	local t = { ... }

	for i = 1, #{ ... }, 1 do
		table.insert(self.current, i, t[i])
	end

	table.clear(t)
	return self:length()
end
