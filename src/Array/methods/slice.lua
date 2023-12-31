--[[
	"Cuts" the elements of the array obtaining only the elements between the range of "start" and "_end"

	@start	 number		Start index
	@_end?	 number		End index
	@returns Array		Sliced array
]]

return function(self, start: number, _end: number?)
	_end = _end or self:length()

	assert(type(start) == "number", "'start' parameter must be a number")
	assert(type(_end) == "number", "'end' parameter must be a number")
	assert(_end > start, "'start' parameter can't be greater than '_end'")

	local sliced = self.new()

	for i = start, _end do
		sliced:push(self:at(i))
	end

	return sliced
end
