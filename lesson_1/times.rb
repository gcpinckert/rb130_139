=begin
Integer#times method:

5.times do |num|
  puts num
end

# => 0
# => 1
# => 2
# => 3
# => 4
# returns 5

- first block argument is 0
- last block argument is 1 less than calling object
- returns calling object, 5

For our custom times method:

- exhibit same behavior as Integer#times
- return method argument instead of calling object

times(5) do |num|
  puts num
end

- above should have identical result as Integer#times
=end

# method implementation
def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end
  number
end

# method invocation
times(5) { |num| puts num }

=begin
EXECUTION FLOW OF CODE:

1 - Method invocation at line 42. We call the times method and pass it the
    argument 5. We also pass in an implicit block of code.
2 - Execution moves to method implementation at line 33. Local variable counter
    is initialized.
3 - Execution continues to line 4. A while conditional is evaluated.
4 - Execution continues to line 5, which yields to the given block. We pass the
    value assigned to counter to the block.
5 - The block passed to times on line 42 is executed. The value referenced by
    counter is then assigned to block parameter num
6 - We then output the value assigned to block local variable num
7 - The block finishes executing and execution moves to line 36, where counter
    is incremented by 1
8 - We reach the end of the while loop on line 37, and execution goes back to
    line 34.
9 - We repeat steps 3 - 8 until the while conditional returns false
10- Execution moves to line 37, then on to line 38
11- When we reach the end of the method on line 39, execution returns the last
    expression in the method, the value referenced by local variable number
=end

=begin
TWO SEPARATE ROLES:
- `times` method implementor and the user of the `times` method
- i.e. the person we are when we write the method (definition) and
  the person who may or may not be us when we invoke the method

ISAAC: Implementer
- wants to write a generic times method
- doesn't know if method user's will output values, add them together, whatever
- concerned with writing a generic method that iterates up to a certain number
- blocks allow users of this method to perform some action, whatever it may be
- he doesn't know what that action is
- his responsibility is to yield to the block, and pass the current number

UNI: User
- in her code, needs to iterate up to a certain number
- find's `times` method and it fits her needs
- reads documentation and finds examples
- learns she needs to pass an argument and a block that takes that argument
- the argument to the block is going to be a num from 0 -> 1 less than argument
  num she passed to the method (as implemented above)

Note that for the previous two courses we have been on the U side of things.
Now we are going to move over to the I side, and implementing types of more
generic methods.
=end