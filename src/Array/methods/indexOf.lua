--[[
    Finds the index of the given element

    @returns number index of the element
]]

return function(self, element)
	assert(element, "'element' can't be nil")

	local index = 0

	self:forEach(function(el, i)
		if element == el then
			index = i
			return true
		end
	end)

	return index
end
