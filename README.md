# Luau-Data-Structures

## Introduction

`"luau-data-structures"` is a **ModuleScript** made by and for the [Roblox Studio](https://www.roblox.com/create) community, mainly focused on adding new `data structures` with new powerful methods from other programming languages **(such as Python, JavaScript, and in the future more)**.

> This ModuleScript was made by ecstaticfaiv & iiAngel out of love for the community ♥

---

## Why to use `luau-data-structures`?

This **ModuleScript** will allow you to have `better data structures` for your game and will allow you to `speed up and facilitate your work with data structure management`.

> Also due to its large number of methods you will not have to do them by hand.

---

## Code examples

How to create an Array:

```lua
local Array = require("<location-to-module>")

local myArray = Array.new(1, 2, 3, "Hello!")
-- {["current"] = {1, 2, 3, "Hello"}}
```

### Some helpful methods here (using `myArray` as an example)

`Merge`:
Inserts a table contents inside the array

```lua
myArray:merge({"Hey!", 4, 5, 6})
-- {1, 2, 3, "Hello!", "Hey", 4, 5, 6}
```

`Shift`:
This removes the first element of the array

```lua
myArray:shift()
-- Array contents:
-- {2, 3, "Hello!"}
```

`Unshift`:
Inserts any value inside the function arguments to the array

```lua
myArray:unshift(4, 5)
-- Array contents:
-- {4, 5, 1, 2, 3, "Hello!"}
```

`Map`:
Returns a modified array with the return value of the callback function

```lua
local myNumbers = Array.new(2, 4, 6, 8)
local result

result = myNumbers:map(function(element)
    return element * 2
end)

-- `result` contents:
-- { 4, 8, 12, 16 }
```

`Fill`:
Fills the array with an specified amount of values

```lua
myArray:fill(5, "Hi!")
-- Array contents:
-- { 1, 2, 3, "Hello!", "Hi!", "Hi!", "Hi!", "Hi!", "Hi!"}
```
