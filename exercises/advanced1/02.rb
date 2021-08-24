# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc            # => #<Proc:0x000055b34f607180 02.rb:2>
puts my_proc.class      # => Proc
my_proc.call            # => This is a . (no ArgumentError)
my_proc.call('cat')     # => This is a cat.

# line 2 - creates a Proc object with one parameter `thing`
# line 3 - outputs encoding of Proc object, shows lines of code that were
# "closed in" by closure
# line 4 - tells us Class of Proc object (Proc)
# line 5 - does not result in ArgumentError, lenient arity
# line 6 - we pass an argument, see expected output

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda            # => #<Proc:0x0000556df7beedc0 02.rb:15 (lambda)>
puts my_second_lambda     # => #<Proc:0x0000556df7beed48 02.rb:16 (lambda)>
puts my_lambda.class      # => Proc
my_lambda.call('dog')     # => This is a dog.
# my_lambda.call            
  # => ArgumentError
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
  # => NameError (uninitialized constant Lambda)

# line 16 - instantiates a special kind of Proc object known as lambda
# line 17 - instantiates a special kind of Prob object known as lambda
# lines 18-19, outputs encoding of Proc objects (with notation of lambda)
# line 20 - class of a lambda is Proc
# line 21 - we pass argument to the Proc, expected output
# line 22 - we pass no argument to the Proc, ArgumentError, strict arity
# line 24 - try to initialize a new Lambda object, Lambda is not a clas in Ruby

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
  # => This is a .
  # we can yield to the block without providing an argument (lenient arity)
# block_method_1('seal')
  # => LocalJumpError
  # we cannot call the method without passing a block
  # unless we add: yield if block_given?

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
  # => This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
  # => This is a turtle and a .
# block_method_2('turtle') { puts "This is a #{animal}."}
  # => NameError undefined local variable or method `animal`

=begin
BLOCKS:
- Have lenient arity:
  - can be executed even if expected arguments are not passed 
  - parameters in this case will reference nil
  - can be executed if not all expected arguments are passed
  - extra parameters in this case will reference nil
- Methods that expect blocks (i.e. have yield) must be passed a block
  - a yield without a guard clause (such as if block_given?) results in
    a local jump error
- Can only access values that have been passed on, or those that were
  initialized in outer scope
PROCS:
- A special kind of object in Ruby that exemplifies a closure
- Has it's own class
- Can be assigned to a variable and passed around
- Has lenient arity similar to blocks
LAMBDAS:
- A special kind of Proc object in Ruby that exemplifies a closure
- Does not have it's own class (lambdas are instances of Proc)
- Can be assigned to a variable and passed around
- Initialized with Kernel#lambda, which is equivalent to Proc.new, except the
  resulting Proc objects check the number of parameters passed when called.
- Has strict arity, must be passed the correct number of expected arguments
=end
