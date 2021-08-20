=begin
Enumerable#max_by:
- iterates over items in the calling collection
- yields each item to the given block
- returns the element for which the block returns the highest value

Custom max_by:
- should behave similar to above
- takes an array and block as arguments
- returns the element for which the block returns the highest value
- if array is empty, return nil
- Allowed methods: each, each_with_object, each_with_index, inject, loop,
  for, while, until

Algorithm:
- Initialize a max val variable to the first element in the array yielded
- Initialize a max ele variable to nil
- Iterate through the array
  - If the return val of the current element yielded > max val
    - reassign the max val variable to return val
    - reassign the max ele to current ele
- Return max ele
=end

def max_by(arr)
  return nil if arr.empty?

  max_ele = arr[0]
  max_val = yield(max_ele)

  arr.each do |ele|
    current_val = yield(ele)
    if current_val > max_val
      max_ele = ele
      max_val = current_val
    end
  end

  max_ele
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
