# Blocks

- [Closures](#closures)
- [What are blocks?](#what-are-blocks?)
- [Writing methods that take blocks](#writing-methods-that-take-blocks)

## Closures

A **closure** is an abstract programming concept that exists across multiple languages. It refers to a "chunk of code" that can be saved, somehow, and executed at a later time, possibly from a different location. Closures work by **binding** their _surrounding artifacts_, which can include variables, methods, objects, or other pieces of data and code.

This **binding** creates an _enclosure_ around all the artifacts so that they can be referenced at such a time as the closure is executed. That means that closures can use and even update local variables that are in scope for them when they are executed, _even if the call for execution comes from a place in the code where these variables are not in scope_.

![Closure](./closures.jpg)

Above, you can see how a closure (in this case, a block) binds surrounding local variables and references them during execution. The block itself begins with the `do` keyword and contains all the code up until the `end` keyword. Note that within our block implementation, we have access to the local variable `results`, which was initialized on line 6 to the value `['']`. This is because blocks have access to variables initialized in outer scope. The closure created by the block can retain a memory of this variable and its value via a binding.

When we invoke this block from within the `for_each_in` method with the `yield` statement on line 2, we can still access the local variable `results`, even though it is never passed into the method. This works because the block passed to `for_each_in` represents a closure, and binds the local variable `results` to itself.

The code within the block mutates this array, adding the value referenced by `total` as a new element for each iteration through the block. Therefore, when we output the `results` array on line 13, we will see the updated value `["", "a", "ab", "abc", "abcd", "abcde"]`.

In Ruby, **blocks**, **Procs**, and **lambdas** are all ways to implement a closure. Note that a `Proc` is an actual object instantiated from the `Proc` class, a lambda is really a special kind of these `Proc` objects, and a block _is not an object_.

A block isn't an object, so it isn't a value that we can return. However, a `Proc` _is_ an object, it's an instance of the `Proc` class. It's also a closure. That means we can actually assign closures to variables and pass them around. It also means that we can return them from either a method or a block.

![Method returning a closure](./closures_2.jpg)

Above, we define the method `alphabet` such that it returns a `Proc` object. This `Proc` forms a closure with local variables `counter` and `alphabet`. We invoke this method on line 14 and assign the returned `Proc` to the local variable `alpha1`. Now that the `Proc` is captured by a variable, we can invoke it whenever we want with the `Proc#call` method.

When we execute the `Proc`, it has its own private copy of `counter` and `alphabet`. The copy of `counter` gets incremented, but only for this particular `Proc` object. This is evident by the fact that we progress through the letters of the alphabet with each time we invoke the `Proc`.

We also have the capability to invoke `alphabet` again and return a new `Proc` object. When we call `alphabet` and assign the return value to `alpha2` on line 24, it represents a second instance of `Proc` that has its own separate copy of local variables `counter` and `letters`. Therefore, when we invoke `Proc#call` on it, we begin again with the letter `'a'`, because `counter` references `0`. In `alpha1`, on the other hand, we will get `'d'` by invoking the `Proc`, because in that case `counter` points to `3`.

## What are Blocks?

In Ruby, **blocks** are sections of code that are surrounded by `do...end` or `{ .. }`. They are passed as arguments to a method call. Any method can accept an implicit block, but only those that implement their execution with some sort of call to `yield` will execute the code inside the given block. How the method which takes the block is implemented determines how the return value of the block is used, if at all.

```ruby
# each executes a given block, but ignores its return value
['a', 'b', 'c'].each { |letter| puts letter.upcase }
# outputs: A B C each on a new line
# => ['a', 'b', 'c']

# times executes a given block, but ignores its return value
3.times { |i| i += 5 }
# => 3

# upcase can take a block, but it will not execute it
letter = 'a'
letter.upcase { puts letter }
# no output, the block is not executed
# => 'A'

# map executes a given block, uses the return value for transformation
['a', 'b', 'c'].map { |letter| letter.upcase }
# => ['A', 'B', 'C']

# select executes a given block, uses the return value for selection
['a', 'B', 'c'].select { |letter| letter =~ /[a-z]/ }
# => ['a', 'c']
```

Documentation tells us which methods can utilize a block, and how that block is used by the method.

## Writing Methods that take Blocks

To define a method that takes a block, utilize the keyword `yield`. This will execute any block that gets passed to the method in question as an argument. Ostensibly, it allows any other person, whether another developer or yourself in the future, to "inject" a section of code into the method that you have defined.

```ruby
def execute_block
  puts "Oh, did someone pass me a block?"
  yield
  puts "Cool! Well done!"
end

execute_block { puts "Yes sir, and here I am!" }

# => "Oh, did someone pass me a block?"
# => "Yes sir, and here I am!"
# => "Cool! Well done!"
```
