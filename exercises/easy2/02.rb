=begin
Array#zip
- takes two arrays
- combines them into a single array
- each element is a 2 element array
  - the first element is a value from one array
  - the second element is a value from the second array
  - these values are in order
Ex. [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

Custom zip:
- takes two arrays as arguments
- returns a new array (original arrays should not be changed)
- both input arrays have same number of elements

Algorithm:
- Initialize an empty array to hold results
- Initialize a counter to track index
- Iterate loop from counter to size of arrays - 1
  - get the element from array 1 at index counter
  - get the element from array 2 at index counter
  - put the two elements together in an array [arr1, arr2]
  - add that array to the results array (as a nested array)
- When iteration is complete, return the nested array
=end

def zip(arr1, arr2)
  zipped = []
  i = 0

  while i < arr1.size
    zipped << [arr1[i], arr2[i]]
    i += 1
  end

  zipped
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

=begin
Simplified and refactored:

def zipper(arr1, arr2)
  result = []
  arr1.each_with_index do |obj, i|
    result << [obj, arr2[i]]
  end
  
  result
end

Simplified further:
def zipper(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(obj, i), result|
    result << [obj, arr2[i]]
  end
end
