--[[
	Checks if SOME the elements of the Array fulfill a condition

	@fn		 function(el: T): boolean	Callback to evaluate
	@returns boolean
]]

return function(self, fn: (el: any) -> boolean): boolean
	local some = false

	self:forEach(function(el)
		local condition = fn(el)
		assert(type(condition) == "boolean", "'fn' paremeter return value should be a boolean")

		if condition then
			some = true
			return some
		end
	end)

	return some
end
