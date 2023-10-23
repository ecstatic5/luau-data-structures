return function()
	local Array = require(script.Parent.Parent)

	local letters = Array.new("a", "b", "c", "d")

	describe("This method", function()
		it("Should not return nil", function()
			expect(letters:choice()).to.be.ok()
		end)

		it("Should throw an error if the array is empty", function()
			expect(function()
				Array.new():choice()
			end).to.throw("Cannot get a random element from an empty array")
		end)
	end)
end
