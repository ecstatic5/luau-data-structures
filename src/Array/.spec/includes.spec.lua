return function()
	local Array = require(script.Parent.Parent)

	local letters = Array.new("a", "b", "c")

	describe("This method", function()
		it("Should return a boolean value", function()
			expect(letters:includes("b")).to.be.a("boolean")
		end)

		it("Should NEVER throw an error if the array is empty", function()
			expect(function()
				Array.new():includes("h")
			end).never.to.throw()
		end)
	end)
end
