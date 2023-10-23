--[[
	Iters through all the elements of the

	@fn		 function(el: T, index: number, array: Array) 	Callback to be executed each iteration
    @returns void
]]

return function(self, fn: (el: any, index: number?, array: { any }?) -> ())
	for i, v in self.current do
		if fn(v, i, self) == true then
			break
		end
	end
end
