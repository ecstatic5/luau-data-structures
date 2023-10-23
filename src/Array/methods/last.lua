--[[
	Returns the last element of the Array

	@returns	any		The last element of the Array
]]

return function(self)
	return self:at(self:length())
end
