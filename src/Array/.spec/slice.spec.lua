return function()
	local Array = require(script.Parent.Parent)

	local letters = Array.new("a", "b", "c", "d", "e", "f", "g")

	describe("This method", function()
		it("Should return an array", function()
			expect(Array.isArray(letters:slice(5))).to.equal(true)
		end)

		it("Should throw if the 'start' parameter is empty or is not a number", function()
			expect(function()
				letters:slice()
			end).to.throw("'start' parameter must be a number")

			expect(function()
				letters:slice("hi")
			end).to.throw("'start' parameter must be a number")
		end)

		it("Should throw if the 'end' parameter is is not a number", function()
			expect(function()
				letters:slice(3, "hi")
			end).to.throw("'end' parameter must be a number")
		end)

		it("Should throw if the 'start' parameter is greater than 'end'", function()
			expect(function()
				letters:slice(20, 2)
			end).to.throw("'start' parameter can't be greater than '_end'")
		end)
	end)
end
