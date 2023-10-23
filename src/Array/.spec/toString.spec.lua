return function()
	local Array = require(script.Parent.Parent)

	describe("This method", function()
		it("Should return <class 'array'>", function()
			expect(Array.new():toString()).to.equal("<class 'array'>")
		end)
	end)
end
