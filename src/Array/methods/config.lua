local Types = require(script.Parent.Parent.private.Types)
local Configuration = require(script.Parent.Parent.Configuration)

--[[
	Configures the possible options of the current instance

	@configuration	Types.ArrayConfig	New array configuration
	@returns 		void
]]

return function(self, configuration: Types.ArrayConfig)
	Configuration.setConfig(self, configuration)
end
