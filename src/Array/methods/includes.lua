--[[
	Checks if the element passed as argument is inside the array

	@value	 any			Value to find inside the array
	@returns true | false
]]

return function(self, value: any)
	for _, v in self.current do
		if v == value then
			return true
		end
	end
	return false
end
