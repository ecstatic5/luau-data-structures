--[[
    "flattens" the whole array to a certain level, which means that if there are arrays inside the array (or even a normal table), they will be removed and their elements will be added to the current array.

    @returns    Array   Flattened array
]]

return function(self, depth: number)
	depth = depth or self:length()
	assert(type(depth) == "number", "'depth' must be a number")

	for _ = 1, depth do
		self:forEach(function(el, elIndex)
			if type(el) == "table" then
				self:remove(elIndex):append(unpack(el))
			end
		end)
	end

	return self
end
