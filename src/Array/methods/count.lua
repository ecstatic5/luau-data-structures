--[[
	Returns the number of times an element is repeated in the array

	@value		any		Element to count
	@returns	number	times the element was found
]]

return function(self, value: any)
	assert(value ~= nil, "'value' can't be nil")

	local count = 0

	self:forEach(function(el)
		if el == value then
			count += 1
		end
	end)

	return count
end
