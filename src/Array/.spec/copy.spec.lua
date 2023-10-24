return function()
	local Array = require(script.Parent.Parent)

	local original = Array.new(1, 2, 3, 4)

	describe("This method", function()
		it("Should return an array", function()
			local copy = original:copy()

			expect(Array.isArray(copy)).to.equal(true)
		end)
	end)
end
