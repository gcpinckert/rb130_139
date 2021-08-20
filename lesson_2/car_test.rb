require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  # extract any setting up of objects to setup method
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_args
    assert_raises(ArgumentError) do
      # the following statement raises an ArgumentError, so the code passes
      Car.new(name: "Joey")
    end
  end

  # this test is most useful when dealing with inheritance
  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  # assert_includes calls assert_equal in its implementation
  # Minitest will report 2 assertions rather than 1
  # i.e. 6 tests, 7 assertions, 0 failures, 0 errors, 0 skips
  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end

  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end