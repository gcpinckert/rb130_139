=begin
Enumerable#count
- iterates over items in a collection
- yields each item to the given block
- returns an integer, the number of items for which the block returns truthy

Custom count:
- takes 0 or more (any num) arguments
- takes a block
- returns the total number of arguments for which the block returns true
- return 0 if there are no arguments
- Allowed methods: each, each_with_object, each_with_index, inject, loop,
  for, while, until. All other iteration methods are not allowed.

NOTE: use the method param *args. args w/in the method then becomes a local
variable which references an array containing all arguments passed

Algorithm:
- Initialize a counter to 0
- Iterate through the array of arguments (args)
  - Yield the current argument to the given block
  - Increment the counter by 1 if the block returns true
- Return the counter
=end

def count(*args)
  counter = 0
  args.each do |val|
    counter += 1 if yield(val)
  end

  counter
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
