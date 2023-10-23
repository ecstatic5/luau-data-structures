local Types = require(script.Parent.Parent.private.Types)

--[[
	Merges an array's content to the current array

	@array 		Array	The array to insert
	@returns	void
]]

return function<T>(self, array: Types.Array<T>)
	assert(array.current ~= nil, "'array' must be an array")
	for _, v in array.current do
		self:push(v)
	end
end
