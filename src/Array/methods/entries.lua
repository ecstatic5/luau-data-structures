--[[
	Returns all the elements of the array along with its index within a table. Example: {1, "first element"}

	@returns Array

]]

return function(self)
	local array = self.new()

	self:forEach(function(el, index)
		array:push({ index, el })
	end)

	return array
end
