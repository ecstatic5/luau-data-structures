<!-- IM TIRED. Att: ecstatic5 😢 -->

# Array

It is a data structure which receives an indefinite amount of any type of value.

<!-- .new -->
> ### .new<T\>(...: T): Array **`static (.)`** **`constructor`**

Creates a new instance of the Array class

#### Parameters

- `...: T`: Elements of any data type or type T to be added to the array

#### Code example

```lua linenums="1" hl_lines="2"
local Array = require("<module-location>")
local numbers = Array.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
```

---
<!-- .from -->
> ### .from<T\>(iterable: { T }): Array **`static (.)`** **`constructor`**

Creates a new instance of Array with the elements of the iterable

#### Parameters

- `iterable: { T }`: The table with the elements to be converted to Array

#### Code example

```lua linenums="1" hl_lines="3 4 5"
local Array = require("<module-location>")

local letters = {"a", "b", "c", "d", "e", "f"}
local lettersArray = Array.from(letters)
print(lettersArray.current) -- {"a", "b", "c", "d", "e", "f"}

-- Now you can use the array methods with these elements :)
```

---
<!-- .isArray -->
> ### .isArray(array: Array): boolean **`static (.)`**

Checks if the argument passed to it is an instance of Array

> This method checks if the argument contains a property called "current", so if you pass a table like `{current="hi"}` it will return true.

#### Parameters

- `array: Array`: The object to be checked if it is an instance of Array

#### Code example

```lua linenums="1" hl_lines="3 4 6 7 8 9"
local Array = require("<module-location>")

local validArray = Array.new(1, 2, 3, 4)
local invalidArray = {1, 2, 3, 4}

print(Array.isArray(validArray)) -- true
print(Array.isArray(invalidArray)) -- false
print(Array.isArray({current = "DON'T DO THIS"})) -- true
print(Array.isArray(4)) -- false (Return false if it is a data type other than a table or array)
```

---
<!-- .isEmpty -->
> ### .isEmpty(array: Array): boolean **`static (.)`** **`constructor`**

Checks whether the array (or any other data structure) is empty or not

#### Parameters

- `array: Array`: The object to be checked if it is empty

#### Code example

```lua linenums="1" hl_lines="3 4 6 7 8 9"
local Array = require("<module-location>")

local numbers = Array.new() -- empty array
local letters = Array.new("a", "b", "c", "d", "e")

print(Array.isEmpty(numbers)) -- true
print(Array.isEmpty(letters)) -- false
print(Array.isEmpty({1, 2})) -- false
print(Array.isEmpty(4)) -- ERROR: 'array' must be an Array
```

---

## MORE COMING SOON 🦕

---

