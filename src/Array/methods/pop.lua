--[[
    Removes the last element of the array

    @returns New array length
]]

return function(self)
	table.remove(self.current, self:length())
	return self:length()
end
