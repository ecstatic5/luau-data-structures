# What is the project's objective?

Our goal is to **serve the community** and help them streamline their work by manipulating data within data structures.

Because **LUAU** has only `tables` as data structure, **it is very inflexible and has no useful methods for large projects**. Because of this we have decided to create new data structures for **LUAU**.

## How does RDS actually work?

Due to LUAU's **limitations with tables**, **the data structures provided by RDS are really tables on the back end**, but they are tables with special methods and functionalities for your game.

> This can be discovered by executing the following code in your data structure
```lua linenums="1"
local Array = require("<module-location>")
local numbers = Array.new(1, 2, 3, 4)

print(numbers.current) -- {1, 2, 3, 4}
print(typeof(numbers.current)) -- table
```

> [❗] Each data structure contains a property called "`current`" which is a table containing all the elements of your array.

- If you want to know more about this, visit the [API](./api.md)

Each time you call the .new() method of the Array class, a new instance of this class is created, with which using the notation ":" you can access its methods

```lua title="script.lua" linenums="1"
local Array = require("<module-location>")
local numbers = Array.new(1, 2, 3, 4)

numbers:forEach(function(el) 
    print(el)
end)
```

```lua title="Array.lua" linenums="1" 
function Array.new<T>(...: T)
	local self = setmetatable({ current = { ... } }, Array)
	return self
end

function Array:forEach<T>(fn: (el: T, index: number?, array: { T }?) -> ())
	for i, v in self.current do
		if fn(v, i, self) == true then
			break
		end
	end
end
```

## **Note by the creators**

It is important for you to know that we are not professionals in the LUAU world, we are just some young guys who want to help the community by contributing something that can be valuable and useful. We hope you can use this ModuleScript with a reason :D

🌟 If you want to support us you can give us star in the [github repository](https://github.com/ecstatic5/luau-data-structures) 🌟
