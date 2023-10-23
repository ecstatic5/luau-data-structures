return function()
	local Array = require(script.Parent.Parent)

	local letters = Array.new("a", "b", "c", "d", "e", "f")

	describe("This method", function()
		it("Should return the element in the given index", function()
			local letterC = letters:at(3)

			expect(letterC).to.equal("c")
		end)

		it("Should throw if the 'pos' parameter is not a number", function()
			expect(function()
				Array.new(1, 2, 3):at("hi")
			end).to.throw("'pos' must be a number")
		end)

		it("Should return nil if the index is greater than the number of elements", function()
			local nilElement = letters:at(100)

			expect(nilElement).to.equal(nil)
		end)
	end)
end
