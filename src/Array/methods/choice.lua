--[[
	Gets a random element from the Array

	@returns	any | Array		Random element(s)
]]

--[[
	TODO: Crear función .zip(...)
]]
return function(self, amount)
	local length = self:length()
	amount = amount or 0

	assert(type(amount) == "number", "'amount' must be a number")
	assert(length > 0, "Cannot get a random element from an empty array")

	if amount and amount > 0 then
		local choiced = self.new()

		for _ = 1, amount do
			choiced:push(self:choice())
		end

		return choiced
	end

	return self:at(math.random(1, length))
end
