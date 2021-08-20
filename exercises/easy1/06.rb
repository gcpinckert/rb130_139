=begin
Enumerable#any?
- iterates through a collection
- yields each element to a block
- returns true if the block ever returns a truthy value
- otherwise, returns false
- stops iteration as soon as it hits a truthy value

Custom any?
- takes an array as argument, and a block
- returns true if the block returns true for any of the element values
- otherwise, returns false
- if array is empty, return false regardless of block
- do not use any of the std ruby methods all? any? none? or one?

Algorithm:
- if the array is empty, return false
- iterate through the collection, and yield each element to the block
- return true if the block ever returns true
- if we finish iterating and we haven't returned, return false
=end

def any?(array)
  array.each do |obj|
    return true if yield(obj)
  end

  false
end


p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
