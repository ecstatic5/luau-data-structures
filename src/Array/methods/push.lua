--[[
	Pushes an element to the last element of the array

    @element    any     Element to be pushed
	@returns    number  New array length
]]

return function(self, element)
	table.insert(self.current, element)
	return self:length()
end
