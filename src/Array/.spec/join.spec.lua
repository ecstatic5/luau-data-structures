return function()
	local Array = require(script.Parent.Parent)

	describe("This method", function()
		it("Should always return a string", function()
			local numbers = Array.new(1, 2, 3, 4, 5)
			expect(numbers:join("")).to.be.a("string")
		end)

		it("Should throw an error if the array is empty", function()
			expect(function()
				Array.new():join("")
			end).to.throw("It's not possible to join empty arrays")
		end)

		it("Should throw an error if the separator is not a string", function()
			expect(function()
				Array.new():fill(10, 1):join(4)
			end).to.throw("'separator' must be a string")
		end)
	end)
end
