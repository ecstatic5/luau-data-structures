--[[
	Gets a random element from the Array

	@returns	any		Random element
]]

return function(self)
	local length = self:length()

	assert(length > 0, "Cannot get a random element from an empty array")

	return self:at(math.random(1, length))
end
