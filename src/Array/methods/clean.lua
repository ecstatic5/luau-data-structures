--[[
	Removes all the elements from the array and returns it

	@returns self
]]

return function(self)
	table.clear(self.current)
	return self
end
