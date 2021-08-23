=begin
- Write a method that takes an array as an argument
- yields the contents of the array to a block
- block assigns variables in such a way that it:
  - ignores the first two elements
  - groups all remaining elements into a `raptors` array

Examples of array element assignment:
- Assign entire array to single variable:
  birds = %w(raven finch hawk eagle)
- Assign every element to a separate variable:
  raven, finch, hawk, eagle = %w(raven finch hawk eagle)
- Organize content into groups with splat operator (*)
  raven, finch, *raptors = %w(raven finch hawk eagle)
=end

def categorize(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)

categorize(birds) do |_, _, *raptors|
  p raptors
end
