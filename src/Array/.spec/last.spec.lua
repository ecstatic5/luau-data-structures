return function()
	local Array = require(script.Parent.Parent)

	local numbers = Array.new(1, 2, 3, 4)

	describe("This method", function()
		it("Should return the last element of the array", function()
			local lastElementWithMethod = numbers:last()
			local lastElementWithoutMethod = numbers:at(numbers:length())

			expect(lastElementWithMethod).to.equal(lastElementWithoutMethod)
		end)

		it("Should never throw if the array is empty", function()
			expect(function()
				Array.new():last()
			end).never.to.throw()
		end)
	end)
end
