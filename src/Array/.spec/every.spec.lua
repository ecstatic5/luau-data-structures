return function()
	local Array = require(script.Parent.Parent)

	local numbers = Array.new(1, 2, 3, 4)

	describe("This method", function()
		it("Should return a boolean", function()
			local every = numbers:every(function(el)
				return el % 2 == 0
			end)

			expect(every).to.be.a("boolean")
		end)

		it("Should throw if the 'fn' is not a function", function()
			expect(function()
				numbers:every()
			end).to.throw("'fn' must be a function")
		end)

		it("Should throw if the function doesn't return a boolean", function()
			expect(function()
				numbers:every(function()
					return "hi"
				end)
			end).to.throw("'fn' paremeter return value should be a boolean")
		end)
	end)
end
