# Write a minitest assertion that will fail unless:
  # employee.hire raises a NoExperienceError exception

require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def initialize
    @experience = false
  end

  def hire
    raise NoExperienceError unless @experience
  end
end

class EmployeeTest < Minitest::Test
  def setup
    @joe = Employee.new
  end

  def test_hire
    assert_raises(NoExperienceError) { @joe.hire }
  end
end