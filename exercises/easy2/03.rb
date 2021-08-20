=begin
Enumerable#map
- iterates over items in a collection
- yields the current item to the given block
- uses the return value of the block as the current element in a results array
- array of block return values is returned
- each time we yield to the block, we obtain a single value
  - may be complex (another collection), but it remains a single value
- always returns an array of the same number of elements as original collection

Custom map:
- Behaves similarly to above
- Takes an array as an argument, and a block
- Returns a new array containing return values produced by block
- If array arg is empty, map returns an empty array regardless of block
- Allowed methods: each, each_with_object, each_with_index, inject, loop,
  for, while, until. All other iteration methods are not allowed.

Algorithm:
- Initialize an empty results array
- Iterate over the given array
  - yield each element to the block
  - add the return value of the block to the results array (as a single ele)
- Return the results array
=end

def map(arr)
  arr.each_with_object([]) do |obj, results|
    results << yield(obj)
  end
end



p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
