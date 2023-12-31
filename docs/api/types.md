# Types

> ### Array.Types.ArrayConfig - **`table`**

_Represents the configuration of an Array._

> It is requested in the following methods

- :config() - **`instance (:)`** **`Array`**

```lua linenums="1"
{
	maxFillMethodAmount: number?,
}
```

#### Properties

- `maxFillMethodAmount: number?`: The maximum number of elements that can be generated by the :fill() method of the Array class.

---

> ### Array.Types.Array - **`table`**

_Represents an Array._

> It is requested in the following methods

- None

```lua linenums="1"
export type Array<T> = {
	--[[
		- Array.properties: Properties of the array
		- Array.static: Static methods of the Array class
		- Array.instance: Instance methods of the Array class
		- @returns Array<T>: Methods that returns Arrays
	]]

	--[[ Array.properties ]]
	current: { T },

	--[[ Array.static ]]
	from: (iterable: { T }) -> Array<T>,
	isArray: (array: Array<T>) -> boolean,
	new: (...T) -> Array<T>,
	isEmpty: (array: Array<T>) -> boolean,

	--[[ Array.instance ]]
	config: (self: _self, configuration: ArrayConfig) -> (),
	join: (self: _self, separator: string) -> string,
	includes: (self: _self, value: T) -> boolean,
	every: (self: _self, fn: (el: T) -> boolean) -> boolean,
	some: (self: _self, fn: (el: T) -> boolean) -> boolean,
	merge: (self: _self, array: { T }) -> (),
	forEach: (self: _self, fn: (el: T, index: number?, array: { T }?) -> ()) -> (),
	length: (self: _self) -> number,
	at: (self: _self, pos: number) -> T,
	push: (self: _self, element: T) -> number,
	count: (self: _self, value: T) -> number,
	first: (self: _self) -> T,
	last: (self: _self) -> T,
	pop: (self: _self) -> number,
	shift: (self: _self) -> number,
	unshift: (self: _self, ...T) -> number,
	toString: (self: _self) -> string,
	append: (self: _self, ...T) -> number,
	indexOf: (self: _self, el: T) -> number,

	--[[ @returns Array<T> Array.instance ]]
	choice: (self: _self, amount: number?) -> T | Array<T>,
	map: (self: _self, fn: (el: T, index: number) -> T) -> Array<T>,
	fill: (self: _self, amount: number, value: T) -> Array<T>,
	filter: (self: _self, fn: (value: T) -> boolean) -> Array<T>,
	slice: (self: _self, start: number, _end: number?) -> Array<T>,
	entries: (self: _self) -> Array<T>,
	copy: (self: _self) -> Array<T>,
	sort: (self: _self, fn: (a: T, b: T) -> ()) -> Array<T>,
	remove: (self: _self, toRemove: number | string) -> Array<T>,
	reverse: (self: _self) -> Array<T>,
	clean: (self: _self) -> Array<T>,
	flat: (self: _self, depth: number) -> Array<T>,
}
```

#### Properties

- None

---

> ### Array.Types._self - **`table`**

_Represents the actual Array._

> It is requested in the following methods

- None

```lua linenums="1"
export type _self = {}
```

#### Properties

- None

---
