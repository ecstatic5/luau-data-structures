return function()
	local Array = require(script.Parent.Parent)

	local numbers = Array.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)

	describe("This method", function()
		it("Should return an array", function()
			local evenNumbers = numbers:filter(function(el)
				return el % 2 == 0
			end)

			expect(Array.isArray(evenNumbers)).to.equal(true)
			expect(evenNumbers.current).to.be.ok()
		end)

		it("Should throw if the 'fn' parameter is not a function", function()
			expect(function()
				numbers:filter()
			end).to.throw("'fn' must be a function")
		end)
	end)
end
