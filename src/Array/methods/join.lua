--[[
	Concatenates all elements of the array into a string using the separator for each of the elements

	@returns A string joined with all Array elements
]]

return function(self, separator: string)
	assert(type(separator) == "string", "'separator' must be a string")
	assert(self:length() > 0, "It's not possible to join empty arrays")

	return table.concat(self.current, separator)
end
