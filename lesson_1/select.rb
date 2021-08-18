=begin
Write a select method that mirrors the behavior of `Array#select`. 

Array#Select:
- takes a block, yielding each element to the block
- if the block evaluates to true: the current element is included in returned array
- if the block evaluates to false: the current element is not included in the returned array

Examples:
array = [1, 2, 3, 4, 5]

array.select { |num| num.odd? }       # => [1, 3, 5]
array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

Data Structures:
Input: array
Output: array

Algorithm:
- initialize empty array for results
- initialize a counter
- while the counter is less than the size of the input array:
  - pass the element at index counter to the given block
  - if the block returns true:
    - add the element at index counter to the results array
  - increment the counter
- return the results array
=end

def select(arr)
  results = []
  i = 0

  while i < arr.size
    if yield(arr[i])
      results << arr[i]
    end
    i += 1
  end

  results
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
