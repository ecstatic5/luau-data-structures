--[[
	Fills "X" number of positions with "Y" element in the Array

	@amount		Number	Amount of positions to fill
	@value		T		Value to be filled in the Array
	@returns 	Array 	The original array with the filled fields
]]

return function(self, amount: number, value: any)
	assert(amount <= self.array_config.maxFillMethodAmount, "'amount' paremeter is higher than maximun value")

	for i = 0, amount do
		self.current[i] = value
	end

	return self
end
