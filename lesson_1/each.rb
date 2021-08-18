=begin
Array#each:

[1, 2, 3].each { |num| puts num } # => returns original calling array

- iterate through the array
- yield each element to the block (as an argument)
- the block will then do whatever it needs to the element
- return the original calling object
  * we want this capability so we can use each in a method chain:
  [1, 2, 3].each{|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3]
=end

def each(array)
  i = 0
  loop do
    break if i >= array.size
    yield(array[i])           # yield to the block, passing current ele
    i += 1
  end

  array                       # return original array passed as argument
end

p each([1, 2, 3, 4, 5]) { |num| puts num }

=begin
- the method doesn't implement what action to perform when iterating through
  the array
- in fact, the action doesn't matter
- the method focuses solely on iterating and nothing beyond that
- method callers can add additional implementation details at invocation
- this is achieved by passing a block as argument
- we execute the block by using yield within the implementation of the method
- implementation passes the current element of the loop to the block
- we use a simple counter (i) to achieve this
- we pass the current value to the block, and execution moves to the block
- then execution moves back to the method, and increments the counter
- loop continues to the next element in the collection
- this is again yielded to the block, etc...
=end
