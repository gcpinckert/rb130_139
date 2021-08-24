=begin
& in a method definition -> 
  - expects to be passed a block
  - converts the block to a Proc object
  - allows us to write methods with an explicit block parameter
& in a method invocation ->
  - expects a Proc object as operand
  - converts the Proc to a block (used as the block for the calling method)
  - if operand is a symbol, it will call Symbol#to_proc to convert to Proc
    then convert the resulting Proc to a block
You can also apply the & operator to an object containing a Method
  - when this occurs Ruby calls Method#to_proc

Using the given code, convert an array of integers to base 8 (octal numbers)

- You can use Integer#to_s to contain the string representation of an integer
  with any base (2-36): integer.to_s(base = 10) => string
- Object#method(sym) => method
  - Looks up the named method as a receiver in obj, returns a Method obj
  - Method obj acts as a closure
  - Method implements to_proc method so it can be used with iterators

Algorithm:
- convert given integer to string representation of base 8 num
- convert that string back to an integer
- 
=end

def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc)
# => [10, 12, 14, 16, 20, 41]