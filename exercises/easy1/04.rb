=begin
- Write a method that takes one arg: a positive int
- Returns a list of all divisors of arg
- The return value does not have to be sorted
- A divisor = number that divides evenly into another number
  (i.e. 2 is a divisor of 4)

Examples:
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

Algorithm:
- Initialize an empty array to hold the results
- Iterate from 1 upto the number that is passed in as arg
  - Divide the num passed in as arg by the current num
  - If there is no remainder, add the current num to the results array
- Return the results array
=end
require 'time'

def divisors(final_num)
  results = []
  1.upto(final_num) do |num|
    results << num if final_num % num == 0
  end
  results
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Further Exploration: improve the algo for efficiency
