=begin
Range#step
- iterates over a range of values
- each value in the iteration is the previous value plus a "step" value
- returns the original range

- Write a method that does the same thing as Range#step
- Does ot operate on a range
- Method should take 3 arguments:
  - Starting value
  - Ending value
  - Step value to be applied to each iteration
- Method should take  block to which it will yield successive iteration vals
- Return the original starting and ending values in an array (mimics range)

Algorithm: 
- Initialize a counter to the start value
- While the counter is less than or equal to the end value
  - yield the counter to the block
  - increment the counter by the step value
- return the original starting and ending values as an array
=end

def step(start, finish, step)
  counter = start
  while counter <= finish
    yield(counter)
    counter += step
  end
  [start, finish]
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# Outputs:
# value = 1
# value = 4
# value = 7
# value = 10