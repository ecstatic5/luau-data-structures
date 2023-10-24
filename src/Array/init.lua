local methods = script:WaitForChild("methods")

local Types = require(script:WaitForChild("private"):WaitForChild("Types"))

local Array = {
	array_config = {
		maxFillMethodAmount = 50_000,
	},
}
Array.__index = Array

--[[
	Creates an instance of the Array class

	@returns Array	New array with the given elements
]]
function Array.new<T>(...: T): Types.Array<T>
	local self = setmetatable({ current = { ... } }, Array)
	return self
end

--[[
	Creates an instance of the Array class with ALL the elements
	of the iterable that is passed as argument

	@returns Array	New array with the given iterable
]]
function Array.from<T>(iterable: { T })
	assert(type(iterable) == "table", "'iterable' must be a valid iterable")

	return Array.new(unpack(iterable))
end

--[[
	Checks if the argument passed is an instance of Array

	@returns	true|false
]]
function Array.isArray(array)
	return if type(array) == "table" and array.current then true else false
end

--[[
	Checks if the array passed is empty

	@returns	true|false
]]
function Array.isEmpty(array)
	assert(type(array) == "table", "'array' must be an Array")
	assert(array.current ~= nil, "'array' must be an Array")

	return array:length() <= 0
end

for _, method in methods:GetChildren() do
	Array[method.Name] = require(method)
end

return Array
