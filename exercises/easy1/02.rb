=begin
- Write a method that takes an optional block.
- If the block is specified, the method executes it
- The method should return the value of the executed block
- If no block is specified, return the string "Does not compute..."

Examples:
compute { 5 + 3 } == 8
  - the method yields to the block
  - the block executes 5 + 3
  - the block returns 8, which is returned by the method
compute { 'a' + 'b' } == 'ab'
  - the method yields to the block
  - the block executes 'a' + 'b'
  - the block returns 'ab', which is returned by the method
compute == 'Does not compute.'
  - there is no block provided, a message is displayed

Algorithm:
- Check to see if a block is given
- If yes, execute the block and return it's return value
- If no, return the string "Does not compute."
=end

def compute(obj)
  block_given? ? yield(obj) : "Does not compute."
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute(2) { |n| n + n } == 4
p compute('!') { |n| "Hello" + n } == "Hello!"
p compute(nil) == "Does not compute."
