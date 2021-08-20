=begin
Enumerable#none?
- iterates over each element in the given collection
- passes element value to the given block
- returns false if the block ever returns true
- stops iterating the first time the block returns true
- returns true for empty collection regardless of block
=end

def none?(collection)
  collection.each { |obj| return false if yield(obj) }
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

# Option 2: using any?

# We could implement our none? method like this:
# !any?(collection, &block)

# to do so, we need to explicitly pass the block to any?
# blocks are not passed down the calling chain by default
# to pass a block to another method during implementation:
# require a block argument with a & as shown:

# def none?(collection, &block)
#   !any?(collection, &block)
# end
