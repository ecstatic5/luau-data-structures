--[[
	Checks if ALL the elements of the Array fulfill a condition

	@fn		 function(el: T): boolean	Callback to evaluate
	@returns boolean
]]

return function(self, fn: (el: number) -> boolean): boolean
	self:forEach(function(element)
		local condition = fn(element)
		assert(type(condition) == "boolean", "'fn' paremeter return value should be a boolean")

		if not condition then
			return false
		end
	end)
	return true
end
