=begin
Enumerable#one?
- iterates through each element in the given collection
- yields the current element to the given block
- returns true if the block returns true exactly once
- otherwise, returns false
- stops iterating the second time the block returns true
- if array is empty, returns false

Algorithm:
- Initialize a counter to 0
- Iterate over the given collection
  - Yield the current element to the block
  - Increment the counter if the block returns true
  - Return false if the counter becomes greater than 1
- Return true if the counter is equal to 1
=end

def one?(collection)
  counter = 0
  collection.each do |obj|
    counter += 1 if yield(obj)
    return false if counter > 1
  end

  counter == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false
