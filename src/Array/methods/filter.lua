--[[
	Filters the array elements

	@returns    {number: T}    Filtered array
]]

return function(self, fn: (value: any) -> boolean)
	local filtered = self.new()

	for _, v in self.current do
		if not fn(v) then
			continue
		end
		filtered:push(v)
	end

	return filtered
end
