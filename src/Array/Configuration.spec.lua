return function()
	local Array = require(script.Parent).new
	local Configuration = require(script.Parent.Configuration)

	local templateConfigs = {
		empty = {
			maxFillMethodAmount = 69, -- 😏
		},
		numbers = {
			maxFillMethodAmount = 200,
		},
	}

	describe(".setConfig(array: Array, conf: Types.ArrayConfig)", function()
		it("Should set the configuration to an array", function()
			local numbers = Array()
			numbers:config(templateConfigs.numbers)

			expect(numbers.array_config).to.be.ok()
		end)

		it("Should NEVER throw an error if the array is empty", function()
			expect(function()
				local empty = Array()
				empty:config(templateConfigs.empty)
			end).never.to.throw()
		end)

		it("Should set just the configurations passed", function() end)
	end)
end
