=begin
update each_cons (from 09.rb) such that it takes an argument that specifies
how many elements should be processed at a time

Input: array and n (int) representing size of combination to pass to block
Returns: nil

Algorithm:
- Iterate from 0 to size of array - n, tracking index
- yield the n-size element array starting at the current index to the block
- if only single element is needed, do not yield as array (* operator)
- return nil once iteration is complete
=end

def each_cons(arr, n)
  (0..(arr.size - n)).each { |i| yield(*arr[i, n])}
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
