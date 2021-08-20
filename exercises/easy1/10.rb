=begin
- Write a method that takes an array as argument
- Should also take a block
  - returns true or false depending on the value of the array element passed
- return a count of the number of times the block returns true
- do not use Array#count or Enumberable#count

Algorithm:
- Initialize a counter to 0
- Iterate through the elements in the given collection
- Yield each element to the given block
- If the block returns true, increment the counter
- Once iteration is complete, return the counter
=end

def count(collection)
  counter = 0
  collection.each do |obj|
    counter += 1 if yield(obj)
  end
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Further Exploration
# do not use each, loop, while, or until

def count2(arr)
  counter = 0
  0.upto(arr.size - 1) do |i|
    counter += 1 if yield(arr[i])
  end
  counter
end

puts "Option 2:"
p count2([1,2,3,4,5]) { |value| value.odd? } == 3
p count2([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count2([1,2,3,4,5]) { |value| true } == 5
p count2([1,2,3,4,5]) { |value| false } == 0
p count2([]) { |value| value.even? } == 0
p count2(%w(Four score and seven)) { |value| value.size == 5 } == 2
