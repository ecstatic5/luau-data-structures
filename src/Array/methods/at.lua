--[[
	Returns the element in certain position

	@pos		number	Element position
	@returns	any		Element in that position
]]

return function(self, pos: number)
	assert(type(pos) == "number", "'pos' must be a number")

	return self.current[pos]
end
