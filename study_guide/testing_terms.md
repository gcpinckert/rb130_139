# Testing Vocab

- [Assertion](#assertion)
- [Code Coverage](#code-coverage)
- [DSL (Domain Specific Language)](#dsl)
- [Equivalence](#equivalence)
- [Minitest](#minitest)
- [Refutations](#refutations)
- [Regression](#regression)
- [SEAT Approach](#seat-approach)
- [simplecov](#simplecov)
- [Skip](#skip)
- [Test](#test)
- [Test Suite](#test-suite)
- [Unit Testing](#unit-testing)

## Assertion

**Assertion** = the part of a [test](#test) which confirms that the results we are getting from the interface being tested match what is expected. With an assertion, we first give it the value that we expect the code being tested to return, then we give it the code we want to test. An assertion will compare the expected value with the value returned by the code in a number of ways. Ostensibly, they represent _what you are trying to verify_.

Common Assertions:

```ruby
assert(obj, [error message])
assert_raises(ErrorType) { ... }
assert_equal(expected, actual) # value equivalence #==
assert_includes(collection, object) #include?
assert_instance_of(class, object)
assert_in_delta(3.145, Math::PI, 0.001)
assert_empty(collection) #empty?
assert_nil(obj) #nil?
assert_same(array, array.sort!) # object equivalence
assert_match(regex, obj)
```

Look up more assertions [here](http://docs.seattlerb.org/minitest/Minitest/Assertions.html).

## Code Coverage

**Code Coverage** = tells you how much of the code that the program consists of is actually tested in the test suite. Bases it's percentage on _all_ code, including both public and private interfaces.

100% code coverage is only achieved when _every single method_, including private methods, are tested in the testing suite. 100% code coverage does not necessarily mean you have perfect code. This only means that you have tested all the methods in the code base, not that you've considered all the edge cases or revealed potential bugs. It's a tool used to gauge code quality but it's not perfect.

Further, while you _can_ always get up to 100% code coverage it's not always necessary. The more _fault tolerant_ your code should be, the higher the necessary coverage.

## DSL

**DSL** or **Domain Specific Language** = a higher level language built with a _general purpose language_ that helps solve a problem within a specific domain. That is, it has a specialized and specific application. Some examples of this in Ruby include RSpec, which has a domain specific to testing, and Rails, which has a domain specific to setting up web applications.

## Equivalence

Different [assertions](#assertions) use different methods to test for equality:

`assert_equal` tests _value equality_. That is, it uses the `#==` method defined for the object in question to ascertain if two objects have equivalent values.

`assert_same` tests _object equality_. That is, it tests to ensure that two objects are the same object in memory. Two different objects with two equivalent values will not be considered equal in this case.

Because `assert_equal` uses the `#==` method to determine value equivalence, if the objects being tests are custom defined objects, we need to ensure that a custom `#==` has been implemented for the objects in their class. This is because the inherited `BasicObject#==` method checks for _object equality_, which is not necessarily the goal here.

Trying to use `assert_equal` without a custom `#==` method defined for the object in question may result in an error message from Minitest. This message will direct you to the implementation of `#==` to the class in question.

## Minitest

**Minitest** = a Ruby gem that helps us with [unit testing](#unit-testing). Minitest is the default testing library that comes with Ruby. It's an easy and simple way to begin setting up automated tests. Unlike other testing tools like RSpec, Minitest allows us to write tests in ordinary Ruby code, and not rely on a [DSL](#dsl).

Minitest has 2 different syntax options:

- _assert-style_: uses regular Ruby code, more intuitive for beginning Ruby developers. Writes a series of methods beginning with `test_` to test certain aspects of code, each method may contain one or more [assertions](#assertion).
- _expectation_ or _spec-style_: more in line with RSpec testing style. Groups tests into `describe` blocks and writes individual tests with the `it` method. Uses expectation matchers instead of assertions.

When minitest runs tests it will give you one of 4 outputs:

- `.` = the test passed successfully
- `F` = the test failed
- `S` = the test was skipped
- `E` = the program raised and error and stopped execution

## Refutations

**Refutations** are the opposite of [assertions](#assertions). That is, instead of confirming that an arbitraty expected value is in line with some value returned by an execution of code, they confirm that these two results are _not_ in line with each other. Where as assertions _assert_ (prove an expression to be true), refutations _refute_. They prove an expression to be _false_.

Take, for example, `refute_equal`. `assert_equal` asserts that the expected value and the result of the executed code are equal (using `#==`). `refute_equal` on the other hand, expects the value given and the result of executed code to be _not equal_.

Every assertion has a corresponding refutation. The corresponding refutation takes the exact same arguments as the assertion, except looks for a false of falsey result.

## Regression

**Regression** = A type of bug in software that occurs after the program in question has been working already. Typically, it describes a bug that is introduces with some kind of change to the code base. These changes can include adding new features/functionality or any kind of refactoring.

There are three types of regression:

- _Local Regression_: refers to a bug that is introduced by and included in any changes or additions to code.
- _Remote Regression_: refers to a change in one part of the code that causes a different part (such as a separate module or class) of the code to break.
- _Unmasked Regression_: refers to a bug that is revealed by a change to code, where the bug existed before the change but didn't previously affect the program or functionality.

## SEAT Approach

The **SEAT Approach** describes a common algorithm used for writing tests.

1. **S** - **set up the necessary objects(s)**

    Instead of running any repeated "set up" steps for each of our test methods, we can extract these repeated steps into a method that gets executed before the running of each test. In [Minitest](#minitest) this is acheived by using the `setup` instance method, which will automatically run before each of the `test_...` methods. This is a good place to put something like object instantiation. By assigning objects to an _instance variable_, you ensure that they are available throughout the rest of the `test_` methods in the testing class.

2. **E** - **execute the code against the object to test**

    This is where any code that you need to execute in order to test it gets run. For example, let us say that we want to ensure that `2 + 2` is equal to `4`. In order to test this, we will have to run the statement `2 + 2`, and then test the results against our expected value `4` in an assertion. Sometimes, code that needs to be executed is simple enough to run within the assertion itself, such as the above example. Other times, it may require multiple steps, and it is better to run it outside of the assertion and save the result in a local variable for comparison.

3. **A** - **assert the results of the execution**

    This is where our assertions come in. We either _assert_ or _refute_ the results of our executed code with the expected results, to determine if the behavior of our program is in line with the particular "rule" we have defined for this particular test. This might be to see if a calculated value is equal to an expected one, if a certain action raises a certain error, to ensure that an object is instantiated properly, or any number of different things.

4. **T** - **tear down and clean up lingering artifacts**

    Similar to the _set up_ step, we may also need a _teardown_ step. This gets run after the execution of each test in our testing class. In [Minitest](#minitest) we can define our "teardown" steps in a `teardown` method. Actions that we might complete here include cleaning up and deleting any files, logging results, or closing database connections.

## simplecov

The `simplecov` Ruby gem is a [code coverage](#code-coverage) testing tool. Install it with the command `gem install simplecov`. Include the following lines at the top of your test file:

```ruby
require 'simplecov'
SimpleCov.start
```

When run, it will generate a file within a `coverage` directory that details all the metrics of your code coverage.

## Skip

The `skip` keyword is a special keyword we can use with [Minitest](#minitest) test. It tells minitest to skip to the next test when it encounters it. This will be reported in the output of minitest with an `S`. We have the ability to pass a string into `skip` should we want to display a custom message.

## Test

**Test** = a situation or context in which tests are run. A test ensures that a single "rule" about the interface in question is being upheld. For example, a test can ensure you get an error message about trying to log in with the wrong password, or be as simple as ensuring that an instantiated object exists.

A test is made up of one or more [assertions](#assertion)

## Test Suite

**Test Suite** = refers to _the entire set of tests_ that accompany an application or program. This can include _unit tests_, _integration tests_, _regression tests_, and a number of other things. Basically, includes **all** the tests involved with a project.

## Unit Testing

**Unit Testing** = automated tests that are designed and run in order to ensure that the smallest possible "unit" of a program is functioning as intended. In OOP, this "unit" usually consists of a singe interface, as in that of a class.

The goal of unit testing is to ensure that each isolated piece of a program is functioning correctly.By using individual **assertions**, it provides a written contract that the interface in question must satisfy. We can build "units" based on this contract. Once all the tests pass, we consider the interface in question to be complete.

Further, we can run these tests each time a change is made, to ensure that the unit in question continually fulfills its obligations and no regression occurs.
