=begin
- create a new Enumerator object
- may define what values are iterated upon
- Enumerator can iterate over an infinite list of factorials
- test it by printing out the first 7 factorial values, starting with 0 factorial

Print the first 7 factorial values:
- use an EXTERNAL ITERATOR
- Enumerator.new takes a block
  - the block tajes a "yielder" object as block parameter
  - 'yields' a value by calling yield method

- Enumerable#take(n) -> array
  - Returns the first n elements from an enumerator
=end

factorials = Enumerator.new do |yielder|
  product = 1
  number = 0
  loop do
    product = number == 0 ? 1 : product * number
    yielder << product
    number += 1
  end
end

p factorials.take(7)
puts

# using external iterator factorials.next
# returns the next object in the enumerator and moves the internal position forward
7.times { |n| puts "The result of #{n}! is #{factorials.next}"}
puts 

# print three more factorials (incorrect answers)
3.times { |n| puts "The result of #{n}! is #{factorials.next}" }
puts

# reset Enumerator with #rewind
# rewinds the enumeration sequence to the beginning
factorials.rewind
# now this will be correct again
7.times { |n| puts "The result of #{n}! is #{factorials.next}"}
puts

# Using internal iteration
factorials.take(7).each_with_index { |f, i| puts "#{i}! = #{f}" }
