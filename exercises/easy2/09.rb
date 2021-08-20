=begin
Enumerable#each_cons:
- iterates over items in the calling collection
- takes each sequence of n consecutive elements
- passes the sequence to the given block
- returns nil

Custom each_cons:
- should behave similarly to above
- takes an array as an argument
- takes array elements 2 at a time
- yields each consecutive pair of elements to the block
- returns nil
- Allowed methods: each, each_with_object, each_with_index, inject, loop,
  for, while, until

Algorithm:
- Iterate from 0 to size of array - 2, tracking index
- yield the two element array starting and the current index to the block
- return nil once iteration is complete
=end

def each_cons(arr)
  (0..(arr.size - 2)).each { |i| yield(arr[i, 2]) }
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
