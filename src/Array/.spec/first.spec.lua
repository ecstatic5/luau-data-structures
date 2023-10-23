return function()
	local Array = require(script.Parent.Parent)

	local numbers = Array.new(1, 2, 3, 4)

	describe("This method", function()
		it("Should return the last element of the array", function()
			local firstElementWithMethod = numbers:first()
			local firstElementWithoutMethod = numbers:at(1)

			expect(firstElementWithMethod).to.equal(firstElementWithoutMethod)
		end)

		it("Should never throw if the array is empty", function()
			expect(function()
				Array.new():first()
			end).never.to.throw()
		end)
	end)
end
