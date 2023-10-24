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

		it("Should throw an error if the 'amount' is not a number", function()
			expect(function()
				letters:choice("hi")
			end).to.throw("'amount' must be a number")
		end)

		it("Should return an array with 'amount' elements if the parameter is specified", function()
			local randomLetters = letters:choice(20)

			expect(Array.isArray(randomLetters)).to.equal(true)
			expect(randomLetters:length()).to.equal(20)
		end)

		it("Should return one value if the 'amount' parameter is not specified", function()
			expect(#{ letters:choice() }).to.equal(1)
		end)
	end)
end
