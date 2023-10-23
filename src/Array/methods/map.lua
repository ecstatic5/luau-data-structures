--[[
	Creates a new instance of Array with the modified elements using the expression inside the callback

	@fn		 function(el: T, index: number): T		Callback to be evaluated
	@returns Array									Mapped Array
]]

return function(self, fn: (el: any, index: number) -> any)
	assert(typeof(fn) == "function", "'fn' must be a function")

	local mappedArray = self.new()

	self:forEach(function(el)
		local element = fn(el, mappedArray:length() + 1)
		if element then
			mappedArray:push(element)
		end
	end)

	return mappedArray
end
