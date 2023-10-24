# Homepage

I welcome you to `roblox-data-structures`. The best **ModuleScript** for data structures

## What's this?

`roblox-data-structures` (RDS) is a `ModuleScript` made for and by the community, this module focuses on introducing **new data structures to LUAU** (e.g. Set, Array, Dict and others), along with **powerful methods** for each of these (inspired by other programming languages).

## Why should I use RDS?

The real question is: **When should I use it and when should I not?**

### **When you should**

You should use it when you need to manipulate data in data structures easily and quickly without having to write the necessary methods to do what you need to do.

You can also use it if you don't like to work with normal tables or metatables and you want to make your work easier.

> If you work with large amounts of data, this may not be the best option.

### **When you should not**

You should not use it if you manipulate a very large amount of data, as the methods may not be efficient for the task you are doing.

---

## Code examples

> Filter only even numbers
```lua linenums="1"
local Array = require("<module-location>")
local numbers = Array.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

local evenNumbers = numbers:filter(function(el)
    return el % 2 == 0
end)

print(evenNumbers) -- [2, 4, 6, 8, 10]
```

> Obtain the square of all numbers
```lua linenums="1"
local Array = require("<module-location>")
local numbers = Array.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

local squareNumbers = numbers:map(function(el)
    return el ^ 2
end)

print(squareNumbers) -- [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

> Filling an array with many positions with the same element
```lua linenums="1"
local Array = require("<module-location>")
local zeros = Array.new():fill(0, 1000)

print(zeros) -- [0, 0, 0, 0, 0, 0, ..., 0]
```

> Check if all the elements of an array meet a condition
```lua linenums="1"
local Array = require("<module-location>")
local numbers = Array.new(1, 2, 4, 5, 6, 2, 8, 4, 3, 2)

print(numbers:every(function(el)
    return el > 3
end)) -- false (not all elements are greater than 3)
```

---

## RDS API

You can visit the full RDS API [clicking here](./api.md). The API contains ALL the methods of ALL the data structures that RDS has.

### All RDS Data Structures

- **Array**
    - Static Methods
        - `.new<T>(...: T): Array`
        - `.from<T>(iterable: { T }): Array`
        - `.isArray(array: Array): boolean`
        - `.isEmpty(array: Array): boolean`
    - Instance Methods
        - `:config(configuration: Types.ArrayConfig)`
        - `:join(separator: string): string`
        - `:includes(value: any): boolean`
        - `:map<T>(fn: (el: T, index: number) -> T)`
        - `:every<T>(fn: (el: T) -> boolean): boolean`
        - `:some<T>(fn: (el: T) -> boolean): boolean`
        - `:fill<T>(amount: number, value: T)`
        - `:merge<T>(array: Array)`
        - `:filter<T>(fn: (value: T) -> boolean): Array`
        - `:slice(start: number, _end: number): Array`
        - `:length(): number`
        - `:entries(): Array`
        - `:at(pos: number): any`
        - `:forEach<T>(fn: (el: T, index: number?, array: Array?) -> ())`
        - `:push(element): number`
        - `:count(value: any): number`
        - `:choice(): any`
        - `:copy(): Array`
        - `:sort(): Array`
        - `:first(): any`
        - `:last(): any`
        - `:remove(toRemove: number | string): any`
        - `:pop(): number`
        - `:shift(): any`
        - `unshift<T>(...: T): number`
        - `:reverse()`
        - `:clean()`
        - `:flat(depth: number): Array`
        - `:append<T>(...: T): number`
- **Set**
    - `coming soon`
- **Dict**
    - `coming soon`
- **Map**
    - `coming soon`