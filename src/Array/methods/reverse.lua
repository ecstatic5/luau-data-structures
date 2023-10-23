--[[
	Flips the array elements

	@returns Reversed array
]]

return function(self)
	local reversed = self.new()
	for i = self:length(), 1, -1 do
		reversed:push(self.current[i])
	end
	return reversed
end
