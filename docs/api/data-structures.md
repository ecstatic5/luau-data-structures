# RDS API

All functions of all RDS data structures are documented here.

Some methods will come with the following tags:

> - **`static (.)`**: Means that the current method does not need an instance and can be used only by using the class.
> - **`instance (:)`**: Means that you need to instantiate the class to be able to use it.
> - **`constructor`**: Means that the method is a class constructor or returns a new data structure.


## All the RDS API

### [Array](./arrays.md)

- #### .new<T\>(...: T): Array - **`static (.)`** **`constructor`**
- #### .from<T\>(iterable: { T }): Array - **`static (.)`** **`constructor`**
- #### .isArray(array: Array): boolean - **`static (.)`**
- #### .isEmpty(array: Array): boolean - **`static (.)`**
- #### :config(configuration: Types.ArrayConfig) - **`instance (:)`**
- #### :join(separator: string): string - **`instance (:)`**
- #### :includes(value: any): boolean - **`instance (:)`**
- #### :map<T>(fn: (el: T, index: number) -> T) - **`instance (:)`** **`constructor`**
- #### :every<T>(fn: (el: T) -> boolean): boolean - **`instance (:)`**
- #### :some<T>(fn: (el: T) -> boolean): boolean - **`instance (:)`**
- #### :fill<T>(amount: number, value: T) - **`instance (:)`**
- #### :merge<T>(array: Array) - **`instance (:)`**
- #### :filter<T>(fn: (value: T) -> boolean): Array - **`instance (:)`** **`constructor`**
- #### :slice(start: number, _end: number): Array - **`instance (:)`** **`constructor`**
- #### :length(): number - **`instance (:)`**
- #### :entries(): Array - **`instance (:)`** **`constructor`**
- #### :at(pos: number): any - **`instance (:)`**
- #### :forEach<T>(fn: (el: T, index: number?, array: Array?) -> ()) - **`instance (:)`**
- #### :push(element): number - **`instance (:)`**
- #### :count(value: any): number - **`instance (:)`**
- #### :choice(): any - **`instance (:)`**
- #### :copy(): Array - **`instance (:)`** **`constructor`**
- #### :sort(): Array - **`instance (:)`** **`constructor`**
- #### :first(): any - **`instance (:)`**
- #### :last(): any - **`instance (:)`**
- #### :remove(toRemove: number | string): any - **`instance (:)`**
- #### :pop(): number - **`instance (:)`**
- #### :shift(): any - **`instance (:)`**
- #### unshift<T>(...: T): number - **`instance (:)`**
- #### :reverse() - **`instance (:)`**
- #### :clean() - **`instance (:)`**

### [Types](./types.md)
- #### Array.Types.ArrayConfig
- #### Array.Types.Array
- #### Array.Types._self