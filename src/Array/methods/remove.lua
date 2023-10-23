--[[
	Deletes the element in the index passed to it

	@returns Array	The array where the method was called
]]

return function(self, toRemove: number | string)
	if type(toRemove) == "number" then
		table.remove(self.current, toRemove)
		return self
	end

	self:forEach(function(_, index, array)
		if index == toRemove then
			table.remove(array, index)
			return true
		end
	end)

	return self
end
