return function()
	local Array = require(script.Parent.Parent)

	local matrix = Array.new({ 1, 2, 3 }, { { 3, 4, 5 } }, { { { 6, 7, 8 } } })

	describe("This method", function()
		it("Should flat all the array if no 'depth' is specified", function()
			local flat = matrix:flat()

			expect(flat.current[1]).never.to.have.a("table")
		end)

		it("Should throw if the 'depth' paremeter is not a number", function()
			expect(function()
				matrix:flat("hi")
			end).to.throw("'depth' must be a number")
		end)
	end)
end
