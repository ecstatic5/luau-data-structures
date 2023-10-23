return function()
	local Array = require(script.Parent.Parent)

	local numbers = Array.new(1, 2, 3, 4, 5, 6)
	local entries = numbers:entries()

	describe("This method", function()
		it("Should return an array", function()
			expect(Array.isArray(entries)).to.equal(true)
			expect(entries:toString()).to.equal("<class 'array'>")
		end)

		it("Should return a table with the index of the current element", function()
			--[[
                1: Index
                2: Element
            ]]
			expect(entries:at(1)[1]).to.be.a("number")
			expect(entries:at(2)[2]).to.be.ok()
		end)

		it("Should return an empty array if the array has no entries", function()
			local empty = Array.new()

			expect(empty:entries():length()).to.equal(0)
		end)
	end)
end
