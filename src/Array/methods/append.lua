--[[
    Adds any number of elements to the end of the array

    @returns number New array length
]]

return function(self, ...)
	for _, element in { ... } do
		self:push(element)
	end

	return self:length()
end
