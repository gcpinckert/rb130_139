=begin
Enumerable#drop_while
- iterates over members of a collection
- passes each element to the given block
- when it finds an element for which the block returns false or nil
  - converts the remaining elements of the collection to an Array
  - this includes the element resulting in a falsey return
- returns the converted array result

Custom drop_while:
- behaves similarly to above
- takes an array as an argument and a block
- returns all the elements of the array
  - except elements in the beginning for which the block returns truthy
- if an array is empty, return an empty array
- if the block always returns truthy, return an empty array
- Allowed methods: each, each_with_object, each_with_index, inject
  for, while, until. All other iteration methods are not allowed.

Algorithm:
- Iterate a loop from 0 upto the length of the array - 1, tracking index
  - yield the element at the current index to the block
  - if the block returns truthy
    - return an array that extends from current index to end of arg array
- If iteration completes, return an empty array
=end

def drop_while(arr)
  (0...arr.size).each do |i|
    return arr[i..-1] unless yield(arr[i])
  end
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
