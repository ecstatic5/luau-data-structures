--[[
	Returns a new sorted array

	@fn			function	An optional comparison function to be used when comparing elements in the table
	@returns	Array		A sorted array
]]

return function(self, fn: (a: any, b: any) -> ())
	local sorted = self:copy()

	table.sort(sorted.current, if fn then fn else nil)

	return sorted
end
