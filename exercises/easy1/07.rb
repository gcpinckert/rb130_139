=begin
Enumerable#all?
- iterates over elements in a collection
- yields current element to the given block
- if the block returns a value of true for ALL elements, returns true
- otherwise, returns false
- stops iterating once it reaches a false value
- return true for any empty collection, regardless of block
=end

def all?(collection)
  collection.each { |obj| return false unless yield(obj) }

  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true