=begin
Enumerable#each_with_object:
- iterates over the items in a collection
- yields each element and an arbitrary object to the block
  - the object is often a collection and is passed as an argument
- ignores the return value of the block
- the object passed as arg may be updated by given block
- final value after iteration of obj is returned

Custom each_with_object:
- should act similarly to above
- takes an array and an arbitrary object as an argument, plus a block
- yields each element and the object to the block
- returns the final value of the object
- if the array given is empty, return the original object passed as arg
- Allowed methods: each, each_with_index, inject, loop, for, while, until

Algorithm:
- Iterate through the given array
- Yield each element and the object given as argument to the block
  - element first, then object
- return the object
=end

def each_with_object(arr, obj)
  arr.each { |val| yield(val, obj) }
  obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}