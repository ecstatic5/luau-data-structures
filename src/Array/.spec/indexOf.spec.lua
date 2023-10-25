return function()
	local Array = require(script.Parent.Parent)
	local letters = Array.new("a", "b", "c", "d", "e", "f", "g")

	describe("This method", function()
		it("Should throw an error if the 'el' parameter is not defined", function()
			expect(function()
				letters:indexOf()
			end).to.throw("'element' can't be nil")
		end)

		it("Should return a number", function()
			expect(letters:indexOf("b")).to.be.a("number")
		end)

		it("Should return 0 if no element is find", function()
			expect(letters:indexOf("z")).to.equal(0)
		end)
	end)
end
