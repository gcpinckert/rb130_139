=begin
- Write a method that takes a sorted array of integers as an arg
- Returns an array that includes all missing ints (in order)
- missing ints should be between the first and last elements of the arg
- an array that has no missing ints should return an empty array
- an array of one int should return an empty array

Examples:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
  -3, -2, *-1, *0, 1, *2, *3, *4, 5
  => -1, 0, 2, 3, 4

missing([1, 2, 3, 4]) == []
  1, 2, 3, 4
  no missing ints, return []

missing([1, 5]) == [2, 3, 4]
  1, *2, *3, *4, 5
  => 2, 3, 4

missing([6]) == []
  no missing ints return []

Algorithm:
- initialize an inclusive range from the first int to the last int in arg
- convert to an array
- iterate through the converted range, selecting only those ints that are not
  included in the array passed as arg
- return a new array of those selected ints (or empty array if none)
=end

def missing(arr_nums)
  (arr_nums[0]..arr_nums[-1]).to_a.reject do |num|
    arr_nums.include?(num)
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Option 2: using each_cons
# Initialize an empty array to hold results
# Iterate through the given arr, taking 2 number sequences from it
  # (i.e. [-3, -2], [-2, 1], [1, 5])
# Initialize a range of all ints between the 2 num in each sequence
  # ((first + 1)..(second - 1))
# Convert the range to an array
# Concatenate the resulting array with the results array
# When iteration (through the sequences) is complete, return the results array

def missing2(arr)
  result = []
  arr.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

puts "Option 2:"
p missing2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing2([1, 2, 3, 4]) == []
p missing2([1, 5]) == [2, 3, 4]
p missing2([6]) == []

# Option 3: Use upto

def missing3(arr)
  results = []
  arr[0].upto(arr[-1]) do |num|
    results << num unless arr.include?(num)
  end

  results
end

puts "Option 3:"
p missing3([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing3([1, 2, 3, 4]) == []
p missing3([1, 5]) == [2, 3, 4]
p missing3([6]) == []

# Option 4: solve without using a block
# Initialize an inclusive range that goes from the first element in the array
# to the last element in the array
# Convert the range to an array
# Subtract the array argument from the converted range

def missing4(some_nums)
  all_nums = (some_nums[0]..some_nums[-1]).to_a
  all_nums - some_nums
end

puts "Option 4:"
p missing4([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing4([1, 2, 3, 4]) == []
p missing4([1, 5]) == [2, 3, 4]
p missing4([6]) == []
