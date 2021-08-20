=begin
Enumerable#each_with_index
- iterates over items in a collection
- yields each item along with its index to the given block
- ignores the return value of the block
- returns a reference to the original (calling) collection

Custom each_with_index:
- should behave similar to above
- takes an array as argument, with a block
- yields each element in the arg array with its index to the block
- returns a reference to the original array
- Allowed methods: each, each_with_object, inject, loop, for, while, until

Algorithm:
- Iterate a loop from 0 to the size of the array - 1, tracking index
- Yield the element at index and the index to the block
- Return the original collection
=end

def each_with_index(arr)
  (0...arr.size).each do |i|
    yield(arr[i], i)
  end

  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# Outputs:
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true
