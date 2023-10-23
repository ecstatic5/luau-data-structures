--[[
    Removes the first element of the array

    @returns Removed element value
]]

return function(self)
	local el = self.current[1]
	table.remove(self.current, 1)
	return el
end
