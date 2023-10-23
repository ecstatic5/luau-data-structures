local Types = require(script.Parent.private.Types)

local Configuration = {}

function Configuration.setConfig(array, conf: Types.ArrayConfig)
	local configTable = array.array_config

	for i, v in pairs(conf) do
		configTable[i] = v
	end
end

return Configuration
