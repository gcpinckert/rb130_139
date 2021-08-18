=begin
Implement a method mirroring the behavior of Enumerable#reduce
Method should take at least 1 argument, the array we need to reduce
Method should take an optional second argument representing default value for the accumulator

Enumerable#reduce:
- alias for #inject
- "fold" or "accumulate" a collection into 1 object
- the folding or accumulation mechanism depends on the code within the given block
- use case: sum up an array of integers

Example 1:
[1, 2, 3].reduce do |acc, num|
  acc + num
end

# => 6

[1, 2, 3] -> calling object (array)
reduce    -> method call
do...end  -> block

- two arguments are yielded to the block:
  - 1) accumulator object
  - 2) current element
- return value of the block is assigned to the accumulator object

Example 2:
[1, 2, 3].reduce do |acc, num|
  acc + num if num.odd?
end

# => NoMethodError: undefined method `+' for nil:NilClass

- Above, when 2 is passed to the given block, the block returns `nil` (2.odd? returns false)
- the `nil` value is then assigned to the accumulator object (acc) within the method
- we cannot add num, which references an integer, to nil, so an error is raised

Example 3:
[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end

# => 16

- reduce has the ability to initialize the accumulator to a default value
- above, we initialize the accumulator object to 10, so each iteration through the array adds the 
  current element to the accumulator, and sets the accumulator to the return value of the block

Data Structures:
Input: array, and an optional default value for the accumulator
Output: integer, representing the value of the accumulator object after iterating through the array
with the given block

Algorithm:
- Initialize an accumulator object to 0 (default) or the argument provided if this is declared
- Initialize a counter to 0
- While the counter is less that the size of the array passed as argument:
  - yield both the accumulator and the element at index counter to the given block
  - assign the return value of the block to the accumulator
  - increment the counter
- return the accumulator
=end

def reduce(array, a=0)
  i = 0

  while i < array.size
    a = yield(a, array[i])
    i += 1
  end

  a
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

=begin
- Note: using the integer 0 as default value for the accumulator object limits our capabilities for reduce
- Our elements *must* be numeric in this case (i.e. we cannot concatenate a string with 0)
- In Enumbercable#reduce, the default initial value is the first element of the collection

Algorithm:
- Initialize the accumulator to either the value passed as argument or the first element in the collection
- Initialize a counter to 1
- While the counter is less than the size of the array passed as argument:
  - yield both the accumulator and the element at index counter to the given block
  - assign the return value of the block to the accumulator
  - increment the counter
- return the accumulator
=end

def reduce2(array, default=nil)
  if default
    i = 0
    a = default
  else
    i = 1
    a = array[0]
  end

  while i < array.size
    a = yield(a, array[i])
    i += 1
  end

  a
end

p reduce2(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce2([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
