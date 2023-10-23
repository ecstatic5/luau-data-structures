return function()
	local Array = require(script.Parent.Parent)
	local arrays = {
		numbers = Array.new(1, 2, 3, 4),
		empty = Array.new(),
		strings = Array.new("a", "b", "c", "d"),
	}

	---------- STATIC METHODS TESTS --------

	describe(".new()", function()
		it("Should return an array as a table", function()
			expect(arrays.numbers).to.be.a("table")
		end)

		it("Should contains a property named 'current'", function()
			expect(arrays.numbers.current).to.be.ok()
		end)
	end)

	describe(".from()", function()
		it("Should return an array", function()
			local iter = { 1, 2, 3, 4 }
			local array = Array.from(iter)

			expect(Array.isArray(array)).to.be.equal(true)
		end)

		it("Should throw if the passed argument is not an iter", function()
			expect(function()
				Array.from(1)
			end).to.throw("'iterable' must be a valid iterable")
		end)
	end)

	describe(".isArray()", function()
		it("Should return a boolean", function()
			expect(Array.isArray(arrays.empty)).to.be.a("boolean")
		end)

		it("Should NEVER throw", function()
			expect(function()
				Array.isArray(3)
			end).never.to.throw()
		end)

		it("Should return false is the passed argument is not a table", function()
			expect(Array.isArray(69)).to.be.equal(false)
		end)
	end)

	describe(".isEmpty()", function()
		it("Should throw if the passed argument is not an Array", function()
			expect(function()
				Array.isEmpty(20)
			end).to.throw("'array' must be an Array")
		end)

		it("Should return a boolean", function()
			expect(Array.isEmpty(arrays.empty)).to.be.equal(true)
		end)
	end)
end
