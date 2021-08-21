# Write a test that will fail if:
  # list and the return value of list.process are different objects

require 'minitest/autorun'

class Thing
  def process
    self
  end
end

class SameTest < Minitest::Test
  def setup
    @list = Thing.new
  end

  def test_process
    assert_same(@list, @list.process)
  end
end
