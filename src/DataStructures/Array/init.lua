local Types = require(script:WaitForChild("Types"))
local Configuration = require(script:WaitForChild("Configuration"))

local Array = {
	array_config = {
		maxFillMethodAmount = 50_000,
	},

	__len = function(t)
		local length = 0
		t:forEach(function()
			length += 1
		end)
		return length
	end,
}
Array.__index = Array

--[[
	Creates an instance of the Array class

	@returns Array	New array with the given elements
]]
function Array.new<T>(...: T)
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

--[[
	Configures the possible options of the current instance

	@configuration	Types.ArrayConfig	New array configuration
	@returns 		void
]]
function Array:config(configuration: Types.ArrayConfig)
	Configuration.setConfig(self, configuration)
end

--[[
	Concatenates all elements of the array into a string using the separator for each of the elements

	@returns A string joined with all Array elements
]]
function Array:join(separator: string)
	assert(type(separator) == "string", "'separator' must be a string")
	assert(self:length() > 0, "It's not possible to join empty arrays")

	return table.concat(self.current, separator or "")
end

--[[
	Checks if the element passed as argument is inside the array

	@value	 any			Value to find inside the array
	@returns true | false
]]
function Array:includes(value: any)
	for _, v in self.current do
		if v == value then
			return true
		end
	end
	return false
end

--[[
	Creates a new instance of Array with the modified elements using the expression inside the callback

	@fn		 function(el: T, index: number): T		Callback to be evaluated
	@returns Array									Mapped Array
]]
function Array:map<T>(fn: (el: T, index: number) -> T)
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

--[[
	Checks if ALL the elements of the Array fulfill a condition

	@fn		 function(el: T): boolean	Callback to evaluate
	@returns boolean
]]
function Array:every<T>(fn: (el: T) -> boolean): boolean
	self:forEach(function(element)
		local condition = fn(element)
		assert(type(condition) == "boolean", "'fn' paremeter return value should be a boolean")

		if not condition then
			return false
		end
	end)
	return true
end

--[[
	Checks if SOME the elements of the Array fulfill a condition

	@fn		 function(el: T): boolean	Callback to evaluate
	@returns boolean
]]
function Array:some<T>(fn: (el: T) -> boolean): boolean
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

--[[
	Fills "X" number of positions with "Y" element in the Array

	@amount		Number	Amount of positions to fill
	@value		T		Value to be filled in the Array
	@returns 	Array 	The original array with the filled fields
]]
function Array:fill<T>(amount: number, value: T)
	assert(amount <= self.array_config.maxFillMethodAmount, "'amount' paremeter is higher than maximun value")

	for i = 0, amount do
		self.current[i] = value
	end

	return self
end

--[[
	Merges a table contents to the current array

	@array 		Table	The table to insert 
	@returns	void
]]
function Array:merge<T>(array: { any })
	for _, v in array.current do
		self:push(v)
	end
end

--[[
	Filters the array elements

	@returns    {number: T}    Filtered array
]]
function Array:filter<T>(fn: (value: T) -> boolean)
	local filtered = self.new()

	for _, v in self.current do
		if not fn(v) then
			continue
		end
		filtered:push(v)
	end

	return filtered
end

--[[
	"Cuts" the elements of the array obtaining only the elements between the range of "start" and "_end"

	@start	 number		Start index
	@_end?	 number		End index
	@returns Array		Sliced array
]]
function Array:slice(start: number, _end: number?)
	_end = _end or self:length()

	assert(type(start) == "number", "'start' paremeter must be a number")
	assert(type(_end) == "number", "'end' paremeter must be a number")
	assert(_end > start, "'start' parameter can't be greater than '_end'")

	local sliced = self.new()

	for i = start, _end do
		sliced:push(self.current[i])
	end

	return sliced
end

--[[
	Iters through all the elements of the

	@fn		 function(el: T, index: number, array: Array) 	Callback to be executed each iteration
    @returns void
]]
function Array:forEach<T>(fn: (el: T, index: number?, array: { T }?) -> ())
	for i, v in self.current do
		if fn(v, i, self) == true then
			break
		end
	end
end

--[[
	Returns the length of the array

	@returns number Array's length
]]
function Array:length(): number
	return #self.current
end

--[[
	Returns all the elements of the array along with its index within a table. Example: {1, "first element"}

	@returns Array

]]
function Array:entries()
	local array = self.new()

	self:forEach(function(el, index)
		array:push({ index, el })
	end)

	return array
end

--[[
	Returns the element in certain position

	@pos		number	Element position
	@returns	any		Element in that position
]]
function Array:at(pos: number): any
	return self.current[pos]
end

--[[
	Pushes an element to the last element of the array

    @element    any     Element to be pushed
	@returns    number  New array length
]]
function Array:push(element)
	table.insert(self.current, element)
	return self:length()
end

--[[
	Returns the number of times an element is repeated in the array

	@value		any		Element to count
	@returns	number	times the element was found
]]
function Array:count(value: any): number
	assert(value ~= nil, "'value' can't be nil")

	local count = 0

	self:forEach(function(el)
		if el == value then
			count += 1
		end
	end)

	return count
end

--[[
	Gets a random element from the Array

	@returns	any		Random element
]]
function Array:choice(): any
	local length = self:length()

	assert(length > 0, "Cannot get a random element from an empty array")

	return self:at(math.random(1, length))
end

--[[
	@returns	Array	A copy of the current array
]]
function Array:copy()
	return self.from(self.current)
end

--[[
	Returns a new sorted array

	@fn			function	An optional comparison function to be used when comparing elements in the table
	@returns	Array		A sorted array
]]
function Array:sort(fn: (a: any, b: any) -> ())
	local sorted = self:copy()

	table.sort(sorted.current, if fn then fn else nil)

	return sorted
end

--[[
	Returns the first element of the Array

	@returns	any		The first element of the Array
]]
function Array:first(): any
	return self:at(1)
end

--[[
	Returns the last element of the Array

	@returns	any		The last element of the Array
]]
function Array:last(): any
	return self:at(self:length())
end

--[[
	Deletes the element in the index passed to it

	@returns Array	The array where the method was called
]]
function Array:remove(toRemove: number | string)
	if type(toRemove) == "number" then
		table.remove(self.current, toRemove)
		return self
	end

	self:forEach(function(_, index, array)
		if index == toRemove then
			table.remove(array, index)
			return true
		end
	end)

	return self
end

--[[
    Removes the last element of the array

    @returns New array length
]]
function Array:pop()
	table.remove(self.current, self:length())
	return self:length()
end

--[[
    Removes the first element of the array

    @returns Removed element value
]]
function Array:shift()
	local el = self.current[1]
	table.remove(self.current, 1)
	return el
end

--[[
	Inserts any type of element into the start of the array

	@returns number New length of the array
]]
function Array:unshift<T>(...: T)
	local t = { ... }

	for i = 1, #{ ... }, 1 do
		table.insert(self.current, i, t[i])
	end

	table.clear(t)
	return self:length()
end

--[[
	Flips the array elements

	@returns Reversed array
]]
function Array:reverse()
	local reversed = self.new()
	for i = self:length(), 1, -1 do
		reversed:push(self.current[i])
	end
	return reversed
end

--[[
	Removes all the elements from the array and returns it

	@returns self
]]
function Array:clean()
	table.clear(self.current)
	return self
end

return Array
