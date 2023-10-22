return function()
	local Array = require(script.Parent)
	local arrays = {
		numbers = Array.new(1, 2, 3, 4),
		empty = Array.new(),
		strings = Array.new("a", "b", "c", "d"),
		mix = Array.new("a", 2, false, {}),
	}

	---------- STATIC METHODS TESTS --------

	describe(".new()", function()
		it("Should return an array as a table", function()
			expect(arrays.numbers).to.be.a("table")
		end)

		it("Should contains a property named 'current'", function()
			expect(arrays.numbers:length()).to.be.ok()
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

	---------- INSTANCE METHODS TESTS ----------

	describe(":join()", function()
		it("Should always return a string", function()
			expect(arrays.numbers:join(", ")).to.be.a("string")
		end)

		it("Should throw an error if the array is empty", function()
			expect(function()
				arrays.empty:join(", ")
			end).to.throw("It's not possible to join empty arrays")
		end)
	end)

	describe(":includes()", function()
		it("Should return a boolean value", function()
			expect(arrays.strings:includes("b")).to.be.a("boolean")
		end)

		it("Should NEVER throw an error if the array is empty", function()
			expect(function()
				arrays.empty:includes("h")
			end).never.to.throw()
		end)
	end)

	describe(":map<T>()", function()
		it("Should return a new array", function()
			local mapped = arrays.numbers:map(function(el)
				return el ^ 2
			end)

			expect(Array.isArray(mapped)).to.be.equal(true)
		end)

		it("Should throw an error if the 'fn' parameter is not a function", function()
			expect(function()
				arrays.numbers:map(20)
			end).to.throw("'fn' must be a function")
		end)

		it("Should return an empty array if the 'fn' parameter doesn't return a value", function()
			expect(arrays.numbers:map(function() end):length()).to.equal(0)
		end)
	end)

	describe(":every<T>()", function()
		it("Should ALWAYS return a boolean", function()
			expect(Array.new(1, 2, 3, 4):every(function(el)
				return type(el) == "number"
			end)).to.be.a("boolean")
		end)

		it("Should throw an error if the 'fn' argument doesn't return a boolean", function()
			expect(function()
				arrays.numbers:every(function()
					return "other value"
				end)
			end).to.throw("'fn' paremeter return value should be a boolean")
		end)
	end)

	describe(":some<T>()", function()
		it("Should throw an error if the 'fn' argument doesn't return a boolean", function()
			expect(function()
				arrays.numbers:some(function()
					return "other value"
				end)
			end).to.throw("'fn' paremeter return value should be a boolean")
		end)
	end)

	describe(":fill<T>()", function()
		local numbers = Array.new()

		it("Should throw an error if the 'amount' parameter is higher than the maximum value", function()
			expect(function()
				local array = Array.new()
				array:fill(math.huge)
			end).to.throw("'amount' paremeter is higher than maximun value")
		end)

		it("Should fill all fields with the same given value", function()
			expect(numbers:fill(10, 1):every(function(el)
				return el == numbers[1]
			end)).to.be.equal(true)
		end)
	end)

	--[[
	TODO:
	
	describe(":merge()", function()
		it()
	end)
	describe(":filter()", function()
		it()
	end)
	describe(":slice()", function()
		it()
	end)
	describe(":length()", function()
		it()
	end)
	]]

	describe(":entries()", function()
		it("Should return the index with the value inside a table", function()
			local letters = Array.new("a", "b", "c")
			local entries = letters:entries().current

			expect(entries).to.be.a("table")
			expect(entries[1][1]).to.be.a("number")
			expect(entries[1][2]).to.be.ok()
		end)

		it("Should return an empty array is the array is empty", function()
			expect(arrays.empty:entries():length()).to.be.equal(0)
		end)
	end)

	--[[
	TODO:

	describe(":at()", function()
		it()
	end)
	describe(":push()", function()
		it()
	end)
	]]
	describe(":count()", function()
		it("Should return a number", function()
			expect(arrays.numbers:count(2)).to.be.a("number")
		end)

		it("Should throw an error if no value is passed", function()
			expect(function()
				arrays.numbers:count()
			end).to.throw("'value' can't be nil")
		end)
	end)

	describe(":choice()", function()
		it("Should return the random element", function()
			expect(arrays.strings:choice()).to.be.ok()
		end)

		it("Should throw if the array is empty", function()
			expect(function()
				arrays.empty:choice()
			end).to.throw("Cannot get a random element from an empty array")
		end)

		it("Should never return nil", function()
			expect(arrays.numbers:choice()).to.be.ok()
		end)

		it("Should return a element that exists in the array", function()
			expect(arrays.numbers:includes(arrays.numbers:choice())).to.be.equal(true)
		end)
	end)

	describe(":first()", function()
		it("Should return the first element in the array", function()
			local firstNumber = arrays.numbers:first()
			expect(firstNumber).to.be.equal(arrays.numbers:at(1))
		end)

		it("Should return nil if the array is empty", function()
			local firstEmptyElement = arrays.empty:first()
			expect(firstEmptyElement).to.be.equal(nil)
		end)
	end)

	describe(":last()", function()
		it("Should return the last element in the array", function()
			local lastNumber = arrays.numbers:last()
			expect(lastNumber).to.be.equal(arrays.numbers:at(arrays.numbers:length()))
		end)

		it("Should return nil if the array is empty", function()
			local lastEmptyElement = arrays.empty:last()
			expect(lastEmptyElement).to.be.equal(nil)
		end)
	end)

	--[[
	describe(":pop()", function()
		it()
	end)
	describe(":shift()", function()
		it()
	end)
	describe(":unshift()", function()
		it()
	end)
	]]

	describe(":clean()", function()
		it("Should remove all the elements", function()
			local lotNumbers = Array.new():fill(100, 1)

			expect(lotNumbers:clean():length()).to.be.equal(0)
		end)
	end)
end
