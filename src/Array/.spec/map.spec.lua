return function()
	local Array = require(script.Parent.Parent)

	local numbers = Array.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)

	describe("This method", function()
		it("Should return a new Array", function()
			local mapped = numbers:map(function(el)
				return el ^ 2
			end)

			expect(Array.isArray(mapped)).to.equal(true)
			expect(mapped.current).to.be.ok()
			expect(mapped:toString()).to.equal("<class 'array'>")
		end)

		it("Should throw an error if the 'fn' parameter is not a function", function()
			expect(function()
				numbers:map("not a function D:")
			end).to.throw("'fn' must be a function")
		end)

		it("Should return an empty array if the 'fn' paremeter doesn't return a value", function()
			local empty = numbers:map(function() end)

			expect(empty:length()).to.equal(0)
		end)
	end)
end
